#!/usr/bin/env bash
set -euo pipefail

CONFIG_DIR=".idea/runConfigurations"
FLAGS="-XX:+AllowEnhancedClassRedefinition -XX:+ClassUnloading"

if ! command -v xmlstarlet >/dev/null 2>&1; then
  echo "No xmlstarlet"
  exit 1
fi

JAVA_BIN=$(command -v java || true)
JBR_PATH="${JAVA_BIN%/bin/java}"

if [ -z "$JAVA_BIN" ] || [ ! -x "$JAVA_BIN" ]; then
  echo "No jdk"
  exit 1
fi

# Mixin library
MIXIN_JAR=$(find ~/.gradle/caches/modules-2/files-2.1/net.fabricmc/sponge-mixin/ -name "*.jar" ! -name "*-sources.jar" ! -name "*-javadoc.jar" | head -n1)

if [ -z "$MIXIN_JAR" ]; then
  echo "No mixin jar found. Build project first"
  exit 1
fi

AGENT="-javaagent:$MIXIN_JAR"

echo "Using JetBrains JDK: $JBR_PATH"
echo "Using Mixin jar: $MIXIN_JAR"
echo "Patching run configurations in $CONFIG_DIR..."

if [ ! -d "$CONFIG_DIR" ]; then
  echo "no intellij run configurations"
  exit 1
fi

for file in "$CONFIG_DIR"/*.xml; do
  echo "Patching $file..."

  # Get current VM parameters (or set blank)
  CURRENT=$(xmlstarlet sel -t -v "/component/configuration/option[@name='VM_PARAMETERS']/@value" "$file" 2>/dev/null || true)
  UPDATED="$CURRENT"

  # Remove any existing sponge-mixin javaagent flags
  UPDATED=$(echo "$UPDATED" | sed -E 's#-javaagent:[^ ]*sponge-mixin[^ ]*##g')

  # Ensure flags are present
  [[ "$UPDATED" != *"$FLAGS"* ]] && UPDATED="$UPDATED $FLAGS"

  # Append current AGENT exactly once
  UPDATED="$UPDATED $AGENT"

  # Clean up whitespace
  UPDATED=$(echo "$UPDATED" | xargs)

  # Set or update the VM_PARAMETERS option
  if xmlstarlet sel -t -c "/component/configuration/option[@name='VM_PARAMETERS']" "$file" | grep -q "option"; then
    xmlstarlet ed --inplace \
      -u "/component/configuration/option[@name='VM_PARAMETERS']/@value" \
      -v "$UPDATED" \
      "$file"
    echo "  ✅ Updated VM_PARAMETERS"
  else
    xmlstarlet ed --inplace \
      -s "/component/configuration" -t elem -n "__TEMP__" -v "" \
      -i "//__TEMP__" -t attr -n "name" -v "VM_PARAMETERS" \
      -i "//__TEMP__" -t attr -n "value" -v "$UPDATED" \
      -r "//__TEMP__" -v "option" \
      "$file"
    echo "  ✅ Added VM_PARAMETERS"
  fi

  # Set ALTERNATIVE_JRE_PATH and enable it
  if xmlstarlet sel -t -c "/component/configuration/option[@name='ALTERNATIVE_JRE_PATH']" "$file" | grep -q "option"; then
    xmlstarlet ed --inplace \
      -u "/component/configuration/option[@name='ALTERNATIVE_JRE_PATH']/@value" \
      -v "$JBR_PATH" \
      "$file"
    echo "  ✅ Updated ALTERNATIVE_JRE_PATH"
  else
    xmlstarlet ed --inplace \
      -s "/component/configuration" -t elem -n "__TEMP_JDK__" -v "" \
      -i "//__TEMP_JDK__" -t attr -n "name" -v "ALTERNATIVE_JRE_PATH" \
      -i "//__TEMP_JDK__" -t attr -n "value" -v "$JBR_PATH" \
      -r "//__TEMP_JDK__" -v "option" \
      "$file"
    echo "  ✅ Added ALTERNATIVE_JRE_PATH"
  fi

  if ! xmlstarlet sel -t -c "/component/configuration/option[@name='ALTERNATIVE_JRE_PATH_ENABLED']" "$file" | grep -q "option"; then
    xmlstarlet ed --inplace \
      -s "/component/configuration" -t elem -n "__TEMP_EN__" -v "" \
      -i "//__TEMP_EN__" -t attr -n "name" -v "ALTERNATIVE_JRE_PATH_ENABLED" \
      -i "//__TEMP_EN__" -t attr -n "value" -v "true" \
      -r "//__TEMP_EN__" -v "option" \
      "$file"
    echo "  ✅ Enabled ALTERNATIVE_JRE_PATH"
  fi

done

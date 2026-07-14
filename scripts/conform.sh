find lua/conform/formatters -name '*.lua' \
  -printf '%f\n' \
  | sed 's/\.lua$//' \
  | sort \
  | awk '{print "  " $1 " = { command = \"\"; };"}'

#
# This is a simple awk program which will generate defaultstring.cc
# from an X resource file.
#

#
# insert the "header" for defaultstring.cc
#
BEGIN {
  print "//";
  print "// Do not edit this file.";
  print "// This file is generated automagically from Xdefaults";
  print "// using the awk program found in defresources.awk.";
  print "// This file will be rebuilt when Xdefaults is modified.";
  print "//\n";
  printf "const char *defaultXResourceString = \"";
}

#
# Echo each line of input (that is not a comment or empty) to stdout.
#
(! /^!/) && (NF != 0) { printf "%s\\n\\\n", $0 }

#
# Insert the "tail" for defresources.cc
#
END {
  print "\";\n";
}

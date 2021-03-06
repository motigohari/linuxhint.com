#!/bin/bash
## test-export-all-variables
## version 0.0.1 - initial
##################################################
A=
B=
C=
test-export-all-variables() {
  local a
  local b
  local c
  local variable
  local temp
  temp=$( mktemp )
  _() {  # get list variables to export
   declare -p | grep -v -e '-x' -e '[A-Z_]\+=\?' -e '^"$' -e 'variable' | cut '-d ' '-f3' 
  }
  local variable
  for variable in $( _ | tee ${temp} )
  do
   export ${variable}
  done
  declare -xp $( cat ${temp} )
}
##################################################
if [ ${#} -eq 0 ] 
then
 true
else
 exit 1 # wrong args
fi
##################################################
test-export-all-variables
##################################################
## generated by create-stub2.sh v0.1.2
## on Sun, 07 Jul 2019 17:01:38 +0900
## see <https://github.com/temptemp3/sh2>
##################################################

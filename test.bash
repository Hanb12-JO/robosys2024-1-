#!/bin/bash -xv
# SPDX-FileCopyrightText: 2024 Abdelrahman Alhanbali <abdelrahman.alhanbali@gmail.com>
# SPDX-License-Identifier: BSD-3-Clause

ng () {
	echo ${1}が違うよ。
	return=1
}

return=0
	### NORMAL INPUT ###
out=$(seq 5 | ./plus)
[ "${out}" = 15 ] || ng "$LINENO"
	
### STRANGE INPUT ###
out=$(echo あ| ./plus)
[ "$?" = 1 ] || ng "$LINENO"	
[ "${out}" = "" ] || ng "$LINENO"
 
out=$(echo | ./plus)
[ "$?" = 1 ] || ng "$LINENO"	
[ "${out}" = "" ] || ng "$LINENO"

[ "$return" = 0 ] && echo OK
exit $return

#!/bin/ksh

#
# Given an HTML file, will drop the first 9 lines and last 7 line. And will
# save (print) the ninth line (the title). Will also remove lines 10, 11, and
# 12.
#

#source /depot/synthesis/footprint/tools/common.ksh

file=$1
#if [[ ! -d scrubbed ]]; then
	#mkdir scrubbed
#fi
out="$file.temp"
touch $out

lines=$( wc -l $file | awk '{print $1;}' )
cat $file | nawk -v "out=$out" -v "ln=$lines" -f scrub.awk
mv $out $file
cat $file | sed 's/<p>/<p>\
/g' | sed 's/<\/p>/\
<\/p>/g' | awk -f unline_aux.awk > $file.temp

mv $file.temp $file

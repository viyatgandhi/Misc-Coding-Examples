
#!/bin/bash

#
# Smaple bash script showing connection to Database,
# taking input from .txt file and using awk and sed commands
# Purpose of the script is use to generate large .txt file used for performance testing based on certain parameters and requirements
# Required parts are modified/replaced as not to break or void NDA.
# Script is only used for internal purpose and does not count towards production code.

for i in {1..700}
do
sqlplus -s -L $DATABASE <<EOF >>timeincnewp.txt
set linesize 10000
set pagesize 0
set echo off
set feedback off
set trimspool on
set heading off
set verify off
set termout on
set pages 50000
set newpage none
SELECT
RTRIM(TO_CHAR(TO_DATE ( '1504011345', 'YYMMDDHH24MI' )+ $i/(24*60), 'YYMMDDHH24MI_DD' ))
||','||
RTRIM(TO_CHAR(TO_DATE ( '01-14-36-21' ,'DD-HH24-MI-SS')+$i/(24*60*60), 'DD-HH24-MI-SS' ))
|| '.00'
FROM Dual;
EOF
done

b_seq=1
b_call_inc="801036069924"

for inputrec in `cat timeincnewp.txt`
do

rec=`echo $inputrec | cut -d "," -f1`
new_date=`echo $inputrec | cut -d "," -f2`

b_time_all="1506011345_01"
b_time_date="01-14-36-21.00"

# inputevent1.txt was sample input file
new_event_int=`cat inputevent1.txt |   sed 's/'"$b_time_date"'/'"$new_date"'/' | sed 's/'"$b_time_all"'/'"$rec"'/g'`

echo $new_event_int > /some_location/inputevent1_int.txt

for bseq  in {1..999}
do

new_seq=`echo $bseq | awk '{ printf "%03s\n", $1 }'`

b_seq_old="001,M"
n_seq_new="$new_seq,M"
b_call_ref="801034069924"
n_call_ref=`expr $b_call_inc + 1`

new_event_all=`cat inputevent1_int.txt |  sed 's/'"$b_call_ref"'/'"$n_call_ref"'/' | sed 's/'"$b_seq_old"'/'"$n_seq_new"'/' `

echo $new_event_all >>/some_location_new/newevent1.txt

b_call_inc=$n_call_ref

done


done

#!/bin/ksh
pid=$(ps -aef | grep runBatch.sh | grep -v grep | awk '{print $2}')
kpid=$(ps -o pid -o ppid -aef |  awk "{ if ( \$2 == $pid ) { print \$1 }}")
kill -9 $kpid
sleep 2
ps -aef | grep  $kpid | grep -v grep > /dev/null
status=$?
if [ $status -eq 1 ] 
  then
    echo "The runBatch.sh process has been successfully stopped"
else
    echo "Problems encountered stopping  runBatch.sh. Please page Invoice Adjustments oncall support"
fi

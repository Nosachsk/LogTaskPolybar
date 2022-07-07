#!/bin/sh
# Retrieve daily tasks marked as 'LATER' in the current Logseq journal page.
# Display number of tasks in polybar,
# mark the as 'DONE' directly with dmenu and notify-send.

folder='/LOCATION/OF/LOGSEQ/JOURNALS/' #Replace with correct location


today=$(date +%Y/%m/%d) 

today=${today//'/'/'_'}   #format date to match files.


# test if file exists.
if test -f $folder/$today.md; then


    menu() {
        #get content of tasks tagged with 'LATER' in today's journal
        content=$(grep -i LATER $folder/$today.md)
        task_done=$(grep -i LATER $folder/$today.md | dmenu -i -p 'Tasks:')
        marked="${task_done/LATER/DONE}"
        sed -i "s/$task_done/$marked/" $folder/$today.md
        [[ -n "$task_done" ]] && notify-send "Task done:" "\n$task_done"
    }


    trap "menu" USR1
    
    while true; do
        #get number of tasks tagged with 'LATER' in today's journal
        amount=$(grep -c LATER $folder/$today.md)
        echo $amount
    done
else
    echo "nil"
fi

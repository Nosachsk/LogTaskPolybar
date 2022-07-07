# LogTaskPolybar
Display tasks created in the daily logseq journal in a polybar module.
On left-click, select a task with dmenu and mark it as 'DONE'. Notify-send for confirmation notification.

## Dependencies
* [Polybar](https://github.com/polybar/polybar)
* [Logseq](https://logseq.com/)
* [dmenu](https://tools.suckless.org/dmenu/)(_optional_)
* [notify-send](https://man.archlinux.org/man/notify-send.1.en)(_optional_)

## Setup
* replace folder location in ``task.sh`` with the location of your Logseq journal pages.
* the script is written for the default Logseq setting. Edit accordingly if you use:
- a different date format for the journal files
- TODO/DONE rather than LATER/DONE
* if not using ``dmenu`` or ``notify-send``, remove them from the script. The polybar module will only display the number of tasks.

### Module

In your polybar modules.ini config file, add:
````
[module/task]
type = custom/script
exec = ~/.config/polybar/scripts/task.sh  ; replace with the task.sh script location.
format-prefix="Tasks: "
tail = true
click-left = kill -USR1 %pid%    ; ommit if not using dmenu and notify-send.
````
Add the module to your polybar config.ini file.

# LogTaskPolybar
Display tasks created in the daily logseq journal in a polybar module.

![task](https://user-images.githubusercontent.com/64380798/177726027-e901af62-f3fc-471c-98ac-0f5e16212331.png)


On left-click, dmenu shows current tasks marked as 'LATER'. Select a task with dmenu to mark it as 'DONE'.

![2022-07-07-103026_1366x768_scrot](https://user-images.githubusercontent.com/64380798/177728932-39bd2f01-3608-41f8-98d1-393797968a7c.png)


Notify-send sends a confirmation notification.

![2022-07-07-102417_1366x768_scrot](https://user-images.githubusercontent.com/64380798/177727795-dc13bc52-2d74-4efc-b964-69f3ec693813.png)


## Dependencies
* [Polybar](https://github.com/polybar/polybar)
* [Logseq](https://logseq.com/)
* [dmenu](https://tools.suckless.org/dmenu/)(_optional_)
* [notify-send](https://man.archlinux.org/man/notify-send.1.en)(_optional_)

## Setup
* replace folder location in ``task.sh`` with the location of your Logseq journal pages.
* the script is written for the default Logseq setting. Edit accordingly if you use:
..* a different date format for the journal files
..* TODO/DONE rather than LATER/DONE
* if not using ``dmenu`` or ``notify-send``, remove them from the script. The polybar module will only display the number of tasks.

### Module

In your polybar modules.ini config file, add:
```ini
[module/task]
type = custom/script
exec = ~/.config/polybar/scripts/task.sh  ; replace with the task.sh script location.
format-prefix="Tasks: "
tail = true
click-left = kill -USR1 %pid%    ; ommit if not using dmenu and notify-send.
```

Add the module to your polybar config.ini file.
```ini
[bar/main]
...
modules-left = task  ;for example
...
```

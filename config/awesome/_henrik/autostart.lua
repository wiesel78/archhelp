local awful = require("awful")

awful.util.spawn_with_shell("if [ -z `pgrep nm-applet` ]; then nm-applet; fi")
awful.util.spawn_with_shell("if [ -z `pgrep emacs` ]; then emacs --daemon; fi")

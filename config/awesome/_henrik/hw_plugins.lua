-- a set of hardware widgets you can include into
-- your rc.lua

local wibox = require("wibox")
local bashets = require("bashets")
local vicious = require("vicious")

module("hw_plugins")

-- a simple date widget
datewidget = wibox.widget.textbox()
function date()
   bashets.register("/usr/bin/date +'%a %d. %b %H:%M '", {
                       widget = datewidget,
                       format = " $1 $2 $3, $4 ",
                       update_time = 60})
end

memwidget = wibox.widget.textbox()
function mem()
   -- used/total*100 truncate 1 decimal place 
   bashets.register("/usr/bin/free -m | awk 'NR==2 {printf \"%2.1f\",($3/$2)*100}'",
                    {widget = memwidget,
                     format = " Mem: $1 % |",
                     --update_time = 60
   })
end

cpuwidget = wibox.widget.textbox()
function cpu()
   --bashets.register(vicious.widgets.cpu, {widget = cpuwidget, format = "$1%"})
   -- usa vicious for the moment
   vicious.register(cpuwidget, vicious.widgets.cpu, "CPU: $1% |")
end


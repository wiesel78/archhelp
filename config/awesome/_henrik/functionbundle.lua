--[[ 
Function Bundle

bundle some usefull functions together and make user configuratione easier.

You get widgets as return value.

Requires: Vicious, Bashets
--]]
local wibox = require("wibox")
local bashets = require("bashets")
local vicious = require("vicious")
local awful = require("awful")
local wp = require("wallpaperchanger")

module("functionbundle")

local functionbundle = {}

-- recursive: boolean, path: string, time: int
function functionbundle.scheduleWallpaperChanger(path, recursive, time)
   wp.init(path, recursive)
   bashets.schedule(function() wp.change_wp() end, time)
end

-- register widgets here
function functionbundle.widgets()
      return {battery(), cpu(), mem(), date()}
end

function functionbundle.autostart()
   return {function() awful.util.spawn_with_shell("numlockx on") end}
end


function date()
   datewidget = wibox.widget.textbox()
   bashets.register("/usr/bin/date +'%a %d. %b %H:%M '", {
                       widget = datewidget,
                       format = " $1 $2 $3, $4 ",
                       update_time = 60
   })
   return datewidget
end

function mem()
   memwidget = wibox.widget.textbox()
   -- used/total*100 truncate 1 decimal place 
   bashets.register("/usr/bin/free -m | awk 'NR==2 {printf \"%2.1f\",($3/$2)*100}'" , {
                      widget = memwidget,
                      format = " Mem: $1% |",
                      update_time = 60
   })
   return memwidget
end

function cpu()
   cpuwidget = wibox.widget.textbox()
   --bashets.register(vicious.widgets.cpu, {widget = cpuwidget, format = "$1%"})
   -- use vicious for the moment
   vicious.register(cpuwidget, vicious.widgets.cpu, " CPU: $1% |")
   return cpuwidget
end

function battery()
   batterywidget = wibox.widget.textbox()
   bashets.register("/usr/bin/acpi -b | cut -d , -f 2 | cut -c 2-" , {
                       widget = batterywidget,
                       update_time = 60,
                       format = " Bat: $1 |"
   })
   return batterywidget
end

return functionbundle


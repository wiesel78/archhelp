local wibox = require("wibox")
local bashets = require("bashets")

module("battery")

status = wibox.widget.textbox()
bashets.register("/usr/bin/acpi -b | cut -d , -f 2 | cut -c 2-",
    {
        widget = status,
        update_time = 60,
        seperator = '|',
        format = " Battery: $1"
    }
)



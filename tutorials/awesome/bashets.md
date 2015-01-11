# Bashets

## Install

Download bashets in your awesome config directory : 
  
```
    wget http://gitorious.org/bashets/bashets/blobs/raw/master/bashets.lua -O ~/.config/awesome/bashets.lua
```
  
## Use

Include bashets

```
    local bashets = require("bashets")
```
  
Create what ever you will do with bashets. For example a battery widget.  
  
in your rc.lua

```
    local mybatterystatus = wibox.widget.textbox()
    bashets.register("/usr/bin/acpi -b | cut -d , -f 2 | cut -c 2-",
        {
            widget = mybatterystatus,
            update_time = 60,
            seperator = '|',
            format = " Battery: $1"
        }
    )
```

and add it to your layout.  

```
    right_layout:add(mybatterystatus)
```
  
Bashets must start and stop then you will do a frequently job.  

start bashets at the end of your rc.lua

```
    bashets.start()
```
  
Create a new quit and restart function.

```
   function quit()
       bashets.stop()
       awesome.quit()
   end

   function restart()
       bashets.stop()
       awesome.restart()
   end
```

and rename all awesome.quit and awesome.restart calls with quit or restart


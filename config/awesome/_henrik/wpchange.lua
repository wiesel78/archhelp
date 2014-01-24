-- {{{ Script to set random wallpaper
-- written in pure lua
-- }}}

local math = math
local os = os
local string = string
local screen = screen
local gears = require("gears")
local lfs = require("lfs")
local beautiful = require("beautiful")

module("wpchange")

local size = 0
local wp_path = ""

-- changes the background theme with gears
-- path: folderpath
function change_wp()
   local count = 1
   math.randomseed( os.time() )
   local state = math.random(size)


   for file in lfs.dir(wp_path) do
      if (count ==  state) then
         local file_attr = lfs.attributes(wp_path.."/"..file)
         local file_mode = file_attr.mode

         if string.find(file_mode, "file") and string.match(file, "%.jpg$") then
            for s = 1, screen.count()  do
               gears.wallpaper.maximized(wp_path.."/"..file, s, true)
            end
         else
            state = state + 1
         end
      end
      count = count + 1
   end
end


-- get size of all wallpapers in dir
function init(path)
   wp_path = path
   local count = 0
   for file in lfs.dir(path) do
      count = count + 1
   end
   size = count
end

--[[ Wpchange is a script written in lua.
   Usage: Initialize this script with it's init() function.
   After that you can change the wallpaper everytime you call
   change_wp().]]

local math = math
local os = os
local string = string
local coroutine = require("coroutine")
local table = require("table")
local lfs = require("lfs")

-- awesome utils
local screen = screen
local gears = require("gears")
local beautiful = require("beautiful")
local awfule = require("awful")

module("wp_changer")

local files = {}

-- changes the background theme with gears
function change_wp( wallpaperType , backgroundColor )
    wallpaperType = wallpaperType or "fit"
    backgroundColor = backgroundColor or "#000000"
    
    math.randomseed( os.time() )
    local state = math.random(#files)

    for s = 1, screen.count()  do
        -- state + 1, cause tables start with index 1
        -- gears.wallpaper.maximized(files[state], s, true)
        if wallpaperType == "fit" then
            gears.wallpaper.fit(files[state], s, backgroundColor)
        end
    end
end


-- Search for wallpapers and store them in a set
-- We do it recursive or plane.
function init(path, recursive)
   -- if recursive flag is set we go recursive down the folder path or not if not set
   for filename in (recursive and dirtree(path) or lfs.dir(path)) do
      if string.match(filename, "%.jpg$") or string.match(filename, "%.png$") then
         table.insert(files, filename)
      end
   end
end

-- recursive iterator
function dirtree(dir)
   if string.sub(dir, -1) == "/" then
      dir=string.sub(dir, 1, -2)
   end

   local function yieldtree(dir)
      for entry in lfs.dir(dir) do
         if entry ~= "." and entry ~= ".." then
            entry=dir.."/"..entry
            local attr=lfs.attributes(entry)
            coroutine.yield(entry,attr)
            if attr.mode == "directory" then
               yieldtree(entry)
            end
         end
      end
   end

   return coroutine.wrap(function() yieldtree(dir) end)
end

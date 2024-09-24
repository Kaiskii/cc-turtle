local helper = require("lib/helper")
local args = {...}
local size_x = 11
local size_y = 0

-- Move & Dig Wrapper Function
local function move_dig (vec, reverse)
  reverse = reverse or false
  helper.move_vector(vec, reverse, turtle.dig, turtle.digUp, turtle.dig)
end

local function dig_line(z, y)
  local track_vec = vector.new(0, 0, 0);
  for i = 1, z, 1
  do
    track_vec = track_vec + vector.new(0, y, 0)
    local movement = vector.new(0, y, 1)
    move_dig(movement)
    helper.move_vector(-track_vec, true)
  end
end

local function make_room(w, isLeft)
  for i = 0, w, 1
  do    
    dig_line(size_x, size_y) -- 1
    if (isLeft) then turtle.turnLeft() else turtle.turnRight() end
    dig_line(1, size_y) -- 1.5
    if (isLeft) then turtle.turnLeft() else turtle.turnRight() end
    dig_line(size_x, size_y) -- 2
    if (isLeft) then turtle.turnRight() else turtle.turnLeft() end
    dig_line(1, size_y) -- 2.5
    if (isLeft) then turtle.turnRight() else turtle.turnLeft() end
  end
end

make_room(4, true)

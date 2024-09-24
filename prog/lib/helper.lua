TrackPos = vector.new(0, 0, 0)

local function check_fuel ()
  print('Fuel Levels:', turtle.getFuelLevel())
end

local function ret ()
end

-- z: number
-- Move Forward or Backwards
local function move_z (z, cb)
  if z == 0 then return end

  cb = cb or ret
  if (z > 0)
  then
    -- Move Forward
    for i = 1, z, 1
    do
      cb()
      turtle.forward()
      TrackPos = TrackPos + vector.new(0, 0, 1)
    end
  else
    -- Move Backwards
    for i = 1, -z, 1
    do
      cb()
      turtle.back()
      TrackPos = TrackPos - vector.new(0, 0, 1)
    end
  end
end

-- y: number
-- Move Up or Down
local function move_y (y, cb)
  if y == 0 then return end

  cb = cb or ret
  if (y > 0)
  then
    -- Move Up
    for i = 1, y, 1
    do
      cb()
      turtle.up()
      TrackPos = TrackPos + vector.new(0, 1, 0)
    end
  else
    -- Move Down
    for i = 1, -y, 1
    do
      cb()
      turtle.down()
      TrackPos = TrackPos - vector.new(0, 1, 0)
    end
  end
end

-- x: number
-- Move Left or Right
local function move_x (x, cb)
  if x == 0 then return end
  
  cb = cb or ret
  if (x > 0)
  then
    -- Move Right
    turtle.turnRight()
    for i = 1, x, 1
    do
      cb()
      turtle.forward()
      TrackPos = TrackPos + vector.new(1, 0, 0)
    end
    turtle.turnLeft()
  else
    -- Move Left
    turtle.turnLeft()
    for i = 1, -x, 1
    do
      cb()
      turtle.forward()
      TrackPos = TrackPos - vector.new(1, 0, 0)
    end
    turtle.turnRight()
  end
end

-- vec: Vector
-- reverse: Boolean
local function move_vector (vec, reverse, xcb, ycb, zcb)
  xcb = xcb or ret
  ycb = ycb or ret
  zcb = zcb or ret
  reverse = reverse or false
  check_fuel()
  if (not reverse)
  then
    move_z(vec.z, zcb)
    move_y(vec.y, ycb)
    move_x(vec.x, xcb)
  else
    move_x(vec.x, xcb)
    move_y(vec.y, ycb)
    move_z(vec.z, zcb)
  end
  check_fuel()
  print(TrackPos);
end

return { move_vector = move_vector } 
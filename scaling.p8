pico-8 cartridge // http://www.pico-8.com
version 36
__lua__
local sx, sy, sw, sh = 0, 0, 8, 8  -- source (sprite) x, y, width, height
local dx, dy, dw, dh = 64, 64, 16, 16  -- destination (screen) x, y, width, height
local flip_x, flip_y = false, false  -- whether to flip the sprite horizontally or vertically

while true do
  -- check for input and modify the sprite's position and size accordingly
  dw = dw * (btn(2) and 1.2 or btn(3) and 0.8 or 1)  -- double the width and height on up button press, halve it on down button press
  dh = dh * (btn(2) and 1.2 or btn(3) and 0.8 or 1)
  dx = dx + (btn(0) and 1 or btn(1) and -1 or 0)  -- move the sprite one pixel right on left button press, left on right button press
  dy = dy + (btn(4) and -1 or btn(5) and 1 or 0)  -- move the sprite one pixel down on z button press, up on x button press

  cls()  -- clear the screen
  sspr(sx, sy, sw, sh, dx, dy, dw, dh, flip_x, flip_y)  -- draw the sprite on the screen
  flip()  -- update the screen
end

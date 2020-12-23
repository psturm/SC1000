-- LED patern (list of LED positions to use)
--
-- Format: 
-- { {angle_offset=0, r=0, g=0, b=254}, {angle_offset=180, r=254, g=0, b=0} }
--
-- Values of single item:
--   angle_offset (0..359): 0 = current position
--   r, g, b (0..254): color value for R, G and B
PATTERN = {
  {angle_offset=0, r=255, g=0, b=0},
  {angle_offset=135, r=0, g=251, b=255},
  {angle_offset=150, r=0, g=197, b=255},
  {angle_offset=165, r=0, g=128, b=255},
  {angle_offset=180, r=0, g=67, b=255},
  {angle_offset=315, r=255, g=223, b=0},
  {angle_offset=330, r=255, g=177, b=0},
  {angle_offset=345, r=255, g=108, b=0},
}

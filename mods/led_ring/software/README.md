# Upload the software to ESP


* Adjust `config.lua` to your needs

  **Depending on the LED ring (or stripe):**
  ```lua
  -- Number of LEDs
  LED_COUNT = 24

  -- 3 for RGB strips and 4 for RGBW strips
  BYTES_PER_LED = 3
  ```

  **The light pattern:**

  Depending on your preferences how to use stickers on real vinyl (some people use 1, some people use multiple markers), you can adjust the light pattern.

  ```lua
  -- LED patern (list of LED positions to use)
  --
  -- Format: 
  -- { {angle_offset=0, r=0, g=0, b=254}, {angle_offset=180, r=254, g=0, b=0} }
  --
  -- Values of single item:
  --   angle_offset (0..359): 0 = current position
  --   r, g, b (0..254): color value for R, G and B
  PATTERN = {
    {angle_offset=0, r=0, g=0, b=254},
    {angle_offset=120, r=254, g=0, b=0},
    {angle_offset=240, r=254, g=254, b=254},
  }
  ```

  This example pattern uses 3 LEDs in parallel to mark 0°, 120° and 240° (like the Mercedes star):
  * 0° (the actual position): bright blue
  * 120°: bright red
  * 240°: white

* Upload all `*.lua` files to the ESP

  e.g. with [ESPlorer - IDE for ESP development](https://esp8266.ru/esplorer/)

* Reboot


## Concept

The ESP will listen to and execute RPC commands directly from serial port (UART 0).

The main method is to set the rotation angle and controll the LEDs accordingly to visualize this rotation angle.

To trigger it, send the following string with the `angle` as an integer of the current rotation (in degree from 0 .. 359):
```lua
r(angle)\r\n
```
_This is exactly what the SC will send via UART3(J7) then.


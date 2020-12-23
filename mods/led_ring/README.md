# LED ring mod for SC1000

This is an optional mod to add a LED ring to display the current platter position, like having a sticker on vinyl.


_embedd video_ @TODO


Required hardware:

* ESP8266 (used a dev board, but raw ESP should work too, ~$5)

* LED ring (WS2812 aka Neopixel, ~$10) 

  The more LEDs the ring has, the more precise the angle can be displayed. Tested with 24 = 15°/LED
  
  Maximum diameter of ~10cm to fit into the default case.


## Steps

* Flash the NodeMCU firmware, see [./firmware/README](./firmware/README.md)

* Upload the LUA software, see [./software/README](./software/README.md)

* Connect the hardware

    ```
    ┌──────────┐
    │ ESP8266  │             ┌───────────────┐
    ├──────────┤             │  WS2812 (LED) │
    ¦       .. ¦             ├───────────────┤
    ┤       D4 ├-------------┤ IN            │
    ┤     3.3V ├-------------┤ VCC           │
    ┤      GND ├-------------┤ GND           │
    ¦       .. ¦             └───────────────┘
    ┤     RxD0 ├----┐      ┌───────────────┐
    ┤     TxD0 ├    |      │  J7 (SC1000)  │
    ┤      GND ├----+---┐  ├───────────────┤
    ┤     3.3V ├-┐  │   └--┤GND       3.3V ├-┐
    └──────────┘ |  |      ┤UART3 RX       ├ |
                 |  └------┤UART3 TX       ├ |
                 |         ┤               ├ |
                 |         ┤               ├ |
                 |         └───────────────┘ |
                 └---------------------------┘
    ```


* Enable the mod in `settings.txt`

  ```ini
  # 1 to enable LED mod, default 0 (disabled)
  ledmodenabled=1
  ```

* [Optional] Configure the LED color and pattern

  See [software/README](./software/README.md)

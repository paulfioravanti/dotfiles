# ErgoDox EZ Personal Configuration

This is a QMK port over of [my original ErgoDox Firmware configuration][], and
all further layout tinkering will happen here.

This keymap started out with the [QMK ErgoDox EZ default keymap][], and I
further customised it from there.

## Dependencies

I use Mac OS, so the tools needed to compile the layout are listed in the
[Install Build Tools - Mac OS section][] of the QMK documentation:

```sh
brew tap osx-cross/avr
brew tap PX4/homebrew-px4
brew update
brew install avr-gcc
brew install dfu-programmer
brew install gcc-arm-none-eabi
brew install avrdude
```

In order to install compiled firmware on to the ErgoDox, install the
[Teensy Loader for Mac OS][]:

```sh
brew cask install teensy
```

## Compile

Download the [QMK Firmware][], copy this directory into it, and you should
be able to make a `.hex` firmware file:

```sh
git clone git@github.com:qmk/qmk_firmware.git
cd qmk_firmware
cp -r ~/.dotfiles/keyboards/ergodox_ez/keymaps/paulfioravanti keyboards/ergodox_ez/keymaps
make ergodox_ez:paulfioravanti
```

This will result in a `ergodox_ez_paulfioravanti.hex` file being created at the
root of the directory, and it is this file that is to be used when flashing
the firmware.

## Flash Firmware

Follow instructions (and watch video) on the
[ErgoDox EZ Graphical Configurator page][].

## Handy Links

- [QMK Keycodes][] (what keycodes are currently available to you)
- [QMK Config Options][] (Helps determine what can go in the `config.h` file)
- [QMK Customizing Functionality][]
  (how to define new keycodes and process them)

[ErgoDox EZ Graphical Configurator page]: https://ergodox-ez.com/pages/graphical-configurator
[Install Build Tools - Mac OS section]: https://docs.qmk.fm/install-build-tools#macos
[my original ErgoDox Firmware configuration]: https://github.com/paulfioravanti/ergodox-firmware/blob/custom-layout/firmware/keyboard/ergodox/layout/custom-layout.c
[QMK Config Options]: https://docs.qmk.fm/reference/config-options
[QMK Customizing Functionality]: https://docs.qmk.fm/reference/customizing-functionality
[QMK ErgoDox EZ default keymap]: https://github.com/qmk/qmk_firmware/blob/master/keyboards/ergodox_ez/keymaps/default/keymap.c
[QMK Firmware]: https://github.com/qmk/qmk_firmware
[QMK Keycodes]: https://docs.qmk.fm/keycodes
[Teensy Loader for Mac OS]: https://pjrc.com/teensy/loader_mac.html

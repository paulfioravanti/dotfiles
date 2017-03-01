# Karabiner-Elements Configuration Notes

This current set of configuration will only work with
[this fork](https://github.com/wwwjfy/Karabiner-Elements)
of the [Karabiner-Elements repo](https://github.com/tekezo/Karabiner-Elements).

## Configuration features

- When Caps Lock or Left Control buttons are pressed, send Escape
- When Caps Lock button is held, send Left Control
- When Return/Enter button is held, send Right Control
- When Return/Enter button is pressed, send Return/Enter
  (see [#notes](notes) for why this is even needed)

## Notes

Due to the following configuration which maps Return/Enter to Control when
held,

```
"simple_modifications": {
  "return_or_enter": "right_control"
}
```

the following configuration was added to get the original Return/Enter
functionality back as expected when pressed (otherwise Return/Enter stopped
actually functioning as a Return/Enter key).

```
"standalone_keys": {
  "return_or_enter": "return_or_enter"
}
```

This might needed to be changed/re-configured when an official release of
Karabiner-Elements happens.

## Usage Instructions

1. Download the latest release `.dmg` file from the forked repo
   [here](https://github.com/wwwjfy/Karabiner-Elements/releases/)
2. Use the `.config/karabiner/karabiner.json` file in these dotfiles.

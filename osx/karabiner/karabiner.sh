#!/bin/sh

cli=/Applications/Karabiner.app/Contents/Library/bin/karabiner

$cli set remap.controlL2controlL_escape 1
/bin/echo -n .
$cli set remap.return2controlL_return 1
/bin/echo -n .
$cli set repeat.wait 32
/bin/echo -n .
$cli set repeat.initial_wait 300
/bin/echo -n .
/bin/echo

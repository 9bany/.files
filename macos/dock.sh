#!/bin/sh

dockutil --no-restart --remove all
dockutil --no-restart --add "/System/Applications/Utilities/Terminal.app"

killall Dock

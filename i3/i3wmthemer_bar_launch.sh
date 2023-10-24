#!/bin/env sh

pkill polybar

sleep 1;

polybar laptop_display &
polybar external_display &

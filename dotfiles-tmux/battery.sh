#!/usr/bin/env bash

# Используем первую доступную батарею
for battery in /sys/class/power_supply/BAT*; do
    [[ -r "$battery/capacity" ]] || continue

    capacity=$(<"$battery/capacity")
    status=$(<"$battery/status")

    case "$status" in
        Charging)
            icon="󰂄"
            ;;
        Full)
            icon="󰁹"
            ;;
        *)
            if (( capacity >= 90 )); then
                icon="󰁹"
            elif (( capacity >= 80 )); then
                icon="󰂂"
            elif (( capacity >= 70 )); then
                icon="󰂁"
            elif (( capacity >= 60 )); then
                icon="󰂀"
            elif (( capacity >= 50 )); then
                icon="󰁿"
            elif (( capacity >= 40 )); then
                icon="󰁾"
            elif (( capacity >= 30 )); then
                icon="󰁽"
            elif (( capacity >= 20 )); then
                icon="󰁼"
            elif (( capacity >= 10 )); then
                icon="󰁻"
            else
                icon="󰁺"
            fi
            ;;
    esac

    printf '%s %s%%\n' "$icon" "$capacity"
    exit 0
done

# На устройстве без батареи ничего не выводим
exit 0

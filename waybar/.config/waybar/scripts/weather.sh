#!/bin/bash

# Coordinate di Torino
LAT="45.07"
LON="7.69"

# Recupero dati dall'API
api_res=$(curl -s "https://api.open-meteo.com/v1/forecast?latitude=$LAT&longitude=$LON&current_weather=true")

# Se il comando curl ha avuto successo
if [ $? -eq 0 ]; then
    # Estraiamo temperatura e codice meteo usando jq
    temp=$(echo $api_res | jq '.current_weather.temperature' | cut -d. -f1)
    code=$(echo $api_res | jq '.current_weather.weathercode')

    # Mappa dei codici WMO (World Meteorological Organization) in icone
    case $code in
        0) icon="☀️" ;;              # Cielo sereno
        1|2|3) icon="🌤️" ;;           # Quasi sereno / Nuvoloso
        45|48) icon="🌫️" ;;           # Nebbia
        51|53|55) icon="🌦️" ;;        # Pioggerellina
        61|63|65) icon="🌧️" ;;        # Pioggia
        71|73|75|77) icon="❄️" ;;     # Neve
        80|81|82) icon="🌦️" ;;        # Rovesci
        95|96|99) icon="⛈️" ;;        # Temporale
        *) icon="☁️" ;;               # Default
    esac

    echo "$icon $temp°C"
else
    echo "N/A"
fi

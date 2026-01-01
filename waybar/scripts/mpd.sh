#!/bin/bash

# Configuración: Tiempo máximo en segundos antes de ocultar (ej. 10 seg)
MAX_PAUSE_TIME=120
TEMP_FILE="/tmp/mpd_pause_timer"

status=$(mpc status 2>/dev/null)

# 1. Si MPD no está corriendo o está detenido, borrar timer y salir
if [[ -z "$status" ]] || echo "$status" | grep -q "\[stopped\]"; then
  rm -f "$TEMP_FILE"
  exit 0
fi

song=$(mpc -f "%title% - %artist%" current)
state=$(echo "$status" | grep -o "\[.*\]" | tr -d '[]')

if [[ "$state" == "playing" ]]; then
  # Si está reproduciendo, borramos cualquier rastro del timer de pausa
  rm -f "$TEMP_FILE"
  icon="󰐊 "
  class="playing"
elif [[ "$state" == "paused" ]]; then
  # 2. Lógica del Timer de Pausa
  if [[ ! -f "$TEMP_FILE" ]]; then
    # Si no existe el archivo, lo creamos con la hora actual (en segundos)
    date +%s >"$TEMP_FILE"
  fi

  start_pause=$(cat "$TEMP_FILE")
  now=$(date +%s)
  elapsed=$((now - start_pause))

  # 3. Si el tiempo transcurrido supera el máximo, salimos sin mostrar nada
  if ((elapsed >= MAX_PAUSE_TIME)); then
    exit 0
  fi

  icon="󰏤 "
  class="paused"
fi

# 4. Enviar JSON a Waybar
echo "{\"text\":\"$icon $song\",\"class\":\"$class\"}"

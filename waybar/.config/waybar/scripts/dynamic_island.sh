#!/bin/bash

pids=$(pgrep -f "dynamic_island.sh" | grep -v "$$" | grep -v "$PPID")
if [ -n "$pids" ]; then
  kill $pids 2>/dev/null
fi

# 定义字符条形图字符集
bar="▁▂▃▄▅▆▇█"
dict="s/;//g"

bar_length=${#bar}
for ((i = 0; i < bar_length; i++)); do
  dict+=";s/$i/${bar:$i:1}/g"
done

# 创建 cava 配置文件
config_file="/tmp/bar_cava_config"
cat >"$config_file" <<EOF
[general]
bars = 10

[input]
method = pulse
source = auto

[output]
method = raw
raw_target = /dev/stdout
data_format = ascii
ascii_max_range = 7
EOF

last_status=""
cava_pid=""

while true; do
  # 获取播放器状态
  status=$(playerctl status 2>/dev/null || echo "NoPlayer")
  # artUrl=$(playerctl metadata mpris:artUrl 2>/dev/null)

  case "$status" in
  "Playing")
    if [ "$last_status" != "Playing" ]; then
      # 若之前不是播放状态，停止现有的 cava 进程并启动新的
      if [ -n "$cava_pid" ]; then
        pkill -P "$cava_pid" 2>/dev/null
        wait "$cava_pid" 2>/dev/null
      fi
      (cava -p "$config_file" | sed -u "$dict" >/tmp/cava_spectrum) &
      cava_pid=$!
    fi
    spectrum=$(tail -n 1 /tmp/cava_spectrum)
    echo "{\"text\":\"$spectrum  $(playerctl metadata --format '{{title}}')\", \"class\":\"playing\"}"
    # echo "{\"text\":\"$spectrum - $(playerctl metadata --format '{{title}} - {{artist}}')\", \"class\":\"playing\"}"
    # echo "{\"text\":\"$spectrum - $(playerctl metadata --format '{{title}} - {{artist}}')\", \"class\":\"playing\",\"image\": \"$artUrl\"}"
    # echo '{"text":"▶", "class":"playing"}'
    ;;
  "Paused" | "Stopped" | "NoPlayer")
    if [ -n "$cava_pid" ]; then
      # 若 cava 进程正在运行，停止它
      pkill -P "$cava_pid" 2>/dev/null
      wait "$cava_pid" 2>/dev/null
      cava_pid=""
    fi
    echo "{\"text\":\" 󰣇                \", \"class\":\"paused\"}"
    # echo "{\"text\":\"⏸\", \"class\":\"paused\"}"
    ;;
  esac

  last_status=$status
  sleep 0.1
done

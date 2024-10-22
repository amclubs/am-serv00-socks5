#!/bin/bash

USER=$(whoami)
FILE_PATH="/home/${USER}/.s5"
CRON_S5="nohup ${FILE_PATH}/s5 -c ${FILE_PATH}/config.json >/dev/null 2>&1 &"

echo "检查并添加 crontab 任务"

if [ -e "${FILE_PATH}/config.json" ]; then
  echo "添加 socks5 的 crontab 重启任务"
  (crontab -l | grep -F "* * pgrep -x \"s5\" > /dev/null || ${CRON_S5}") || (crontab -l; echo "*/12 * * * * pgrep -x \"s5\" > /dev/null || ${CRON_S5}") | crontab -
fi

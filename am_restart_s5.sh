#!/bin/bash

# 检查进程是否在运行
pgrep -x "s5" > /dev/null

# 如果没有运行，则启动 s5
if [ $? -ne 0 ]; then
    nohup /home/${USER}/.s5/s5 -c /home/${USER}/.s5/config.json >/dev/null 2>&1 &
fi



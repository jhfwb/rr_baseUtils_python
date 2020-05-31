@echo off
set/p n=请输入创建的环境名称：
python -m venv "%n%"

echo	成功创建虚拟环境
pause

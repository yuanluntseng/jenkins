@echo off
for /f "tokens=*" %%i in ('docker ps --format "{{.Names}}"') do (
  echo Container Name: %%i
  docker inspect -f "{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}" %%i
)

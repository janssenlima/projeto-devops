#!/bin/sh

python3 /app/app.py &

while true; do
    curl -s 'http://localhost:5000/' > /dev/null
    sleep 5
done

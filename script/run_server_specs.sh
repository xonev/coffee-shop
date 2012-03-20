#!/bin/sh

echo "Starting application..."
./script/start_application.sh
sleep 1
jessie spec/server -f nested
echo "Stopping application..."
./script/stop_application.sh
echo "Done."


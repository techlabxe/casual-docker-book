#!/bin/bash
cd /usr/src/redmine

echo ${WAIT_LOOP}
if [ "$WAIT_LOOP" ]; then
  echo "wait loop"
  sleep infinity
else
  /docker-entrypoint.sh \
    rdebug-ide \
    --host 0.0.0.0 --port 1234 \
    --dispatcher-port 26162 \
    -- \
    bin/rails server -b 0.0.0.0 --port 3000
fi



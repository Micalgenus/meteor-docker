#!/bin/bash

target=$1

echo '{
  "name": "meteor",
  "private": true,
  "scripts": {
    "start": "MONGO_URL=mongodb://'$MONGO_HOST:$MONGO_PORT'/'$MONGO_DB' /home/meteor/.meteor/meteor run"
  },
  "dependencies": {
    "babel-runtime": "^6.20.0",
    "meteor-node-stubs": "~0.2.4"
  }
}' > "${target}"

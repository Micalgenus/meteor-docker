#!/bin/sh

if [ -z "$(ls -A /usr/share/meteor)" ]; then
	cd /usr/share
	chmod o+w /usr/share
	chown meteor:meteor -R /usr/share/meteor
	su meteor -c "/home/meteor/.meteor/meteor create --full meteor"

	/package.sh /usr/share/meteor/package.json $MONGO_HOST $MONGO_PORT $MONGO_DB

	chmod o-w /usr/share
fi

exec "$@"

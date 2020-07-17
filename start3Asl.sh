#!/bin/sh
REPO=fredblgr/ubuntunovnc-3amod
TAG=2020
URL=http://localhost:6080

docker run --rm -d \
		  -p 6080:80 \
		  -v ${PWD}:/workspace:rw \
		  -e USER=student -e PASSWORD=CS3ASL \
		  -e RESOLUTION=1680x1050 \
		  --name ubuntunovnc-3amod-run \
		  ${REPO}:${TAG}
sleep 5
if command -v open >& /dev/null
then
  open ${URL}
elif command -v xdg-open >& /dev/null
then
  # xdg-open can be configured, for instance with "xdg-settings set default-web-browser firefox.desktop"
  xdg-open ${URL}
else
  echo "# Point your browser at ${URL}"
fi

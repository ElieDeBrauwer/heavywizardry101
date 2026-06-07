#!/bin/bash

#   (3) The dropper downloads the worm from PFTS onto each node.
#
# +------+           (worm)    +-------+ Node 1   (dropper)
# | PFTS |--------+----------->| SNASE |<-------------------+
# +------+        |            +-------+                    |
#                 |  (worm)    +-------+ Node 2   (dropper) | (2) The initiator
#                 +----------->| SNASE |<-------------------+     sends the
#                 |            +-------+                    |     dropper to
#               (...)            (...)                      |     all nodes.
#                 |   (worm)   +-------+ Node N   (dropper) |
#                 +----------->| SNASE |<-------------------+
#                              +-------+                    |
#                              +-----------+                |
#                              | Initiator |----------------+
#                              +-----------+ (1) The initiator runs the worm.

DIR="$(cd "$(dirname "$0")" && pwd)"

# Remove any previous container and images
for container in $(docker ps -a -q -f name="victim*")
do
    echo "Cleaning container $container"
    docker stop "$container" >/dev/null
done

# Destroy network if exists
if docker network inspect piconet >/dev/null 2>&1; then
    echo "Removing old network"
    docker network rm piconet >/dev/null
fi

# Create new subnet
echo "Creating new network"
docker network create --subnet=172.20.0.0/24 piconet >/dev/null

if [ ! -f "$DIR/snase.static" ]; then
    echo "snase.static is missing and should be built first." >&2
    exit 1
fi

N=3
echo "Starting $N machines...."
for ((i = 3; i < 3 + N; i++))
do
   ADDR="172.20.0.$i"
   NAME="victim$i"
   docker run --rm --net piconet --ip ${ADDR} --security-opt label=disable -v "$DIR/":/opt/snase --name ${NAME} -d alpine /opt/snase/snase.static
done

# Check if pfts is running
if ! ps -C pfts >/dev/null 2>&1; then
    echo "Warning: pfts is not running"
    echo "Start it with ./pfts 4369 picoworm0.static"
fi

# Run the attacker machine
docker run --rm --net piconet --ip 172.20.0.2 -v "$DIR/":/opt/snase --name attacker -it alpine -w /opt/snase/

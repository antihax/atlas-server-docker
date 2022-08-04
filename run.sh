docker network create test-atlas
docker run --name redis -p 127.0.0.1:6379:6379 -d --network test-atlas redis

mkdir ~/atlasserver
chmod 777 ~/atlasserver

docker rm atlasA1 atlasB1 atlasA2 atlasB2 --force
docker run -dt --env WINEDLLOVERRIDES=version=n,b --network test-atlas --name=atlasA1 -p 5000:5000/udp -p 6000:6000/udp \
-v ~/atlasserver:/mnt/atlas-server  \
 antihax/atlas-server start-server "Ocean?ServerX=0?ServerY=0?ServerAdminPassword=123?QueryPort=5000?Port=6000?MaxPlayers=100?ReservedPlayerSlots=5?AltSaveDirectoryName=A1?MapPlayerLocation=true -FastEgyptTemple -NoCrashDialog -NoBattlEye -log -server -OfficialIgnoreFramerateLimit -ServerMaxTickRate=15"

docker run -dt --env WINEDLLOVERRIDES=version=n,b --network test-atlas --name=atlasA2 -p 5002:5002/udp -p 6002:6002/udp \
-v ~/atlasserver:/mnt/atlas-server  \
 antihax/atlas-server start-server "Ocean?ServerX=0?ServerY=1?ServerAdminPassword=123?QueryPort=5002?Port=6002?MaxPlayers=100?ReservedPlayerSlots=5?AltSaveDirectoryName=A2?MapPlayerLocation=true -FastEgyptTemple -NoCrashDialog -NoBattlEye -log -server -OfficialIgnoreFramerateLimit -ServerMaxTickRate=15"

docker run -dt --env WINEDLLOVERRIDES=version=n,b --network test-atlas --name=atlasB1 -p 5004:5004/udp -p 6004:6004/udp \
-v ~/atlasserver:/mnt/atlas-server  \
 antihax/atlas-server start-server "Ocean?ServerX=1?ServerY=0?ServerAdminPassword=123?QueryPort=5004?Port=6004?MaxPlayers=100?ReservedPlayerSlots=5?AltSaveDirectoryName=B1?MapPlayerLocation=true -FastEgyptTemple -NoCrashDialog -NoBattlEye -log -server -OfficialIgnoreFramerateLimit -ServerMaxTickRate=15"

docker run -dt --env WINEDLLOVERRIDES=version=n,b --network test-atlas --name=atlasB2 -p 5006:5006/udp -p 6006:6006/udp \
-v ~/atlasserver:/mnt/atlas-server  \
 antihax/atlas-server start-server "Ocean?ServerX=1?ServerY=1?ServerAdminPassword=123?QueryPort=5006?Port=6006?MaxPlayers=100?ReservedPlayerSlots=5?AltSaveDirectoryName=B2?MapPlayerLocation=true -FastEgyptTemple -NoCrashDialog -NoBattlEye -log -server -OfficialIgnoreFramerateLimit -ServerMaxTickRate=15"


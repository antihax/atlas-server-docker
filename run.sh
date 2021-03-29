docker network create test-atlas
docker run --name redis -d --network test-atlas redis -p localhost:6379:6379

docker rm atlasA1 atlasB1 --force
docker run -dt --network test-atlas --name=atlasA1 -p 5755:5755/udp -p 57555:57555/udp -p 27000:27000 \
-v ~/atlasserver:/mnt/atlas-server  \
 antihax/atlas-server start-server   "Ocean?ServerX=0?ServerY=0?ServerAdminPassword=123?MaxPlayers=100?ReservedPlayerSlots=5?QueryPort=57555?Port=5755?SeamlessIP=88.99.188.173?AltSaveDirectoryName=A1 -NoBattlEye -log -server"

docker run -dt --network test-atlas --name=atlasB1 -p 5756:5756/udp -p 57556:57556/udp -p 27001:27001 \
-v ~/atlasserver:/mnt/atlas-server  \
 antihax/atlas-server start-server   "Ocean?ServerX=1?ServerY=0?ServerAdminPassword=123?MaxPlayers=100?ReservedPlayerSlots=5?QueryPort=57556?Port=5756?SeamlessIP=88.99.188.173?AltSaveDirectoryName=B1 -NoBattlEye -log -server"

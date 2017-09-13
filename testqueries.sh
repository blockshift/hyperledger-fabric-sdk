#!/bin/bash
#
# 
#
# 
#

jq --version > /dev/null 2>&1
if [ $? -ne 0 ]; then
	echo "Please Install 'jq' https://stedolan.github.io/jq/ to execute this script"
	echo
	exit 1
fi
starttime=$(date +%s)

echo "POST request Enroll on Org1  ..."
echo
ORG1_TOKEN=$(curl -s -X POST \
  http://localhost:4000/users \
  -H "content-type: application/x-www-form-urlencoded" \
  -d 'username=Jim&orgName=org1')
echo $ORG1_TOKEN
ORG1_TOKEN=$(echo $ORG1_TOKEN | jq ".token" | sed "s/\"//g")
echo
echo "ORG1 token is $ORG1_TOKEN"
echo
echo "POST request Enroll on Org2 ..."
echo
ORG2_TOKEN=$(curl -s -X POST \
  http://localhost:4000/users \
  -H "content-type: application/x-www-form-urlencoded" \
  -d 'username=Barry&orgName=org2')
echo $ORG2_TOKEN
ORG2_TOKEN=$(echo $ORG2_TOKEN | jq ".token" | sed "s/\"//g")
echo
echo "ORG2 token is $ORG2_TOKEN"
echo
echo "POST request Enroll on Org3  ..."
echo
ORG3_TOKEN=$(curl -s -X POST \
  http://localhost:4000/users \
  -H "content-type: application/x-www-form-urlencoded" \
  -d 'username=Obaid&orgName=org3')
echo $ORG3_TOKEN
ORG3_TOKEN=$(echo $ORG3_TOKEN | jq ".token" | sed "s/\"//g")
echo
echo "ORG3 token is $ORG3_TOKEN"
echo

echo "POST request Enroll on Org4  ..."
echo
ORG4_TOKEN=$(curl -s -X POST \
  http://localhost:4000/users \
  -H "content-type: application/x-www-form-urlencoded" \
  -d 'username=Atif&orgName=org4')
echo $ORG4_TOKEN
ORG4_TOKEN=$(echo $ORG4_TOKEN | jq ".token" | sed "s/\"//g")
echo
echo "ORG4 token is $ORG4_TOKEN"
echo

echo "POST request Enroll on Org5  ..."
echo
ORG5_TOKEN=$(curl -s -X POST \
  http://localhost:4000/users \
  -H "content-type: application/x-www-form-urlencoded" \
  -d 'username=Khurrum&orgName=org5')
echo $ORG5_TOKEN
ORG5_TOKEN=$(echo $ORG5_TOKEN | jq ".token" | sed "s/\"//g")
echo
echo "ORG5 token is $ORG5_TOKEN"
echo

echo
echo "POST request Create channel  ..."
echo
curl -s -X POST \
  http://localhost:4000/channels \
  -H "authorization: Bearer $ORG1_TOKEN" \
  -H "content-type: application/json" \
  -d '{
	"channelName":"mychannel",
	"channelConfigPath":"../artifacts/channel/mychannel.tx"
}'
echo
echo
sleep 5
echo "POST request Join channel on Org1"
echo
curl -s -X POST \
  http://localhost:4000/channels/mychannel/peers \
  -H "authorization: Bearer $ORG1_TOKEN" \
  -H "content-type: application/json" \
  -d '{
	"peers": ["localhost:7051","localhost:7056"]
}'
echo
echo

echo "POST request Join channel on Org2"
echo
curl -s -X POST \
  http://localhost:4000/channels/mychannel/peers \
  -H "authorization: Bearer $ORG2_TOKEN" \
  -H "content-type: application/json" \
  -d '{
	"peers": ["localhost:8051","localhost:8056"]
}'
echo
echo


echo "POST request Join channel on Org3"
echo
curl -s -X POST \
  http://localhost:4000/channels/mychannel/peers \
  -H "authorization: Bearer $ORG3_TOKEN" \
  -H "content-type: application/json" \
  -d '{
	"peers": ["localhost:10151","localhost:10251"]
}'
echo
echo

echo "POST request Join channel on Org4"
echo
curl -s -X POST \
  http://localhost:4000/channels/mychannel/peers \
  -H "authorization: Bearer $ORG4_TOKEN" \
  -H "content-type: application/json" \
  -d '{
	"peers": ["localhost:10351","localhost:10451"]
}'
echo
echo

echo "POST request Join channel on Org5"
echo
curl -s -X POST \
  http://localhost:4000/channels/mychannel/peers \
  -H "authorization: Bearer $ORG5_TOKEN" \
  -H "content-type: application/json" \
  -d '{
	"peers": ["localhost:10551","localhost:10651"]
}'
echo
echo





echo "POST Install chaincode on Org1"
echo
curl -s -X POST \
  http://localhost:4000/chaincodes \
  -H "authorization: Bearer $ORG1_TOKEN" \
  -H "content-type: application/json" \
  -d '{
	"peers": ["localhost:7051","localhost:7056"],
	"chaincodeName":"mycc",
	"chaincodePath":"github.com/degree",
	"chaincodeVersion":"v0"
}'
echo
echo


echo "POST Install chaincode on Org2"
echo
curl -s -X POST \
  http://localhost:4000/chaincodes \
  -H "authorization: Bearer $ORG2_TOKEN" \
  -H "content-type: application/json" \
  -d '{
	"peers": ["localhost:8051","localhost:8056"],
	"chaincodeName":"mycc",
	"chaincodePath":"github.com/degree",
	"chaincodeVersion":"v0"
}'
echo
echo


echo "POST Install chaincode on Org3"
echo
curl -s -X POST \
  http://localhost:4000/chaincodes \
  -H "authorization: Bearer $ORG3_TOKEN" \
  -H "content-type: application/json" \
  -d '{
	"peers": ["localhost:10151","localhost:10251"],
	"chaincodeName":"mycc",
	"chaincodePath":"github.com/degree",
	"chaincodeVersion":"v0"
}'
echo
echo

echo "POST Install chaincode on Org4"
echo
curl -s -X POST \
  http://localhost:4000/chaincodes \
  -H "authorization: Bearer $ORG4_TOKEN" \
  -H "content-type: application/json" \
  -d '{
	"peers": ["localhost:10351","localhost:10451"],
	"chaincodeName":"mycc",
	"chaincodePath":"github.com/degree",
	"chaincodeVersion":"v0"
}'
echo
echo

echo "POST Install chaincode on Org5"
echo
curl -s -X POST \
  http://localhost:4000/chaincodes \
  -H "authorization: Bearer $ORG5_TOKEN" \
  -H "content-type: application/json" \
  -d '{
	"peers": ["localhost:10551","localhost:10651"],
	"chaincodeName":"mycc",
	"chaincodePath":"github.com/degree",
	"chaincodeVersion":"v0"
}'
echo
echo

echo "POST instantiate chaincode from org1"
echo
curl -s -X POST \
  http://localhost:4000/channels/mychannel/chaincodes \
  -H "authorization: Bearer $ORG1_TOKEN" \
  -H "content-type: application/json" \
  -d '{
	"chaincodeName":"mycc",
	"chaincodeVersion":"v0",
	"functionName":"init",
	"args":["Degreeholder","obaid","Department","software","Enrollmentnumber","Ned-1186/13-14","Gpa","3.5","University","Ned"]
}'
echo
echo


echo "POST request Enroll on Org1  ..."
echo
ORG6_TOKEN=$(curl -s -X POST \
  http://localhost:4000/users \
  -H "content-type: application/x-www-form-urlencoded" \
  -d 'username=Junaid&orgName=org1')
echo $ORG6_TOKEN
ORG6_TOKEN=$(echo $ORG6_TOKEN | jq ".token" | sed "s/\"//g")
echo
echo "ORG1 token is $ORG6_TOKEN"
echo






echo "POST invoke chaincode from org1"
echo
TRX_ID1=$(curl -s -X POST \
  http://localhost:4000/channels/mychannel/chaincodes/mycc \
  -H "authorization: Bearer $ORG1_TOKEN" \
  -H "content-type: application/json" \
  -d '{
	"peers": ["localhost:10151","localhost:10351"],
	"fcn":"initDegree",
	"args":["Khurrum","software","Ned11831314","3.5","Ned"]
}')
echo "Transacton ID is $TRX_ID1"
echo
echo

echo "POST invoke chaincode from Org2 "
echo
TRX_ID2=$(curl -s -X POST \
  http://localhost:4000/channels/mychannel/chaincodes/mycc \
  -H "authorization: Bearer $ORG2_TOKEN" \
  -H "content-type: application/json" \
  -d '{
	"peers": ["localhost:10151","localhost:10351"],
	"fcn":"initDegree",
	"args":["Atif","software","Ned11831315","3.5","Ned"]
}')
echo "Transacton ID is $TRX_ID2"
echo
echo



echo "POST invoke chaincode from org2 "
echo
TRX_ID3=$(curl -s -X POST \
  http://localhost:4000/channels/mychannel/chaincodes/mycc \
  -H "authorization: Bearer $ORG2_TOKEN" \
  -H "content-type: application/json" \
  -d '{
	"peers": ["localhost:10151","localhost:10351"],
	"fcn":"initDegree",
	"args":["Junaid","softwares","Ned1183vbvbvh","3.5","Neds"]
}')
echo "Transacton ID is $TRX_ID3"
echo
echo








echo "GET query chaincode on peer1 of Org1"
echo
curl -s -X GET \
  "http://localhost:4000/channels/mychannel/chaincodes/mycc?peer=peer1&fcn=readDegree&args=%5B%22Ned11831314%22%5D" \
  -H "authorization: Bearer $ORG4_TOKEN" \
  -H "content-type: application/json"
echo
echo

echo "GET query Block by blockNumber"
echo
curl -s -X GET \
  "http://localhost:4000/channels/mychannel/blocks/1?peer=peer1" \
  -H "authorization: Bearer $ORG4_TOKEN" \
  -H "content-type: application/json"
echo
echo


echo "GET query Block by blockNumber 0"
echo
curl -s -X GET \
  "http://localhost:4000/channels/mychannel/blocks/0?peer=peer2" \
  -H "authorization: Bearer $ORG5_TOKEN" \
  -H "content-type: application/json"
echo
echo

echo "GET query Block by blockNumber 2"
echo
curl -s -X GET \
  "http://localhost:4000/channels/mychannel/blocks/2?peer=peer2" \
  -H "authorization: Bearer $ORG3_TOKEN" \
  -H "content-type: application/json"
echo
echo


echo "GET query Block by blockNumber 3"
echo
curl -s -X GET \
  "http://localhost:4000/channels/mychannel/blocks/3" \
  -H "authorization: Bearer $ORG6_TOKEN" \
  -H "content-type: application/json"
echo
echo




echo "GET query Block by blockNumber 4"
echo
curl -s -X GET \
  "http://localhost:4000/channels/mychannel/blocks/4" \
  -H "authorization: Bearer $ORG6_TOKEN" \
  -H "content-type: application/json"
echo
echo



echo "GET query Block by blockNumber 5"
echo
curl -s -X GET \
  "http://localhost:4000/channels/mychannel/blocks/5" \
  -H "authorization: Bearer $ORG6_TOKEN" \
  -H "content-type: application/json"
echo
echo




echo "GET SLECTED Block by blockNumber 2"
echo
curl -s -X GET \
  "http://localhost:4000/channels/mychannel/selecteddata/2" \
  -H "authorization: Bearer $ORG2_TOKEN" \
  -H "content-type: application/json"
echo
echo


echo "GET query Block by blockNumber 2 by org5"
echo
curl -s -X GET \
  "http://localhost:4000/channels/mychannel/blocks/2?peer=peer2" \
  -H "authorization: Bearer $ORG1_TOKEN" \
  -H "content-type: application/json"
echo
echo



echo "GET query Transaction by TransactionID1"
echo
curl -s -X GET http://localhost:4000/channels/mychannel/transactions/$TRX_ID1?peer=peer1 \
  -H "authorization: Bearer $ORG1_TOKEN" \
  -H "content-type: application/json"
echo
echo




echo "GET query Transaction by TransactionID2"
echo
curl -s -X GET http://localhost:4000/channels/mychannel/transactions/$TRX_ID2?peer=peer1 \
  -H "authorization: Bearer $ORG1_TOKEN" \
  -H "content-type: application/json"
echo
echo

echo "GET query Transaction by TransactionID3"
echo
curl -s -X GET http://localhost:4000/channels/mychannel/transactions/$TRX_ID3?peer=peer1 \
  -H "authorization: Bearer $ORG1_TOKEN" \
  -H "content-type: application/json"
echo
echo





############################################################################
### TODO: What to pass to fetch the Block information
############################################################################
#echo "GET query Block by Hash"
#echo
#hash=????
#curl -s -X GET \
#  "http://localhost:4000/channels/mychannel/blocks?hash=$hash&peer=peer1" \
#  -H "authorization: Bearer $ORG1_TOKEN" \
#  -H "cache-control: no-cache" \
#  -H "content-type: application/json" \
#  -H "x-access-token: $ORG1_TOKEN"
#echo
#echo

echo "GET query ChainInfo"
echo
curl -s -X GET \
  "http://localhost:4000/channels/mychannel?peer=peer1" \
  -H "authorization: Bearer $ORG1_TOKEN" \
  -H "content-type: application/json"
echo
echo

echo "GET query Installed chaincodes"
echo
curl -s -X GET \
  "http://localhost:4000/chaincodes?peer=peer1&type=installed" \
  -H "authorization: Bearer $ORG1_TOKEN" \
  -H "content-type: application/json"
echo
echo

echo "GET query Instantiated chaincodes"
echo
curl -s -X GET \
  "http://localhost:4000/chaincodes?peer=peer1&type=instantiated" \
  -H "authorization: Bearer $ORG1_TOKEN" \
  -H "content-type: application/json"
echo
echo

echo "GET query Channels"
echo
curl -s -X GET \
  "http://localhost:4000/channels?peer=peer1" \
  -H "authorization: Bearer $ORG1_TOKEN" \
  -H "content-type: application/json"
echo
echo


echo "Total execution time : $(($(date +%s)-starttime)) secs ..."






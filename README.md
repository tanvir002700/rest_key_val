# README

## calls
 curl -X GET http://localhost:3000/values
 
 curl -d '{"store": {"email2": "test@update3", "password4": "update4"}}' -H "Content-Type: application/json" -X POST http://localhost:3000/values
 
 curl -d '{"store": {"email2": "test@update3", "password4": "update4"}}' -H "Content-Type: application/json" -X PATCH http://localhost:3000/values

## setup

docker build -t api . 

docker network create api

docker run -d -e POSTGRES_USER='api' -e POSTGRES_PASSWORD='api' --net=api --name db postgres

docker run -it -e POSTGRES_USER='api' -e POSTGRES_PASSWORD='api' --net=api api rake db:setup

docker run -it -e POSTGRES_USER='api' -e POSTGRES_PASSWORD='api' --net=api -p 3000:3000 --name app api

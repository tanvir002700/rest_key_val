# README

 curl -X GET http://localhost:3000/values
 curl -d '{"store": {"email2": "test@update3", "password4": "update4"}}' -H "Content-Type: application/json" -X POST http://localhost:3000/values
 curl -d '{"store": {"email2": "test@update3", "password4": "update4"}}' -H "Content-Type: application/json" -X PATCH http://localhost:3000/values

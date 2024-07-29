# SMS
This android application continuously uses the “get SMS” API to deliver SMS messages from the server and send them. There are two REST APIs implemented using Node.js and MySQL. The first API, a “send SMS” POST API, creates a record in the database with the given information. The second API, a “get SMS” GET API, returns the oldest unsent message in the database as a JSON object. Used Postman to test the POST API and PhpMyAdmin to manage the MySQL database.

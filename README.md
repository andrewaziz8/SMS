# SMS
This android application continuously uses the “get SMS” API to deliver SMS messages from the server and send them. There are two REST APIs implemented using Node.js and MySQL. The first API, a “send SMS” POST API, creates a record in the database with the given information. The second API, a “get SMS” GET API, returns the oldest unsent message in the database as a JSON object. Used Postman to test the POST API and PhpMyAdmin to manage the MySQL database. <br>

This application has only **one activity** the implements the following interface: <br> 
The **Start button** starts retrieving SMS messages from the server and send them. The process of retrieval and sending of an SMS message is periodic and it is done once every **5 seconds**. The **Stop button** stops the retrieval/sending process. At any point of time, only **one** of the 2 buttons is enabled. Meaning, when the application starts, the **Stop** button is disabled and the **Start** button is enabled. When you tap **Start**, it becomes disabled and the **Stop** button is enabled. <br>

## To Use Application: <br>
• When you test your SMS Gateway App on the emulator, use 10.0.0.2 as the IP address for your local 
running server (you implemented in node.js). <br>
• If you test on a physical Android device, make sure that the device as well as the computer that runs the 
server are connected to the same network. To know the IP address of the computer that runs the server 
(to use it with the SMS Gateway App), read the following article: https://www.avg.com/en/signal/find-ip
address <br>
• You may need to disable your computer firewall to get things going during testing.

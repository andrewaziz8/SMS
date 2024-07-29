var express = require('express');
var body = require('body-parser');
var srv = express(); 
var mysql = require('mysql');
var q;

srv.use(body.json());

var con = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'messages'
});

con.connect(function(err) {
    if (err) throw err; 
    console.log("Connected!");
});


srv.post('/sendSMS', (req, res) => {
    q = req.body;
    var sql = "INSERT INTO message (phone, body) VALUES (?,?)";
    con.query(sql, [q.phone, q.message], (err, result) => {
        if (err) { 
            res.end("0");
            throw err;
        }
        console.log("1 record inserted");
        res.end("1");
    });
});

srv.get('/getSMS', (req, res) => { 
    var sql = "SELECT `id`, `phone`, `body` FROM message where `sent` = 0 ORDER BY `ts` LIMIT 1";
    con.query(sql, (err, result) => {
        if (err) { 
            res.end("Failed to get the message");
            throw err;
        }

        if(result.length > 0){
            var output = JSON.stringify(result[0]);
            console.log(output);

            res.write(output);

            var parsing = JSON.parse(output);
            sql = "UPDATE message set `sent` = 1 where `id` = ?";
            con.query(sql, [parsing.id], (err, result) => {
                if (err) { 
                    res.end("Failed to update the message");
                    throw err;
                }
            });
            res.end();
        }
        else {
            res.end("No Messages Found");
        }
    });
}); 

srv.listen(8080, () => { 
    console.log('Example app listening on port 8080.'); }
);
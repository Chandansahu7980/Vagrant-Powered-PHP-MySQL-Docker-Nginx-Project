<?php

$host = "192.168.56.22";
$user = "phpuser";
$password = "phpuser";
$database = "my_project_db";

//Established connection to the database
$conn = new mysqli($host, $user, $password, $database);
if ($conn->connect_error) {
    die("<h2>Conntecting to database failed !</h2>".$conn->error);
}
else{
    echo "<h2>database connection success</h2>";
}

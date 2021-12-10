<?php
 
var_dump("Hi, you're on ".getenv('APP_URL'));
 
$dbhost = getenv('DB_HOST');
$dbuser = getenv('DB_USER');
$dbpass = getenv('DB_PASS');
 
$conn = mysqli_connect($dbhost, $dbuser, $dbpass);
if (!$conn) {
   var_dump("Connection failed: ".mysqli_connect_error());
   exit('bye');
}
 
var_dump("Successful database connection!");
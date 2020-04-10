<?php
 
var_dump("Hi, you're on ".getenv('APP_URL'));
 
$dbhost = getenv('MYSQL_HOST');
$dbuser = getenv('MYSQL_USER');
$dbpass = getenv('MYSQL_PASS');
 
$conn = mysqli_connect($dbhost, $dbuser, $dbpass);
if (!$conn) {
   var_dump("Connection failed: ".mysqli_connect_error());
   exit('bye');
}
 
var_dump("Successful database connection!");
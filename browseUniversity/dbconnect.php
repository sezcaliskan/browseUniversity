<?php
$dbname="p1solution3"; 
$conn=mysqli_connect("localhost", "root", "ergoproxy");
if (!$conn) {
    die('not connected:' . mysqli_error($conn));
} else {
    echo 'connected';
}
$b=mysqli_select_db($conn, $dbname); 
if(!$b){
    die("db couldn't retrieved".mysqli_error($conn));
}
?>

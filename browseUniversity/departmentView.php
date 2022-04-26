<?php

include './dbconnect.php';
$dname = $_GET['dName'];

$query = "SELECT dName FROM department ";
$result = mysqli_query($conn, $query);
$num = mysqli_num_rows($result);

$row = mysqli_fetch_assoc($result);

$dname = $row["dName"];
$budget = $row["budget"];
$headSsn = $row["headSsn"];
$buildingName = $row["buildingName"];

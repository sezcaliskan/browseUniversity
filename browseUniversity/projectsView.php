<?php

include './dbconnect.php';
$leadssn = $_GET['leadSsn'];

$query = "SELECT pName FROM project ";
$result = mysqli_query($conn, $query);
$num = mysqli_num_rows($result);

$row = mysqli_fetch_assoc($result);

$leadssn = $row["leadSsn"];
$pName = $row["pName"];
$subject = $row["subject"];
$budget = $row["budget"];
$startDate = $row["startDate"];
$enddate = $row["enddate"];
$controllingDName = $row["controllingDName"];

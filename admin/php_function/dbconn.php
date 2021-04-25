<?php

$dbUsername = "root";
$dbPassword = "";
$dbServername = "";
$dbName = "bluegarden_db";

$conn = mysqli_connect($dbServername, $dbUsername, $dbPassword, $dbName) or die("connection failed");

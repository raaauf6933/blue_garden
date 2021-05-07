<?php

$dbUsername = "root";
$dbPassword = "";
$dbServername = "localhost";
$dbName = "bluegarden_db";

$conn = mysqli_connect($dbServername, $dbUsername, $dbPassword, $dbName) or die("connection failed");

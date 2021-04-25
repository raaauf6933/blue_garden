<?php

$dbUsername = "bluegarden_db";
$dbPassword = "bluegarden_db";
$dbServername = "localhost";
$dbName = "bluegarden_db";

$conn = mysqli_connect($dbServername, $dbUsername, $dbPassword, $dbName) or die("connection failed");

<?php
include "../dbconn.php";

$id = $_POST['id'];
$status = $_POST['status'];


$sql = mysqli_query($conn, "UPDATE discount_type SET status = '$status' WHERE id = '$id'");

echo json_encode($sql);

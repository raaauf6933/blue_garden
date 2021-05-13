<?php
include "../dbconn.php";

$discount_name = $_POST['discount_name'];
$discount_value = $_POST['discount_value'];



$sql = mysqli_query($conn, "INSERT INTO discount_type (discount_name,discount_value,status) 
VALUES ('$discount_name','$discount_value','1')");

echo json_encode($sql);

?>
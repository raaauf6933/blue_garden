<?php
include "../../php_functions/dbconn.php";


$reservation_id = $_POST['reservation_id'];
$check_in = $_POST['checkin_date'];
$check_out = $_POST['checkout_date'];
$billing_id = $_POST['billing_id'];
$newBilling = $_POST['newBilling'];

$sql = mysqli_query($conn, "UPDATE reservation SET checkin_date = '$check_in', checkout_date = '$check_out' WHERE reservation_id = '$reservation_id' ");
$sqlBiling = mysqli_query($conn, "DELETE FROM billing WHERE billing_id = '$billing_id'");

$sqlInsertNewBilling = "INSERT INTO `billing` (`billing_id`, `original_capital`) VALUES ('$billing_id', '$newBilling')";
$resul_billing = mysqli_query($conn, $sqlInsertNewBilling);



echo ($sql);

?>
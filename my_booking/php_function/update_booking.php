<?php
include "../../php_functions/dbconn.php";


$reservation_id = $_POST['reservation_id'];
$check_in = $_POST['checkin_date'];
$check_out = $_POST['checkout_date'];

$sql = mysqli_query($conn, "UPDATE reservation SET checkin_date = '$check_in', checkout_date = '$check_out' WHERE reservation_id = '$reservation_id' ");



echo ($sql);

?>
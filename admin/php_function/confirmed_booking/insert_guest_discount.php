<?php
include "../dbconn.php";
$reservation_id = $_POST['reservation_id'];
$discount_id = $_POST['discount_id'];



$sql_get_billing = mysqli_query($conn,"SELECT bb.id,bb.billing_id,sum(bb.original_capital) as original_capital
FROM billing bb
LEFT JOIN reservation rv on rv.billing_id = bb.billing_id
WHERE rv.reservation_id = '$reservation_id' ");

$sql_get_discount = mysqli_query($conn, "SELECT * FROM discount_type where id = '$discount_id' ");


$discount_fetch = mysqli_fetch_assoc($sql_get_discount);
$discount_value = $discount_fetch['discount_value'];


$billing_fetch = mysqli_fetch_assoc($sql_get_billing);
$_id = $billing_fetch['id'];
$billing_id = $billing_fetch['billing_id'];
$original_capital = $billing_fetch['original_capital'];


$discount_amount = ((floatval($original_capital)) * floatval($discount_value));
$new_billing_amount = floatval($original_capital) - floatval($discount_amount);

$sql_insert_guest_discount = mysqli_query($conn,"INSERT INTO guest_discount (reservation_id,discount_id) VALUES ('$reservation_id','$discount_id')");
$sql_update_billing = mysqli_query($conn, "DELETE FROM billing where billing_id = '$billing_id' ");
$sql_insert_new_billing = mysqli_query($conn,"INSERT INTO billing (billing_id,original_capital) VALUES ('$billing_id','$new_billing_amount')");

echo $sql_insert_new_billing;


?>
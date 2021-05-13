<?php
include "../dbconn.php";
$reservation_id = $_POST['reservation_id'];
$discount_id = $_POST['discount_id'];



$sql_get_billing = mysqli_query($conn,"SELECT bb.id,sum(bb.original_capital) as original_capital
FROM billing bb
LEFT JOIN reservation rv on rv.billing_id = bb.billing_id
WHERE rv.reservation_id = '$reservation_id' ");

$sql_get_discount = mysqli_query($conn, "SELECT * FROM discount_type where id = '$discount_id' ")


$discount_fetch = mysqli_fetch_assoc($sql_get_billing);
$discount_value = $discount_fetch['discount_value'];


$billing_fetch = mysqli_fetch_assoc($sql_get_billing);
$_id = $billing_fetch['id'];
$original_capital = $billing_fetch['original_capital'];


$discount_amount = ((floatval($original_capital) / 1.12) * floatval($discount_value));


$sql_update_billing = mysqli_query($conn, "UPDATE billing SET original_capital = '$discount_amount'
    WHERE id ='$_id' ");



?>
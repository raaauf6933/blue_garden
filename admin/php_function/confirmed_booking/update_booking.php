<?php
include "../dbconn.php";
date_default_timezone_set("Asia/Singapore");

$billing_id = $_POST['billing_id'];
$payed_capital = $_POST['payed_capital'];
$payment_date = date("Y-m-d H:i:s");

$query_billing = mysqli_query($conn, "SELECT id,SUM(original_capital) as original_capital FROM billing where billing_id = '$billing_id'
GROUP BY id");

$total_amount = 0;
while ($row = mysqli_fetch_assoc($query_billing)) {
  $total_amount += $row['original_capital'];
}

$query_payment = mysqli_query($conn, "SELECT payment_id,SUM(payed_capital) as payed_capital FROM payment where billing_id = '$billing_id' GROUP BY payment_id");

$total_payed = 0;
while ($row = mysqli_fetch_assoc($query_payment)) {
    $total_payed += $row['payed_capital'];
}



$balance = $total_amount - $total_payed;


if((float)number_format($payed_capital,2) == (float)number_format($balance, 2)){
    $sql = mysqli_query($conn, "INSERT INTO payment(billing_id,payed_capital,payment_date) 
VALUES ('$billing_id','$payed_capital','$payment_date')");
    $sql_update = mysqli_query($conn, "UPDATE reservation SET status = '6' WHERE billing_id ='$billing_id'");
echo json_encode('1');
}elseif((float)number_format($payed_capital,2) > (float)number_format($balance, 2)){
    echo json_encode('2');
}else{
 
     echo json_encode('0');
}

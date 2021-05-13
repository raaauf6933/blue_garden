<?php
include "../dbconn.php";

$reservation_id = $_POST['reservation_id'];
$old_room_id = $_POST['old_room_id'];
$new_room_id = $_POST['room_id'];
$roomtype_name = $_POST['roomtype_name'];
$room_price = $_POST['room_price'];
$room_num = $_POST['room_num'];
$billing_id = $_POST['billing_id'];
$old_room_price= $_POST['old_room_price'];




if((int)$old_room_price > (int)$room_price ){
 
    
$sql_update = mysqli_query($conn, "UPDATE room_reservation SET room_id = '$new_room_id', roomtype_name = '$roomtype_name', room_price = '$old_room_price' , room_num = '$room_num' 
WHERE reservation_id ='$reservation_id' AND room_id = '$old_room_id' ");

$sql_get_billing = mysqli_query($conn,"SELECT id, max(original_capital) as original_capital FROM billing where billing_id = '$billing_id'");


    $firstrow = mysqli_fetch_assoc($sql_get_billing);
    $_id = $firstrow['id'];
    $billing_data_price = $firstrow['original_capital'];
    $temp_price1 = (int)$billing_data_price - (int)$old_room_price;
    $new_price = (int)$temp_price1 + (int)$room_price;
    
    $sql_update_billing = mysqli_query($conn, "UPDATE billing SET original_capital = '$new_price'
    WHERE id ='$_id' ");
     
}
$sql_update = mysqli_query($conn, "UPDATE room_reservation SET room_id = '$new_room_id', roomtype_name = '$roomtype_name', room_price = '$old_room_price' , room_num = '$room_num' 
WHERE reservation_id ='$reservation_id' AND room_id = '$old_room_id' ");





echo $sql_update;


?>
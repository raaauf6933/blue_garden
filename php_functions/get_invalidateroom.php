<?php
include "./dbconn.php";

$room_array = json_decode('[{"room_ids":"16"},{"room_ids":"18"},{"room_ids":"19"}]');




$data = array();

foreach ($room_array as $room_array) {
    foreach ($room_array as $rooms) {
       
        
    $sql= mysqli_query($conn, "SELECT rv.checkin_date,rv.checkout_date
    FROM reservation rv
    INNER JOIN room_reservation rr on rr.reservation_id = rv.reservation_id
    WHERE rr.room_id = $rooms AND rv.status in (0,1,2,3,4)");
    
  
    while ($row = mysqli_fetch_assoc($sql)) {
        array_push($data, $row);
    }

    }
}

echo json_encode($data);



?>



<?php
include "../dbconn.php";
$reservation_id = $_POST['reservation_id'];

$sql = mysqli_query($conn,"SELECT gt.discount_name,gt.discount_value
FROM guest_discount gd
INNER JOIN discount_type gt on gt.id = gd.discount_id
INNER JOIN reservation rv on rv.reservation_id = gd.reservation_id
WHERE rv.reservation_id = '$reservation_id' ");

$data = array();
while ($row = mysqli_fetch_assoc($sql)) {
    array_push($data, $row);
}

echo json_encode($data);

?>
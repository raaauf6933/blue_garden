<?php
include "../dbconn.php";

$reservation_id = $_POST['reservation_id'];
$sql = mysqli_query($conn, "SELECT gt.* FROM reservation rv
left join guest_discount gd on gd.reservation_id = rv.reservation_id
left join discount_type gt on gt.id = gd.discount_id
where rv.reservation_id = '$reservation_id'");

$data = array();
while ($row = mysqli_fetch_assoc($sql)) {
    array_push($data, $row);
}

echo json_encode($data)

?>


<?php
include "../dbconn.php";

$sql = mysqli_query($conn, "SELECT * FROM vat_settings");

$data = array();
while ($row = mysqli_fetch_assoc($sql)) {
    array_push($data, $row);
}

echo json_encode($data);

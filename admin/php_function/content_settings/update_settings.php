<?php
include "../dbconn.php";

$vat_value = $_POST['vat_value'];


$sql = mysqli_query($conn, "UPDATE vat_settings SET value = '$vat_value' WHERE id = 1");

echo json_encode($sql);

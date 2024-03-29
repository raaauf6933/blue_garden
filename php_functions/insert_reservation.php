<?php
include "dbconn.php";
date_default_timezone_set("Asia/Singapore");
$reservation_id = (int)$_POST['reservation_id'];
$guest_id = (int)$_POST['guest_id'];
$billing_id = (int)$_POST['billing_id'];
$reservation_date = date("Y-m-d H:i:s");
$md5c = md5(date("Y-m-d H:i:sa"));
$booking_reference = substr(strtoupper($md5c), 1, 6);
$num_guest = (int)$_POST['num_guest'];
$check_in = $_POST['checkin_date'];
$check_out = $_POST['checkout_date'];
if ((date("Y-m-d", strtotime($check_in))) == (date("Y-m-d", strtotime($reservation_date . '+1 day')))) {
    $expiration_date = date("Y-m-d 23:59:59");
} else {
    $expiration_date = date("Y-m-d H:i:s", strtotime($reservation_date . '+1 day'));
}
$reservation_type = (int)$_POST['reservation_type'];
$status = (int)$_POST['status'];




$first_name = $_POST['first_name'];
$last_name = $_POST['last_name'];
$gender = $_POST['gender'];
$contact_number = $_POST['contact_number'];
$email = $_POST['email'];
$address = $_POST['address'];
$city = $_POST['city'];
$zipcode = $_POST['zip_code'];

$query1 = "INSERT INTO guest (guest_id,first_name,last_name,gender,contact_number,email,addressline_1,city,zipcode) VALUES
      ('" . $guest_id . "','" . $first_name . "','" . $last_name . "','" . $gender . "','" . $contact_number . "','" . $email . "',
      '" . $address . "','" . $city . "','" . $zipcode . "')" or die('error');
$result1 = mysqli_query($conn, $query1);

$query1 = "INSERT INTO `reservation` (`reservation_id`, `guest_id`, `billing_id`, `reservation_date`,`booking_reference`,`num_guest`, `checkin_date`, `checkout_date`, `expiration_date`, `reservation_type`, `status`) VALUES 
('$reservation_id', '$guest_id', '$billing_id', '$reservation_date','$booking_reference','$num_guest', '$check_in', '$check_out', '$expiration_date', '$reservation_type', '$status')";
$result2 = mysqli_query($conn, $query1);


$earlier = new DateTime($check_in);
$later = new DateTime($check_out);
$nights = $later->diff($earlier)->format("%a");



$room_array = json_decode($_POST['room_details']);



$room_rows = "";

$total_amount = 0;
foreach ($room_array as $room_array) {
    foreach ($room_array->room_ids as $rooms) {

        $sql_get_room = mysqli_query($conn, "SELECT rt.roomtype_name,rt.roomtype_price,rm.room_num FROM rooms rm
            left join room_type rt on rt.roomtype_id = rm.roomtype_id
            where rm.room_id = '$rooms'");

        $room_name = 0;
        $room_price = 0;
        $room_num = 0;
        while ($row = mysqli_fetch_assoc($sql_get_room)) {
            $room_name = $row['roomtype_name'];
            $room_price = $row['roomtype_price'];
            $room_num = $row['room_num'];
        }
        $sql_room = "INSERT INTO `room_reservation` (`reservation_id`, `room_id`,`roomtype_name`,`room_price`,`room_num`) VALUES ('$reservation_id', '$rooms','$room_name','$room_price','$room_num')";
        $result_room = mysqli_query($conn, $sql_room);
    }

    $sql_billing = "INSERT INTO `billing` (`billing_id`, `original_capital`) VALUES ('$billing_id', '$room_array->new_price')";
    $resul_billing = mysqli_query($conn, $sql_billing);

    $total_amount += (int)$room_array->new_price;
    $room_rows .= '<tr style="text-align: center;">
        <td  style="padding:15px;">
          <p style="font-size:14px;margin:0;padding:0px;font-weight:bold;">
            <span style="display:block;font-size:13px;font-weight:normal;">'. $room_array->roomtype_name.'</span>
          </p>
        </td>
        <td  style="padding:15px;">
          <p style="font-size:14px;margin:0;padding:0px;font-weight:bold;">
            <span style="display:block;font-size:13px;font-weight:normal;">₱' . number_format($room_array->new_price / $room_array->num_rooms / $nights,2). '</span>
          </p>
        </td>
        <td  style="padding:15px;">
          <p style="font-size:14px;margin:0;padding:0px;font-weight:bold;">
            <span style="display:block;font-size:13px;font-weight:normal;">'.$nights.'</span>
          </p>
        </td>
        <td  style="padding:15px;">
          <p style="font-size:14px;margin:0;padding:0px;font-weight:bold;">
            <span style="display:block;font-size:13px;font-weight:normal;">' . $room_array->num_rooms . '</span>
          </p>
        </td>
        <td  style="padding:15px;">
          <p style="font-size:14px;margin:0;padding:0px;font-weight:bold;">
            <span style="display:block;font-size:13px;font-weight:normal;">₱'. number_format($room_array->new_price,2).'</span>
          </p>
        </td>
  
      </tr>';
  
}

$sql_vat = mysqli_query($conn, "SELECT * FROM vat_settings");

$vat_rate = 0;
while ($row = mysqli_fetch_assoc($sql_vat)) {
  $vat_rate = $row['value'];
}


$vatable = $total_amount / $vat_rate;
$vat = ($total_amount - $vatable);
$downpayment = $total_amount / 2;

$email_body = '<html>
<style>
</style>
<body style="background-color:#ffffff;font-family: Open Sans, sans-serif;font-size:100%;font-weight:400;line-height:1.4;color:#000;">
  <table style="max-width:670px;margin:50px auto 10px;background-color:#efefef;padding:50px;-webkit-border-radius:3px;-moz-border-radius:3px;border-radius:3px;-webkit-box-shadow:0 1px 3px rgba(0,0,0,.12),0 1px 2px rgba(0,0,0,.24);-moz-box-shadow:0 1px 3px rgba(0,0,0,.12),0 1px 2px rgba(0,0,0,.24);box-shadow:0 1px 3px rgba(0,0,0,.12),0 1px 2px rgba(0,0,0,.24); border-top: solid 10px #ef7e24;     box-shadow: 0 1rem 3rem rgba(0,0,0,.175)!important;">
    <thead>
      <tr>
        <th style="text-align:left;" colspan="4"><img style="max-width: 70px;" src="cid:logo_2u" ><strong> Blue Garden Hotel & Resort.</strong></th>
        <th style="text-align:right;font-weight:400;">'.$reservation_date.'</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td style="height:35px; text-align: center; padding: 2rem; color:#17a2b8!important" colspan="5"><h2>THANK YOU FOR BOOKING WITH US!</h2></td>
      </tr>
      <tr>
        <td colspan="5" style="border: solid 1px #ddd; padding:10px 20px;">
          <p style="font-size:14px;margin:0 0 6px 0;"><span style="font-weight:bold;display:inline-block;min-width:150px">Status</span><b style="color:red;font-weight:normal;margin:0">Pending</b></p>

          <p style="font-size:14px;margin:0 0 6px 0;"><span style="font-weight:bold;display:inline-block;min-width:146px">Booking Reference</span> ' . $booking_reference . '</p>
          <p style="font-size:14px;margin:0 0 0 0;"><span style="font-weight:bold;display:inline-block;min-width:146px">Payment Due</span>' . $expiration_date . '</p>
          
        </td>
      </tr>
      
      <tr>
        <td style="width:50%;padding:20px;vertical-align:top" colspan="3">
          <p style="margin:0 0 10px 0;padding:0;font-size:14px;"><span style="display:block;font-weight:bold;font-size:13px">Name</span> ' . $first_name . ' ' . $last_name . '</p>
          <p style="margin:0 0 10px 0;padding:0;font-size:14px;"><span style="display:block;font-weight:bold;font-size:13px;">Email</span> ' . $email . '</p>
          <p style="margin:0 0 10px 0;padding:0;font-size:14px;"><span style="display:block;font-weight:bold;font-size:13px;">Phone</span> ' . $contact_number . '</p>
        </td>
        <td style="width:50%;padding:20px;vertical-align:top" colspan="2">
          <p style="margin:0 0 10px 0;padding:0;font-size:14px;"><span style="display:block;font-weight:bold;font-size:13px;">Address</span> ' . $address . ', ' . $city . ', ' . $zipcode . '</p>
          <p style="margin:0 0 10px 0;padding:0;font-size:14px;"><span style="display:block;font-weight:bold;font-size:13px;">Number of guest</span> ' . $num_guest . '</p>
          <p style="margin:0 0 10px 0;padding:0;font-size:14px;"><span style="display:block;font-weight:bold;font-size:13px;">Duration of your vacation</span><div style="font-size: 17px; color:mediumblue; font-weight: bold;"><small>' . date_format(date_create($check_in),"Y-m-d (l)") . '</small>  to <small>' . date_format(date_create($check_out),"Y-m-d (l)") . '.</small></p>
        </td>
      </tr>
      <tr  >
        <th  style="font-size:14px; padding:10px; border-bottom: 3px solid #929090; border-top:3px solid #929090 ;">Availed</th>
        <th  style="font-size:14px; padding:10px; border-bottom: 3px solid #929090; border-top:3px solid #929090 ;">Rate</th>
        <th  style="font-size:14px; padding:10px; border-bottom: 3px solid #929090; border-top:3px solid #929090 ;">Night(s)</th>
        <th  style="font-size:14px; padding:10px; border-bottom: 3px solid #929090; border-top:3px solid #929090 ;">Qty</th>
        <th  style="font-size:14px; padding:10px; border-bottom: 3px solid #929090; border-top:3px solid #929090 ;">Total Amount</th>
      </tr>
      '. $room_rows.'
    </tbody>
    <tfooter>
      <tr style="text-align: center;">
          <td></td>
          <td></td>
          <td></td>
          <td style="font-size:14px;padding:10px 15px 0 15px;"><b>Vatable Sales</b></td>
        <td colspan="1" style="font-size:14px;padding:10px 15px 0 15px;">
        ₱'.number_format($vatable,2).'
        </td>
      </tr>
        <tr style="text-align: center;">
          <td></td>
          <td></td>
          <td></td>
          <td style="font-size:14px;padding:10px 15px 0 15px;"><b>VAT (12%)</b></td>
        <td colspan="1" style="font-size:14px;padding:10px 15px 0 15px;">
        ₱'.number_format($vat,2).'
        </td>
      </tr>
        <tr style="text-align: center; ">
          <td></td>
          <td></td>
          <td></td>
          <td style="font-size:14px;padding:10px 15px 0 15px; /*border-bottom: 3px solid #929090;*/"><b>Subtotal</b></td>
        <td colspan="1" style="font-size:14px;padding:10px 15px 0 15px; /*border-bottom: 3px solid #929090;*/">
        ₱'.number_format($total_amount,2).'
        </td>
      </tr>
      
        <!--<tr style="text-align: center;">
          <td></td>
          <td></td>
          <td></td>
          <td style="font-size:14px;padding:10px 15px 0 15px;"><b>Payed Amount</b></td>
        <td colspan="1" style="font-size:14px;padding:10px 15px 0 15px;">
         Php 5,000.00
        </td>
      </tr> 
        <tr style="text-align: center;">
          <td></td>
          <td></td>
          <td></td>
          <td style="font-size:14px;padding:10px 15px 0 15px;"><b>Balance</b></td>
        <td colspan="1" style="font-size:14px;padding:10px 15px 0 15px;">
         Php 5,000.00
        </td>
      </tr>-->

      <tr>
          <td style="height: 1rem;"></td>
      </tr>
       <tr style="text-align: center;  ">
          <td></td>
          <td></td>
          <td></td>
          <td style="font-size:14px;padding:10px 15px 0 15px; /*border-bottom: 3px solid #929090;*/ color:navy"><b>Downpayment</b></td>
        <td colspan="1" style="font-size:14px;padding:10px 15px 0 15px; /*border-bottom: 3px solid #929090;*/color:navy">
        ₱'.number_format($downpayment,2).'
        </td>
      </tr>
    </tfooter>
    <tr>
        <td style="height: 3rem;"></td>
    </tr>
    <tr >
        <td colspan="5"><b style="font-family:Arial, Helvetica, sans-serif; ">HOW TO PAY?</b></td>
    </tr>
    <tr>
        <td colspan="5" style="color: #6b6b6b;">* Payment is available only for Bank Deposit / BDO Account number - 006844224985 | BDO Account name - Blue Garden Resort</td>
       
    </tr>
    <tr> <td colspan="5" style="color: #6b6b6b;">* Deposit your 50% Downpayment to bank, <br/>and upload your picture of bank receipt here <a href="http://bluegardenresort.com/myBooking.html" target="_blank">My Booking</a></td></tr>
    
    <tr>
        <td style="height: 1rem;"></td>
    </tr>
      <tr >
        <td colspan="5"><b style="font-family:Arial, Helvetica, sans-serif; ">POLICY & CONDITIONS</b></td>
    </tr>
    <tr><td colspan="5" style="color:#6b6b6b">*You need to pay your 50% downpayment before payment due, else your booking will be voided</td></tr>
    <tr><td colspan="5" style="color:#6b6b6b">*Downpayment is strictly 50% of the Total amount only</td></tr>
    <tr><td colspan="5" style="color:#6b6b6b">*No Cancellation/Re-book once the booking is paid</td></tr>
    <tr><td colspan="5" style="color:#6b6b6b">*No Refund</td></tr>
  </table>
</body>

</html>';


require("email/PHPMailer-master/src/PHPMailer.php");
require("email/PHPMailer-master/src/SMTP.php");
require("email/PHPMailer-master/src/Exception.php");


$mail = new PHPMailer\PHPMailer\PHPMailer();
$mail->IsSMTP();

$mail->CharSet = "UTF-8";
$mail->Host = "sg2plzcpnl491274.prod.sin2.secureserver.net";
//$mail->SMTPAutoTLS = false; 
$mail->SMTPDebug = 1;
$mail->Port = 25; //465 or 587

$mail->SMTPSecure = 'tsl';
$mail->SMTPAuth = true;
$mail->IsHTML(true);

//Authentication
$mail->Username = "officialbluegardenresort@bluegardenresortph.com";
$mail->Password = "Bluegardenresort";

//Set Params
$mail->AddEmbeddedImage('../img/core-img/logo.png', 'logo_2u');

$mail->SetFrom("officialbluegardenresort@bluegardenresortph.com", "Blue Garden Hotel & Resort");
$mail->AddAddress($email);
$mail->AddCC("oofficialbluegardenresort@bluegardenresortph.com");
$mail->Subject = "Booking Invoice | Blue Garden Hotel & Resort";
$mail->Body = $email_body;



if (!$mail->Send()) {
  echo "Mailer Error: " . $mail->ErrorInfo;
} else {
  echo "Message has been sent";
}
?>
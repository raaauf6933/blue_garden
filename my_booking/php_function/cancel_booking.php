<?php
include "../../php_functions/dbconn.php";


$reservation_id = $_POST['reservation_id'];

$sql = mysqli_query($conn, "UPDATE reservation SET status = '8' WHERE reservation_id = '$reservation_id' ");


$sql_guest = mysqli_query($conn, "SELECT *
FROM reservation rv
left join guest g on g.guest_id = rv.guest_id
where rv.reservation_id = '$reservation_id'");

$total_amount = 0;
$guest_name = "";
$guest_email = "";
$guest_phone = "";
$guest_address = "";
$num_guest = "";
$check_in = "";
$check_out = "";

while ($row = mysqli_fetch_assoc($sql_guest)) {
    $guest_name = $row['first_name'] . " " . $row['last_name'];
    $guest_email = $row['email'];
    $guest_phone = $row['contact_number'];
    $guest_address = $row['addressline_1'] . ", " . $row['city'] . ", " . $row['zipcode'];
    $num_guest = $row['num_guest'];
    $check_in = $row['checkin_date'];
    $check_out = $row['checkout_date'];
    $reservation_date = $row['reservation_date'];
    $booking_reference = $row['booking_reference'];
    $reservation_id = $row['reservation_id'];
}


$email_body = '<html>
<style></style>
<body
  style="
    background-color: #ffffff;
    font-family: Open Sans, sans-serif;
    font-size: 100%;
    font-weight: 400;
    line-height: 1.4;
    color: #000;
  "
>
  <table
    style="
      max-width: 670px;
      margin: 50px auto 10px;
      background-color: #efefef;
      padding: 50px;
      -webkit-border-radius: 3px;
      -moz-border-radius: 3px;
      border-radius: 3px;
      -webkit-box-shadow: 0 1px 3px rgba(0, 0, 0, 0.12),
        0 1px 2px rgba(0, 0, 0, 0.24);
      -moz-box-shadow: 0 1px 3px rgba(0, 0, 0, 0.12),
        0 1px 2px rgba(0, 0, 0, 0.24);
      box-shadow: 0 1px 3px rgba(0, 0, 0, 0.12), 0 1px 2px rgba(0, 0, 0, 0.24);
      border-top: solid 10px #ef7e24;
      box-shadow: 0 1rem 3rem rgba(0, 0, 0, 0.175) !important;
    "
  >
    <thead>
      <tr>
        <th style="text-align: left" colspan="4">
          <img style="max-width: 70px" src="cid:logo_2u" /><strong>
            Fairfields Resort & Playhouse Inn.</strong
          >
        </th>
        <th style="text-align: right; font-weight: 400"></th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td
          style="
            height: 35px;
            text-align: center;
            padding: 2rem;
            color: #d14148 !important;
          "
          colspan="5"
        >
          <h2>YOUR BOOKING HAS BEEN CANCELLED</h2>
        </td>
      </tr>
      <tr>
        <td colspan="5" style="border: solid 1px #ddd; padding: 10px 20px">
          <p style="font-size: 14px; margin: 0 0 6px 0">
            <span
              style="
                font-weight: bold;
                display: inline-block;
                min-width: 150px;
              "
              >Status</span
            ><b style="color: red; font-weight: normal; margin: 0"
              >Cancelled</b
            >
          </p>
          <p style="font-size: 14px; margin: 0 0 6px 0">
            <span
              style="
                font-weight: bold;
                display: inline-block;
                min-width: 146px;
              "
              >Reservation ID</span
            >
            <b style="color: black; font-weight: normal; margin: 0"
              >'. $reservation_id. '</b
            >
          </p>
          <p style="font-size: 14px; margin: 0 0 6px 0">
            <span
              style="
                font-weight: bold;
                display: inline-block;
                min-width: 146px;
              "
              >Booking Reference</span
            ><b style="color: black; font-weight: normal; margin: 0"
            >' . $booking_reference.'</b
          >
          </p>
        </td>
      </tr>

      <!-- <tr>
      <td style="width:50%;padding:20px;vertical-align:top" colspan="3">
        <p style="margin:0 0 10px 0;padding:0;font-size:14px;"><span style="display:block;font-weight:bold;font-size:13px">Name</span> </p>
        <p style="margin:0 0 10px 0;padding:0;font-size:14px;"><span style="display:block;font-weight:bold;font-size:13px;">Email</span> </p>
        <p style="margin:0 0 10px 0;padding:0;font-size:14px;"><span style="display:block;font-weight:bold;font-size:13px;">Phone</span> </p>
      </td>
      <td style="width:50%;padding:20px;vertical-align:top" colspan="2">
        <p style="margin:0 0 10px 0;padding:0;font-size:14px;"><span style="display:block;font-weight:bold;font-size:13px;">Address</span></p>
        <p style="margin:0 0 10px 0;padding:0;font-size:14px;"><span style="display:block;font-weight:bold;font-size:13px;">Number of gusets</span> </p>
        <p style="margin:0 0 10px 0;padding:0;font-size:14px;"><span style="display:block;font-weight:bold;font-size:13px;">Duration of your vacation</span><div style="font-size: 17px; color:mediumblue; font-weight: bold;"><small></small>  to <small></small></p>
      </td>
    </tr>
    <tr  >
      <th  style="font-size:14px; padding:10px; border-bottom: 3px solid #929090; border-top:3px solid #929090 ;">Availed</th>
      <th  style="font-size:14px; padding:10px; border-bottom: 3px solid #929090; border-top:3px solid #929090 ;">Rate</th>
      <th  style="font-size:14px; padding:10px; border-bottom: 3px solid #929090; border-top:3px solid #929090 ;">Night(s)</th>
      <th  style="font-size:14px; padding:10px; border-bottom: 3px solid #929090; border-top:3px solid #929090 ;">Qty</th>
      <th  style="font-size:14px; padding:10px; border-bottom: 3px solid #929090; border-top:3px solid #929090 ;">Total Amount</th>
    </tr>
<tr style="text-align: center;">
      <td  style="padding:15px;">
        <p style="font-size:14px;margin:0;padding:0px;font-weight:bold;">
          <span style="display:block;font-size:13px;font-weight:normal;"></span>
        </p>
      </td>
      <td  style="padding:15px;">
        <p style="font-size:14px;margin:0;padding:0px;font-weight:bold;">
          <span style="display:block;font-size:13px;font-weight:normal;"></span>
        </p>
      </td>
      <td  style="padding:15px;">
        <p style="font-size:14px;margin:0;padding:0px;font-weight:bold;">
          <span style="display:block;font-size:13px;font-weight:normal;"></span>
        </p>
      </td>
      <td  style="padding:15px;">
        <p style="font-size:14px;margin:0;padding:0px;font-weight:bold;">
          <span style="display:block;font-size:13px;font-weight:normal;"></span>
        </p>
      </td>
      <td  style="padding:15px;">
        <p style="font-size:14px;margin:0;padding:0px;font-weight:bold;">
          <span style="display:block;font-size:13px;font-weight:normal;"></span>
        </p>
      </td>

    </tr> -->
    </tbody>
    <!-- <tfooter>
    <tr style="text-align: center;">
        <td></td>
        <td></td>
        <td></td>
        <td style="font-size:14px;padding:10px 15px 0 15px;"><b>Vatable Sales</b></td>
      <td colspan="1" style="font-size:14px;padding:10px 15px 0 15px;">
 
      </td>
    </tr>
      <tr style="text-align: center;">
        <td></td>
        <td></td>
        <td></td>
        <td style="font-size:14px;padding:10px 15px 0 15px;"><b>VAT (12%)</b></td>
      <td colspan="1" style="font-size:14px;padding:10px 15px 0 15px;">
 
      </td>
    </tr>
      <tr style="text-align: center; ">
        <td></td>
        <td></td>
        <td></td>
        <td style="font-size:14px;padding:10px 15px 0 15px; /*border-bottom: 3px solid #929090;*/"><b>Subtotal</b></td>
      <td colspan="1" style="font-size:14px;padding:10px 15px 0 15px; /*border-bottom: 3px solid #929090;*/">
     
      </td>
    </tr> -->

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

    <!-- <tr>
        <td style="height: 1rem;"></td>
    </tr>
     <tr style="text-align: center;  ">
        <td></td>
        <td></td>
        <td></td>
        <td style="font-size:14px;padding:10px 15px 0 15px; /*border-bottom: 3px solid #929090;*/ color:navy"><b>Payed Amount</b></td>
      <td colspan="1" style="font-size:14px;padding:10px 15px 0 15px; /*border-bottom: 3px solid #929090;*/color:navy">
  
      </td>
    </tr>
    <tr style="text-align: center;  ">
        <td></td>
        <td></td>
        <td></td>
        <td style="font-size:14px;padding:10px 15px 0 15px; /*border-bottom: 3px solid #929090;*/ color:navy"><b>Balance</b></td>
      <td colspan="1" style="font-size:14px;padding:10px 15px 0 15px; /*border-bottom: 3px solid #929090;*/color:navy">
     
      </td>
    </tr>
  </tfooter>
  <tr>
      <td style="height: 3rem;"></td>
  </tr> -->
    <!-- <tr >
      <td colspan="5"><b style="font-family:Arial, Helvetica, sans-serif; ">HOW TO PAY?</b></td>
  </tr>
  <tr>
      <td colspan="5" style="color: #6b6b6b;">* Payment is available only for Bank Deposit</td>
     
  </tr>
  <tr> <td colspan="5" style="color: #6b6b6b;">* Deposit your 50% Downpayment to bank, <br/>and upload your picture of bank receipt here <a href="http://fairfieldsresort.com/my_booking.html" target="_blank">My Booking</a></td></tr>
  
  <tr>
      <td style="height: 1rem;"></td>
  </tr>
    <tr >
      <td colspan="5"><b style="font-family:Arial, Helvetica, sans-serif; ">POLICY & CONDITIONS</b></td>
  </tr>
  <tr><td colspan="5" style="color:#6b6b6b">*You need to pay your 50% downpayment before payment due, else your booking will be voided</td></tr>
  <tr><td colspan="5" style="color:#6b6b6b">*Downpayment is strictly 50% of the Total amount only</td></tr>
  <tr><td colspan="5" style="color:#6b6b6b">*No Cancellation/Re-book once the booking is paid</td></tr>
  <tr><td colspan="5" style="color:#6b6b6b">*No Refund</td></tr> -->
  </table>
</body>
</html>
';


require("email/PHPMailer-master/src/PHPMailer.php");
require("email/PHPMailer-master/src/SMTP.php");
require("email/PHPMailer-master/src/Exception.php");


$mail = new PHPMailer\PHPMailer\PHPMailer();
$mail->IsSMTP();

$mail->CharSet = "UTF-8";
$mail->Host = "sg2plzcpnl456440.prod.sin2.secureserver.net";
//$mail->SMTPAutoTLS = false; 
$mail->SMTPDebug = 1;
$mail->Port = 25; //465 or 587

$mail->SMTPSecure = 'tsl';
$mail->SMTPAuth = true;
$mail->IsHTML(true);

//Authentication
$mail->Username = "officialbluegardenresort@bluegardenresort.com";
$mail->Password = "Bluegardenresort";

//Set Params
$mail->AddEmbeddedImage('../../img/core-img/logo.png', 'logo_2u');

$mail->SetFrom("officialbluegardenresort@bluegardenresort.com", "Blue Garden Hotel & Resort");
$mail->AddAddress($guest_email);
$mail->AddCC("officialbluegardenresort@bluegardenresort.com");
$mail->Subject = "Booking Cancelled | Blue Garden Hotel & Resort";
$mail->Body = $email_body;



if (!$mail->Send()) {
//   echo "Mailer Error: " . $mail->ErrorInfo;
} else {
//   echo "Message has been sent";
}



echo ($sql);

?>
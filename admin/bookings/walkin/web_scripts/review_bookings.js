$(document).ready(function () {
  if (sessionStorage.getItem("user_info") == null)
    window.location = "../../authentication/login.html";

  const formatter = new Intl.NumberFormat("en-IN", {
    style: "currency",
    currency: "PHP",
    minimumFractionDigits: 2,
  });

  $("#user_admin").html(JSON.parse(sessionStorage.getItem("user_info")).name);

  if (sessionStorage.getItem("walkin_guest_details") == null)
    window.location = "./guest_details.html";

  let guest_details = JSON.parse(
    sessionStorage.getItem("walkin_guest_details")
  );

  var today = moment();
  var tomorrow = moment(today).add(1, "days");

  $("#guest_name").html(
    guest_details.first_name + " " + guest_details.last_name
  );
  $("#guest_num").html(guest_details.num_guest);
  $("#guest_address").html(guest_details.address);
  $("#guest_contact").html(guest_details.contact_num);
  $("#guest_email").html(guest_details.email);

  let check_in = new Date(sessionStorage.getItem("walkin_checkin"));
  let check_out = new Date(sessionStorage.getItem("walkin_checkout"));

  let timediff = check_out.getTime() - check_in.getTime();
  let nights = timediff / (1000 * 3600 * 24);

  $("#check_in").html(
    moment(sessionStorage.getItem("walkin_checkin")).format("DD MMMM YYYY") +
      " (" +
      moment(sessionStorage.getItem("walkin_checkin")).format("dddd") +
      ")"
  );
  $("#check_out").html(
    moment(sessionStorage.getItem("walkin_checkout")).format("DD MMMM YYYY") +
      " (" +
      moment(sessionStorage.getItem("walkin_checkout")).format("dddd") +
      ")"
  );
  $("#nights").html(nights);

  let room_details = JSON.parse(sessionStorage.getItem("walkin_room_details"));

  let sub_total = 0;
  room_details.map((room) => {
    sub_total += room.new_price;
    $("#invoice > tbody").append(
      "<tr>" +
        "<td>" +
        room.roomtype_name +
        "</td>" +
        "<td> " +
        formatter.format(room.new_price / room.num_rooms / nights) +
        "</td>" +
        "<td>" +
        nights +
        "</td>" +
        "<td>" +
        room.num_rooms +
        "</td>" +
        "<td style='text-align: right'> " +
        formatter.format(room.new_price) +
        "</td>" +
        "</tr>"
    );
  });

  let vatRate = 0;
  $.ajax({
    url: "../../php_function/content_settings/get_vatrate.php",
    type: "GET",
  }).then((e) => {
    let res = JSON.parse(e);
    vatRate = parseFloat(res[0].value);
    let total_amount = sub_total;
    let vatable_sales = total_amount / vatRate;
    let VAT = total_amount - vatable_sales;

    let downpayment = total_amount / 2;

    $("#vatable").html(formatter.format(vatable_sales));
    $("#vat").html(formatter.format(VAT));
    $("#sub_total").html(formatter.format(total_amount));
    $("#downpayment").html(formatter.format(downpayment));
    $("#total_amount").html(formatter.format(total_amount));
  });

  let selected_rooms = [];

  $("#confirm").click(() => {
    $("#confirm").attr("disabled", "disabled");
    $.LoadingOverlay("show", {
      image: "",
      progress: true,
    });
    var count = 0;
    var interval = setInterval(function () {
      if (count >= 100) {
        clearInterval(interval);
        $.LoadingOverlay("hide");
        return;
      }
      count += 20;
      $.LoadingOverlay("progress", count);
    }, 300);

    room_details.map((room) => {
      room.room_ids.map((rooms) => {
        selected_rooms.push(rooms);
      });
    });

    let reservation_id = parseInt(
      Date.now().toString().substring(1, 5) +
        parseInt(Math.random().toString().substring(2, 6))
    );

    let guest_id = parseInt(
      Date.now().toString().substring(2, 6) +
        parseInt(Math.random().toString().substring(3, 7))
    );

    let billing_id = parseInt(
      Date.now().toString().substring(3, 7) +
        parseInt(Math.random().toString().substring(4, 8))
    );

    let new_check_in = moment(check_in).format("YYYY-MM-DD");
    let new_check_out = moment(check_out).format("YYYY-MM-DD");

    $.ajax({
      url: "../../php_function/walkin/validate_rooms.php",
      data:
        "selected_rooms=" +
        JSON.stringify(selected_rooms) +
        "&checkin_date=" +
        new_check_in +
        "&checkout_date=" +
        new_check_out,
      type: "POST",
      success: function (response) {
        let res = response;
        if (res == '"1"') {
          if (moment(tomorrow._d).format("YYYY-MM-DD") == new_check_in) {
            setTimeout(function () {
              Swal.fire({
                icon: "success",
                title: "Booking Successfull",
                footer:
                  "<span class='text-info'>You will direct to Confirmed Bookings page in 5 seconds...</span>",
                timer: 5000,
                showCancelButton: false,
                showConfirmButton: false,
              });
            }, 2100);
          } else {
            setTimeout(function () {
              Swal.fire({
                icon: "success",
                title: "Booking Successfull",
                footer:
                  "<span class='text-info'>You will direct to Confirmed Bookings in 5 seconds...</span>",
                timer: 5000,
                showCancelButton: false,
                showConfirmButton: false,
              });
            }, 2100);
          }

          $.ajax({
            url: "../../php_function/walkin/insert_reservation.php",
            data:
              "guest_id=" +
              guest_id +
              "&first_name=" +
              guest_details.first_name +
              "&last_name=" +
              guest_details.last_name +
              "&gender=" +
              guest_details.gender +
              "&contact_number=" +
              guest_details.contact_num +
              "&email=" +
              guest_details.email +
              "&address=" +
              guest_details.address +
              "&city=" +
              guest_details.city +
              "&zip_code=" +
              guest_details.zipcode +
              "&reservation_id=" +
              reservation_id +
              "&billing_id=" +
              billing_id +
              "&checkin_date=" +
              new_check_in +
              "&num_guest=" +
              guest_details.num_guest +
              "&checkout_date=" +
              new_check_out +
              "&reservation_type=" +
              1 +
              "&status=" +
              4 +
              "&room_details=" +
              JSON.stringify(room_details),
            type: "POST",
            success: function (response) {
              localStorage.clear();
            },
          });

          setTimeout(() => {
            window.location = "../confirmed_bookings.html";
          }, 7200);
        } else {
          setTimeout(function () {
            Swal.fire({
              icon: "warning",
              title: "Oops...",
              text: "Something went wrong!, Booking Unsuccessfull",
              footer:
                "<span class='text-info'>You will direct to dashboard page in 5 seconds...</span>",
              timer: 5000,
              showCancelButton: false,
              showConfirmButton: false,
            });
          }, 2100);

          setTimeout(() => {
            window.location = "../../index.html";
          }, 7100);
        }
      },
    });
  });
});

$(function() {

    window.addEventListener("message", function(event) {

        if (event.data.action == "showIdCard") {

            let fecha = event.data.array.dateofbirth.split("-");
            let fechaFormato = fecha[2] + "/" + fecha[1] + "/" + fecha[0];
            $("#name").text(event.data.array.firstname || "n/a");
            $("#lastName").text(event.data.array.lastname || "n/a");
            $("#dob").text(fechaFormato || "n/a");
            $("#gender").text(event.data.array.gender || "n/a");
            $("#player_photo").attr("src", event.data.array.url);
            $("#idCard").fadeIn(300);
        }

        if (event.data.action == "closeIdCard") {
            $("#idCard").fadeOut(300);
        }
    });



});
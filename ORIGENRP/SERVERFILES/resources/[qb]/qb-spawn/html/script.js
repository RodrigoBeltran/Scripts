var click = document.getElementById("click");
var over_button = document.getElementById("over_button");
click.volume = 0.2;
over_button.volume = 0.3;

$(document).ready(function() {

    $(".container").hide();
    $("#submit-spawn").hide()

    window.addEventListener('message', function(event) {
        var data = event.data;
        if (data.type === "ui") {
            if (data.status == true) {
                $(".container").fadeIn(250);
            } else {
                $(".container").fadeOut(250);
            }
        }

        if (data.action == "setupLocations") {
            setupLocations(data.locations, data.houses)
        }

        if (data.action == "setupAppartements") {
            setupApps(data.locations)
        }
    })
})

var currentLocation = null

$(document).on('click', '.location', function(evt) {
    evt.preventDefault(); //dont do default anchor stuff
    click.play();
    var location = $(this).data('location'); //get the text
    var type = $(this).data('type'); //get the text
    var label = $(this).data('label'); //get the text
    if (type !== "lab") {
        $("#spawn-label").html('<i class="fas fa-check"></i> Confirmar')
        $("#submit-spawn").attr("data-location", location);
        $("#submit-spawn").attr("data-type", type);
        $("#submit-spawn").fadeIn(300);
        $("#submit-spawn").mouseenter(function() {
            over_button.play();
        });
        $.post('https://qb-spawn/setCam', JSON.stringify({
            posname: location,
            type: type,
        }));
        if (currentLocation !== null) {
            $(currentLocation).removeClass('selected');
        }
        $(this).addClass('selected');
        currentLocation = this
    }
});



$(document).on('click', '#submit-spawn', function(evt) {
    evt.preventDefault(); //dont do default anchor stuff
    click.play();
    var location = $(this).data('location');
    var spawnType = $(this).data('type');
    $(".container").fadeOut(300, function() {
        $(".contenedor").css("opacity", "0");


    })
    $(".container").addClass("hideContainer").fadeOut("9000");
    setTimeout(function() {
        $(".hideContainer").removeClass("hideContainer");
    }, 900);
    if (spawnType !== "appartment") {
        $.post('https://qb-spawn/spawnplayer', JSON.stringify({
            spawnloc: location,
            typeLoc: spawnType
        }));
    } else {
        $.post('https://qb-spawn/chooseAppa', JSON.stringify({
            appType: location,
        }));
    }
});

function setupLocations(locations, myHouses) {
    var parent = $('.spawn-locations')
    $(parent).html("");

    //$(parent).append('<div class="loclabel" id="location" data-location="null" data-type="lab" data-label="¿Dónde quieres comenzar?"><img src="https://i.imgur.com/4v1LZXX.png" style="margin-top: -59px;margin-left:98px;"><p><span id="null">¿Dónde quieres comenzar?</span></p></div>')

    setTimeout(function() {
        $(parent).append('<div class="location" id="location" data-location="current" data-type="current" data-label="Last Location"><p><span id="current-location"><i class="fas fa-clock"></i></br>Última Localización</span></p></div>');
        var delay = 0;
        $.each(locations, function(index, location) {
            delay += 0.02;
            $(parent).append('<div class="location" style="animation-delay=' + delay + 's" id="location" data-location="' + location.location + '" data-type="normal" data-label="' + location.label + '"><p><i class="fas fa-map-marker-alt"></i></br><span id="' + location.location + '">' + location.label + '</span></p></div>')
        });

        if (myHouses != undefined) {
            $.each(myHouses, function(index, house) {
                delay += 0.02;

                $(parent).append('<div class="location" style="animation-delay=' + delay + 's" id="location" data-location="' + house.house + '" data-type="house" data-label="' + house.label + '"><p><i class="fas fa-home"></i></br><span id="' + house.house + '">' + house.label + '</span></p></div>')
            });
        }
        $(".location").mouseenter(function() {
            over_button.play();
        });
        $(parent).append('<div class="submit-spawn" id="submit-spawn"><p><span id="spawn-label"></span></p></div>');
        $(".contenedor").css("opacity", "100%");

        $('.submit-spawn').hide();
    }, 100)
}

function setupApps(apps) {
    var parent = $('.spawn-locations');
    var delay = 0;
    $(parent).html("");

    //$(parent).append('<div class="loclabel" id="location" data-location="null" data-type="lab" data-label="Choose a apartment"><p><span id="null">Elige un apartamento</span></p></div>')

    $.each(apps, function(index, app) {
        delay += 0.02;

        $(parent).append('<div class="location" style="animation-delay=' + delay + 's" id="location" data-location="' + app.name + '" data-type="appartment" data-label="' + app.label + '"><p><i class="fas fa-home"></i></br><span id="' + app.name + '">' + app.label + '</span></p></div>')
    });

    $(parent).append('<div class="submit-spawn" id="submit-spawn"><p><span id="spawn-label"></span></p></div>');
    $(".contenedor").css("opacity", "100%");

    $('.submit-spawn').hide();
}
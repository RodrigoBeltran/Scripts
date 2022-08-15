var abrochar = document.getElementById("abrochar");
var desabrochar = document.getElementById("desabrochar");
var sound_confirm = document.getElementById("confirm-sound");

 abrochar.volume = 0.5;
 desabrochar.volume = 0.5;

$(document).on('keydown', function() {
    switch (event.keyCode) {
        case 27:
            ESC
            //Inventory.Close();
            break;
    }
});

var moneyTimeout = null;
let voiceControl = false;

(() => {
    QBHud = {};

    QBHud.Open = function(data) {
        $(".money-cash").css("display", "block");
        $(".money-bank").css("display", "block");
        $("#cash").html(data.cash);
        $("#bank").html(data.bank);
    };

    QBHud.Close = function() {

    };

    QBHud.Show = function(data) {
        if (data.type == "cash") {
            $(".money-cash").fadeIn(150);
            $("#cash").html(data.cash);
            setTimeout(function() {
                $(".money-cash").fadeOut(750);
            }, 3500)
        } else if (data.type == "bank") {
            $(".money-bank").fadeIn(150);
            $("#bank").html(data.bank);
            setTimeout(function() {
                $(".money-bank").fadeOut(750);
            }, 3500)
        }
    };

    QBHud.ToggleSeatbelt = function(data) {
        if (data.seatbelt) {
            abrochar.play();
            $(".ui-car-seatbelt .icon").removeClass("sin-cinturon");

        } else {
            if(!$(".ui-car-seatbelt .icon").hasClass("sin-cinturon"))
            {
                desabrochar.play();
            }
            $(".ui-car-seatbelt .icon").addClass("sin-cinturon");

        }
    };

    QBHud.ToggleCruise = function(data) {
        if (data.cruise) {
            $(".ui-car-cruise .icon").css("opacity", "100");
        } else {
            $(".ui-car-cruise .icon").css("opacity", "0.4");

        }
    };

    QBHud.CarHud = function(data) {
        if (data.show) {
            $(".ui-car-seatbelt").fadeIn();
            $(".ui-car-container").fadeIn();
        } else {
            $(".ui-car-container").fadeOut();
        }
    };

    QBHud.DisableSeatbelt = function() {
        $(".ui-car-seatbelt").hide();
    }

    QBHud.ShowVoiceControl = function() {
        voiceControl = true;
        let rango = '<img class="escuchando" src="escuchando.svg"> Escuchando';
        $(".rango").html(rango).css("opacity", "100");
        $("#voz").addClass("hablando");
    }

    QBHud.HideVoiceControl = function() {
        voiceControl = false;
        setTimeout(function() {
            $(".rango").css("opacity", "0");
        }, 2000);
        $(".voice .cuadro-estado").removeClass("hablando");
    }

    QBHud.UpdateHud = function(data) {
        $(".ui-container").css("display", data.show ? "none" : "block");
        if (data.health > 50) {
            $(".health").css("opacity", "0").fadeOut(300);
        } else {

            $(".health").fadeIn(300);
            $('#vida style').remove();
            $("#vida").append('<style>#vida::after{height:' + data.health + '% !important;}</style>');


        }
        if (data.health < 20) {
            $("#vida").append('<style>#vida::after{animation:limite ease-in-out 0.5s infinite !important;}</style>');
        }

        if (data.armor > 0) {

            $(".armor").fadeIn(300);
            $('#armadura style').remove();
            $("#armadura").append('<style>#armadura::after{height:' + data.armor + '% !important;}</style>');

        } else {
            $(".armor").css("opacity", "0").fadeOut(300);
        }


        if (data.hunger > 50) {
            $(".hunger").css("opacity", "0").fadeOut(300);
        } else {

            $(".hunger").fadeIn(300);
            $('#hambre style').remove();
            $("#hambre").append('<style>#hambre::after{height:' + data.hunger + '% !important;}</style>');
        }
        if (data.hunger < 20) {
            $("#hambre").append('<style>#hambre::after{animation:limite ease-in-out 0.5s infinite !important;}</style>');
        }


        if (data.thirst > 50) {
            $(".thirst").css("opacity", "0").fadeOut(300);
        } else {

            $(".thirst").fadeIn(300);
            $('#sed style').remove();
            $("#sed").append('<style>#sed::after{height:' + data.thirst + '% !important;}</style>');
        }

        if (data.thirst < 20) {
            $("#sed").append('<style>#sed::after{animation:limite ease-in-out 0.5s infinite !important;}</style>');
        }

        if (data.stress > 50) {

            $(".stress").fadeIn(300);
            $('#estress style').remove();
            $("#estress").append('<style>#estress::after{height:' + data.stress + '% !important;}</style>');
        } else {
            $(".stress").css("opacity", "0").fadeOut(300);
        }
        if (!voiceControl) {
            var rango = "Susurro";
            $(".voice")
            switch (data.voice) {
                case 1:
                    rango = "Susurro";

                    cambiarRango(rango);
                    break;
                case 2:
                    rango = "Normal";
                    cambiarRango(rango);


                    break;
                case 3:
                    rango = "Gritar";
                    cambiarRango(rango);


                    break;
            }
            /*$(".voice").find(".progressBar")
            .attr("style", "width: " + data.voice + "%");
            SetProgressBar(data.voice, '.progress-voice')*/


            if (data.talking == 1) {
                //$("#voice-icon").css("color", "#39FF14");
                $(".voice .cuadro-estado").addClass("hablando");

            } else {
                $(".voice .cuadro-estado").removeClass("hablando");

            }
        }

        if (data.nos != null) {
            $(".nos-text").css('display', 'block');
            $(".nos-label").css('display', 'block');
            $(".nos-text").html(data.nos);
        } else {
            $(".nos-text").css('display', 'none');
            $(".nos-label").css('display', 'none');
        }

        $(".fuel-text").html((data.fuel).toFixed(0) + "L.");
        $(".speed-text").html(parseInt(data.speed * 1.60934));
        let rpm = parseInt(data.rpm * 100);
        // $(".rpm .barra-izq, .rpm .barra-der").css("width", rpm+"%");

        $(".rpm .barra-izq, .rpm .barra-der").animate({ width: rpm + "%" }, 500);



    };

    QBHud.Update = function(data) {
        if (data.type == "cash") {
            $(".money-cash").css("display", "block");
            $("#cash").html(data.cash);
            if (data.minus) {
                $(".money-cash").append('<p class="moneyupdate minus">-<span id="cash-symbol">&dollar;&nbsp;</span><span><span id="minus-changeamount">' + data.amount + '</span></span></p>')
                $(".minus").css("display", "block");
                setTimeout(function() {
                    $(".minus").fadeOut(750, function() {
                        $(".minus").remove();
                        $(".money-cash").fadeOut(750);
                    });
                }, 3500)
            } else {
                $(".money-cash").append('<p class="moneyupdate plus">+<span id="cash-symbol">&dollar;&nbsp;</span><span><span id="plus-changeamount">' + data.amount + '</span></span></p>')
                $(".plus").css("display", "block");
                setTimeout(function() {
                    $(".plus").fadeOut(750, function() {
                        $(".plus").remove();
                        $(".money-cash").fadeOut(750);
                    });
                }, 3500)
            }
        }
        $(".money-bank").css("display", "block");
        $("#bank").html(data.bank);
        if (data.minus) {
            $(".money-bank").append('<p class="minus">-<span id="minus-symbol">&dollar;</span><span><span id="minus-changeamount">' + data.amount + '</span></span></p>')
            $(".minus").css("display", "block");
            setTimeout(function() {
                $(".minus").fadeOut(750, function() {
                    $(".minus").remove();
                    $(".money-bank").fadeOut(750);
                });
            }, 3500)
        } else {
            $(".money-bank").append('<p class="plus">+<span id="plus-symbol">&dollar;</span><span><span id="plus-changeamount">' + data.amount + '</span></span></p>')
            $(".plus").css("display", "block");
            setTimeout(function() {
                $(".plus").fadeOut(750, function() {
                    $(".plus").remove();
                    $(".money-bank").fadeOut(750);
                });
            }, 3500)
        }
    };

    window.onload = function(e) {
        window.addEventListener('message', function(event) {
            switch (event.data.action) {
                case "open":
                    QBHud.Open(event.data);
                    break;
                case "close":
                    QBHud.Close();
                    break;
                case "showVoiceControl":
                    QBHud.ShowVoiceControl();
                    break;
                case "hideVoiceControl":
                    QBHud.HideVoiceControl();
                    break;
                case "update":
                    QBHud.Update(event.data);
                    break;
                case "show":
                    QBHud.Show(event.data);
                    break;
                case "hudtick":
                    QBHud.UpdateHud(event.data);
                    break;
                case "car":
                    QBHud.CarHud(event.data);
                    break;
                case "disableSeatbelt":
                    QBHud.DisableSeatbelt();
                    break;
                case "seatbelt":
                    QBHud.ToggleSeatbelt(event.data);

                    break;
                case "cruise":
                    QBHud.ToggleCruise(event.data);
                    break;
                case "mostrar-muerte":
                    mostrarMuerte(event.data.tiempo);
                    break;
                case "mostrar-respawn":
                    mostrarRespawn(event.data.msg);
                    break;
                case "ocultar-muerte":
                    $(".zona-muerte").fadeOut(300);
                    $(".zona-respawn").css("display", "none");
                    break;
                case "mostrar-repostar":
                    mostrarRepostar(event.data.msg);
                    break;
                case "ocultar-repostar":
                    $(".zona-repostar").hide();
                    break;
                case "showPolice":
                    $(".police").fadeIn(300);
                    break;
                case "hidePolice":
                    //$(".police").fadeOut(300);
                    $(".police").hide();
                    break;
                case "mostrarEntorno":
                    //$(".police").fadeOut(300);
                    sound_confirm.play();
                    $(".texto-entorno").text(event.data.text);
                    $(".zona-entorno").fadeIn(300);
                    break;
                case "ocultarEntorno":
                    //$(".police").fadeOut(300);
                    $(".zona-entorno").addClass("scale-out").fadeOut(300, function() {
                        $(".texto-entorno").text("");
                        $(".zona-entorno").removeClass("scale-out");

                    });
                    break;
                case "showRadio":
                   
                    $(".rango").html('<img src="https://i.imgur.com/2eBS7KU.png" class="icono-radio">Radio').css("opacity", "100");
                    $("#voz").addClass("hablando");
                    break;

                case "hideRadio":
                    setTimeout(function() {
                        $(".rango").css("opacity", "0");
                    }, 500);
                    $(".voice .cuadro-estado").removeClass("hablando");
                    break;


            }
        })
    }

})();

function SetProgressBar(value, element) {
    var circle = document.querySelector(element);
    var radius = circle.r.baseVal.value;
    var circumference = radius * 2 * Math.PI;
    var html = $(element).parent().parent().find('span');
    var percent = value * 100 / 100;

    circle.style.strokeDasharray = `${circumference} ${circumference}`;
    circle.style.strokeDashoffset = `${circumference}`;

    const offset = circumference - ((-percent * 99) / 100) / 100 * circumference;
    circle.style.strokeDashoffset = -offset;

    var speed = Math.floor(value * 1.8)
    if (speed == 81 || speed == 131) {
        speed = speed - 1
    }

    html.text(speed);
}
var rangoAnterior = "";

function cambiarRango(rango) {
    if (rango != rangoAnterior && !voiceControl) {

        $(".rango").text(rango).css("opacity", "100");
        setTimeout(function() {
            $(".rango").css("opacity", "0");
        }, 2000);
        rangoAnterior = rango;
    }

}

function mostrarMuerte(tiempo) {
    $(".zona-tiempo").css("display", "block");
    $(".zona-respawn").css("display", "none");
    $(".zona-muerte").css("display", "block");
    $(".zona-muerte .tiempo").text(tiempo)
}

function mostrarRespawn(msg) {
    $(".zona-muerte").css("display", "block");
    $(".zona-tiempo").css("display", "none");
    $(".zona-respawn").css("display", "block");
    $(".zona-respawn").html(msg)
}

function mostrarRepostar(msg) {
    // console.log(msg);
    $(".zona-repostar").html(`<div class="titulo">Gasolinera</div>${msg}`);
    if ($(".zona-repostar").css("display") != "block") {
        $(".zona-repostar").show(0);
    }
}
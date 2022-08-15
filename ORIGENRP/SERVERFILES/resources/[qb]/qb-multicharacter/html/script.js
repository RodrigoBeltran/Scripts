var selectedChar = null;
var WelcomePercentage = "0"
qbMultiCharacters = {}
var Loaded = false;
var click = document.getElementById("click");
var over_button = document.getElementById("over_button");
var background = document.getElementById("background");
var confirmar = document.getElementById("confirm");
var consejoAud = document.getElementById("consejo");
var transition = document.getElementById("transition");
var swipe = document.getElementById("swipe");
confirmar.volume = 0.2;
consejoAud.volume = 0.5;
over_button.volume = 0.3;
swipe.volume = 0.8;
var vol = background.volume;
var slots = 0;
var consejos = [
    '<div class="titulo">¡No olvides alimentarte durante tu partida!</div>La nutrición es igual de importante para ti que para tu personaje',
    '<div class="titulo">¡Valora tu vida!</div>Recuerda que la vida de tu personaje es lo más importante. ¡Valórala!',
    '<div class="titulo">Fair Play</div>No olvides que es importante un juego limpio para que todos los jugadores disfruten.',
    '<div class="titulo">Control por voz</div>Recuerda configurar tu tecla de comandos por voz para poder ejecutar acciones in-game con tu voz.',
    '<div class="titulo">Comandos de voz</div>Puedes sustituir /me por "acción" y /do por "ambiente" durante el control por voz',
    '<div class="titulo">Comandos de voz</div>Puedes decir "Sentarse" o "Fumar" mediante los comandos por voz para que tu personaje realice la acción.',
    '<div class="titulo">Controles</div>Puedes acceder a tu tablet personal pulsando el botón F10.'
];
var intervalSlider;


$(document).ready(function() {
    window.addEventListener('message', function(event) {
        var data = event.data;
        if (data.action == "ui") {
            if (data.toggle) {
                $('.container').show();
                $(".welcomescreen").fadeIn(300);
                qbMultiCharacters.resetAll();

                var originalText = "Cargando información del servidor";
                var loadingProgress = 0;
                var loadingDots = 0;
                $("#loading-text").html(originalText);
                var DotsInterval = setInterval(function() {
                    $("#loading-text").append(".");
                    loadingDots++;
                    loadingProgress++;
                    if (loadingProgress == 3) {
                        originalText = "Validando información de usuario"
                        $("#loading-text").html(originalText);
                    }
                    if (loadingProgress == 4) {
                        originalText = "Cargando información de personajes"
                        $("#loading-text").html(originalText);
                    }
                    if (loadingProgress == 6) {
                        originalText = "Validando personajes"
                        $("#loading-text").html(originalText);
                    }
                    if (loadingDots == 4) {
                        $("#loading-text").html(originalText);
                        loadingDots = 0;
                    }
                }, 500);

                setTimeout(function() {
                    $.post('https://qb-multicharacter/setupCharacters');
                    setTimeout(function() {
                        clearInterval(DotsInterval);
                        loadingProgress = 0;
                        originalText = "Retrieving data";
                        $(".welcomescreen").fadeOut(150, function() {
                            particlesJS.load('particles-js', 'particles.json');
                            $(".videobg").show();
                            $(".title-screen").fadeIn(0, function() {

                                setTimeout(function() {
                                    $(".logo-title").addClass("parpadeo");
                                    $(".fondo-negro").fadeOut(1500);
                                }, 1000);
                            });
                        });

                        background.volume = 0.6;
                        background.currentTime = 0
                        background.play();


                        $(".character, .character-btn, #create-text, #close-reg, .btn-iniciar, .comprar-coins, .btn-home, .principal, .secundaria").mouseenter(function() {
                            over_button.play();
                        });

                        $(".character, .character-btn, #create-text, #close-reg, input, .comprar-coins, .btn-home").click(function() {
                            click.play();
                        });

                        $("#play, .btn-iniciar").click(function() {
                            confirmar.play();
                        });

                    }, 2000);
                }, 2000);
            } else {
                $('.container').fadeOut(250);
                qbMultiCharacters.resetAll();
            }
        }

        if (data.action == "setupCharacters") {
            setupCharacters(event.data.characters)
        }

        if (data.action == "setCountPlayers") {
            setCountPlayers(event.data.count)
        }

        if (data.action == "setCountPlayersGlobal") {
            setCountPlayersGlobal(event.data.countGlobal)
        }

        if (data.action == "setupCharInfo") {
            setupCharInfo(event.data.chardata)
        }

        if (data.action == "stopMusic") {
            musicFadeOut();
        }
    });

    $('.datepicker').datepicker();

});

$(".btn-iniciar").on("click", function() {
    background.volume = 0.3;

    $(".title-screen").fadeOut(300, function() {
        $.post('https://qb-multicharacter/removeBlur');
        cargarHomeScreen();
        setTimeout(function() {
            consejoAud.play();
        }, 500)
    })

});





$('.continue-btn').click(function(e) {
    e.preventDefault();

    // qbMultiCharacters.fadeOutUp('.welcomescreen', undefined, 400);
    // qbMultiCharacters.fadeOutDown('.server-log', undefined, 400);
    // setTimeout(function(){
    //     qbMultiCharacters.fadeInDown('.characters-list', '20%', 400);
    //     qbMultiCharacters.fadeInDown('.character-info', '20%', 400);
    //     $.post('https://qb-multicharacter/setupCharacters');
    // }, 400)
});

$('.disconnect-btn').click(function(e) {
    e.preventDefault();

    $.post('https://qb-multicharacter/closeUI');
    $.post('https://qb-multicharacter/disconnectButton');
});

function setupCharInfo(cData) {

    if (cData == 'empty') {

        $('.character-info-valid').fadeOut(500, function() {
            $('.character-info-valid').html('<img src="https://i.imgur.com/iPiuZZs.png"></br><div id="no-char">Este slot está vacío.<br><br>Pulsa en registrar para comenzar tu nueva historia</div>').fadeIn(500);

        });
    } else {
        var gender = "Hombre"
        if (cData.charinfo.gender == 1) { gender = "Mujer" }
        $('.character-info-valid').fadeOut(500, function() {
            var fecha = cData.charinfo.birthdate.split("-");
            $('.character-info-valid').html(
                '<div class="character-info-box"><div id="info-label">Nombre </div><div class="char-info-js nombre">' + cData.charinfo.firstname + ' ' + cData.charinfo.lastname + '</div></div>' +
                '<div class="character-info-box"><div id="info-label">Nacimiento </div><div class="char-info-js">' + fecha[2] + '/' + fecha[1] + '/' + fecha[0] + '</div></div>' +
                '<div class="character-info-box"><div id="info-label">Sexo </div><div class="char-info-js">' + gender + '</div></div>' +
                '<div class="character-info-box"><div id="info-label">Nacionalidad </div><div class="char-info-js">' + cData.charinfo.nationality + '</div></div>' +
                '<div class="character-info-box"><div id="info-label">Trabajo </div><div class="char-info-js">' + cData.job.label + '</div></div>' +
                '<div class="border-bottom"></div>' +
                '<div class="character-info-box-money f-left"  style="margin-right:10px;"><img src="https://i.imgur.com/LDfg4PW.png"><div class="char-info-js-money">' + cData.money.cash + ' &#36;</div></div>' +
                '<div class="character-info-box-money f-left" style="margin-right:10px;"><img src="https://i.imgur.com/kH6x6mK.png"><div class="char-info-js-money">' + cData.money.bank + ' &#36; </div></div>' +
                '<div class="character-info-box-money f-left"><img src="https://i.imgur.com/C9lMtDx.png"><div class="char-info-js-money">' + cData.money.coins + ' &#36; </div></div>' +
                '<div class="border-bottom"></div>' +
                '<div class="character-info-box-money f-left" style="margin-top: 2px;"><img src="https://i.imgur.com/XScn7EJ.png"><div class="char-info-js-money">' + cData.charinfo.account + '</div></div>' +
                '<div class="border-bottom"></div>' +
                '<div class="character-info-box-money f-left" style="margin-top: 2px;"><img src="https://i.imgur.com/h1slp7t.png"><div class="char-info-js-money">' + cData.charinfo.phone + '</div></div></br><div class="comprar-coins">Consigue tus coins en www.origencompany.com</div>').fadeIn(500);


        });
    }
}

function setupCharacters(characters) {
    slots = characters[0].charSlots
    $.each(characters, function(index, char) {
        $('#char-' + char.cid).html("");
        $('#char-' + char.cid).data("citizenid", char.citizenid);
        setTimeout(function() {
            $('#char-' + char.cid).html('<div id="slot-name"><i class="fas fa-user"></i></br> ' + char.charinfo.firstname + ' ' + char.charinfo.lastname + '</div><span id="cid">' + char.citizenid + '</span>');
            $('#char-' + char.cid).data('cData', char)
            $('#char-' + char.cid).data('cid', char.cid)
        }, 100)
    })
}

function setCountPlayers(count) {
    $('#CountPlayers').text(count);
}

function setCountPlayersGlobal(count) {
    $('#CountPlayersGlobal').text(count);
}

$(document).on('click', '#close-log', function(e) {
    e.preventDefault();
    selectedLog = null;
    $('.welcomescreen').css("filter", "none");
    $('.server-log').css("filter", "none");
    $('.server-log-info').fadeOut(250);
    logOpen = false;
});

$(document).on('click', '.character', function(e) {
    var cDataPed = $(this).data('cData');
    e.preventDefault();

    $("#desbloquear").css("display", "none");
    $("#desbloquear").html('<p><i class="fas fa-coins"></i> Desbloquear slot</p>');
    if (selectedChar === null) {
        selectedChar = $(this);
        if ((selectedChar).data('cid') == "" && selectedChar.hasClass("bloqueado") == false) {
            $(selectedChar).addClass("char-selected");
            setupCharInfo('empty')
            $("#play-text").html('<i class="fas fa-check"></i> Crear Personaje');
            $("#play").css({ "display": "block" });
            //$("#delete").css({"display":"none"});
            $.post('https://qb-multicharacter/cDataPed', JSON.stringify({
                cData: cDataPed
            }));
        } else if (selectedChar.hasClass("bloqueado")) {
            $(selectedChar).addClass("char-selected");

            $("#play").css("display", "none");
            $("#desbloquear").fadeIn(300);
            let data = $("#char-1").data('cData');
            let coins = data.money ? data.money.coins : 0
            $('.character-info-valid').fadeOut(500, function() {
                $('.character-info-valid').html('<img src="https://i.imgur.com/O8kaEye.png"></br><div id="no-char">Este slot está bloqueado.<br><br>Puedes desbloquearlo por 50 Coins</br><div class="character-info-box-money " style="margin-top:15px;"><img src="https://i.imgur.com/C9lMtDx.png"><div class="char-info-js-money">' + coins + ' &#36; </div></div></div>').fadeIn(500);
            });

        } else {
            $(selectedChar).addClass("char-selected");
            setupCharInfo($(this).data('cData'))
            $("#play-text").html('<i class="fas fa-sign-in-alt"></i> Comenzar');
            $("#delete-text").html("Delete");
            $("#play").css({ "display": "block" });
            //$("#delete").css({"display":"block"});
            $.post('https://qb-multicharacter/cDataPed', JSON.stringify({
                cData: cDataPed
            }));
        }
    } else if ($(selectedChar).attr('id') !== $(this).attr('id')) {
        $(selectedChar).removeClass("char-selected");
        selectedChar = $(this);
        if ((selectedChar).data('cid') == "" && selectedChar.hasClass("bloqueado") == false) {
            $(selectedChar).addClass("char-selected");
            setupCharInfo('empty')
            $("#play-text").html('<i class="fas fa-check"></i> Registrar');
            $("#play").css({ "display": "block" });
            //$("#delete").css({"display":"none"});
            $.post('https://qb-multicharacter/cDataPed', JSON.stringify({
                cData: cDataPed
            }));
        } else if (selectedChar.hasClass("bloqueado")) {
            $(selectedChar).addClass("char-selected");

            $("#play").css("display", "none");
            $("#desbloquear").fadeIn(300);
            let data = $("#char-1").data('cData');
            let coins = data.money ? data.money.coins : 0
            $('.character-info-valid').fadeOut(500, function() {
                $('.character-info-valid').html('<img src="https://i.imgur.com/O8kaEye.png"></br><div id="no-char">Este slot está bloqueado.<br><br>Puedes desbloquearlo por 50 Coins</br><div class="character-info-box-money" style="margin-top:15px;"><img src="https://i.imgur.com/C9lMtDx.png"><div class="char-info-js-money">' + coins + ' &#36; </div></div></div>').fadeIn(500);
            });

        } else {
            $(selectedChar).addClass("char-selected");
            setupCharInfo($(this).data('cData'))
            $("#play-text").html('<i class="fas fa-sign-in-alt"></i> Elegir');
            $("#delete-text").html("Delete");
            $("#play").css({ "display": "block" });
            //$("#delete").css({"display":"block"});
            $.post('https://qb-multicharacter/cDataPed', JSON.stringify({
                cData: cDataPed
            }));
        }
    }

});

var entityMap = {
    '&': '&amp;',
    '<': '&lt;',
    '>': '&gt;',
    '"': '&quot;',
    "'": '&#39;',
    '/': '&#x2F;',
    '': '&#x60;',
    '=': '&#x3D;'
};

function escapeHtml(string) {
    return String(string).replace(/[&<>"'=/]/g, function(s) {
        return entityMap[s];
    });
}

function hasWhiteSpace(s) {
    return /\s/g.test(s);
}
$(document).on('click', '#create', function(e) {
    e.preventDefault();

    let firstname = escapeHtml($('#first_name').val())
    let lastname = escapeHtml($('#last_name').val())
    let nationality = escapeHtml($('#nationality').val())
    let birthdate = escapeHtml($('#birthdate').val())
    let gender = escapeHtml($('input:radio[name=gender]:checked').val())
    let cid = escapeHtml($(selectedChar).attr('id').replace('char-', ''))

    //An Ugly check of null objects
    let validado = true;
    $(".char-register-inputs input, .genero").removeClass("error");
    $(".msg-error").fadeOut(300);
    // if (!firstname || !lastname || !nationality || !birthdate || hasWhiteSpace(firstname) || hasWhiteSpace(lastname) || hasWhiteSpace(nationality)) {
    //     console.log("FIELDS REQUIRED")
    // }
    // if (!firstname || hasWhiteSpace(firstname)) {
    //     $("#first_name").addClass("error");
    //     validado = false;
    // }
    // if (!lastname || hasWhiteSpace(lastname)) {
    //     $("#last_name").addClass("error");
    //     validado = false;
    // }
    if (!nationality || hasWhiteSpace(nationality)) {
        $("#nationality").addClass("error");
        validado = false;
    }
    if (!birthdate) {
        $("#birthdate").addClass("error");
        validado = false;
    }
    if ($("#gender1").is(':checked') == false && $("#gender2").is(':checked') == false) {
        $(".genero").addClass("error");
        validado = false;
    }


    if (validado) {
        $.post('https://qb-multicharacter/createNewCharacter', JSON.stringify({
            firstname: firstname,
            lastname: lastname,
            nationality: nationality,
            birthdate: birthdate,
            gender: gender,
            cid: cid,
        }));
        $(".container").fadeOut(150);
        $('.characters-list').css("filter", "none");
        $('.character-info').css("filter", "none");
        //qbMultiCharacters.fadeOutDown('.character-register', '125%', 400);



        refreshCharacters()
            //background.pause();

    } else {
        $(".msg-error").fadeIn(300);
    }
});
// $(document).on('click', '#create', function(e){
//     e.preventDefault();
//     $.post('https://qb-multicharacter/createNewCharacter', JSON.stringify({
//         firstname: $('#first_name').val(),
//         lastname: $('#last_name').val(),
//         nationality: $('#nationality').val(),
//         birthdate: $('#birthdate').val(),
//         gender: $('select[name=gender]').val(),
//         cid: $(selectedChar).attr('id').replace('char-', ''),
//     }));
//     $(".container").fadeOut(150);
//     $('.characters-list').css("filter", "none");
//     $('.character-info').css("filter", "none");
//     qbMultiCharacters.fadeOutDown('.character-register', '125%', 400);
//     refreshCharacters()
// });

$(document).on('click', '#accept-delete', function(e) {
    $.post('https://qb-multicharacter/removeCharacter', JSON.stringify({
        citizenid: $(selectedChar).data("citizenid"),
    }));
    $('.character-delete').fadeOut(150);
    $('.characters-block').css("filter", "none");
    refreshCharacters()
});

function refreshCharacters() {
    $("#fondo-pj").fadeIn(1000);
    $.post('https://qb-multicharacter/setupCharacters');
    setTimeout(function() {
        $(selectedChar).removeClass("char-selected");
        selectedChar = null;
        $("#play").css({ "display": "none" });
        qbMultiCharacters.resetAll();
        $(".character-register").fadeOut(300);
        $('.characters-list').html('<div class="back-btn" id="back-home-pj"><p><i class="fas fa-undo"></i> Volver al Menú</p></div><div class="character scale-in" style="width:100%; animation-delay:0.1s;" id="char-1" data-cid=""><div id="slot-name"><i class="fas fa-plus"></i></br> Slot 1</div><span id="cid"></span></div><div class="character float-left scale-in" style="animation-delay:0.2s" id="char-2" data-cid=""><div id="slot-name"><i class="fas fa-plus"></i></br> Slot 2</div><span id="cid"></span></div><div class="character float-right scale-in" style="animation-delay:0.3s" id="char-3" data-cid=""><div id="slot-name"><i class="fas fa-plus"></i></br> Slot 3</div><span id="cid"></span></div><div class="character float-left scale-in" style="animation-delay:0.4s" id="char-4" data-cid=""><div id="slot-name"><i class="fas fa-plus"></i></br> Slot 4</div><span id="cid"></span></div><div class="character float-right scale-in" style="animation-delay:0.5s" id="char-5" data-cid=""><div id="slot-name"><i class="fas fa-plus"></i></br> Slot 5</div><span id="cid"></span></div><div class="character-btn" id="play"><p id="play-text">Seleccionar personaje</p></div><div class="character-btn" id="desbloquear"><p><i class="fas fa-coins"></i> Desbloquear slot</p></div><div class="character-btn" id="delete" style="display:none;"><p id="delete-text">Seleccionar personaje</p></div>').show();
    }, 1000);


}

$("#close-reg").click(function(e) {
    e.preventDefault();
    $('.characters-list').css("filter", "none");
    //qbMultiCharacters.fadeOutDown('.character-register', '125%', 400);
    $(".character-register").addClass("fadeOut");


    setTimeout(function() {
        $('.character-info').css("opacity", "100").css("transform", "scale(1)");
        $(".character-register").css("display", "none").removeClass("fadeOut");

    }, 400)

})

$("#close-del").click(function(e) {
    e.preventDefault();
    $('.characters-block').css("filter", "none");
    $('.character-delete').fadeOut(150);
})

$(document).on('click', '#play', function(e) {
    e.preventDefault();
    var charData = $(selectedChar).data('cid');

    if (selectedChar !== null) {
        if (charData !== "") {
            $("#fondo-pj").fadeIn(500, function() {
                $.post('https://qb-multicharacter/selectCharacter', JSON.stringify({
                    cData: $(selectedChar).data('cData')
                }));
            });


            // qbMultiCharacters.fadeInDown('.welcomescreen', WelcomePercentage, 400);
            // qbMultiCharacters.fadeInDown('.server-log', '25%', 400);
            setTimeout(function() {
                // qbMultiCharacters.fadeOutDown('.characters-list', "-40%", 400);
                // qbMultiCharacters.fadeOutDown('.character-info', "-40%", 400);
                qbMultiCharacters.resetAll();


                //background.pause();
            }, 1500);
        } else {
            $('.characters-list').css("filter", "blur(2px)")
            $('.character-info').css('opacity', "0").css("transform", "scale(1.5)");
            setTimeout(function() {
                //qbMultiCharacters.fadeInDown('.character-register', '25%', 400);
                $(".character-register").show();

            }, 400)

        }
    }
});

$(document).on('click', '#desbloquear', function(e) {
    e.preventDefault();
    var charData = $(selectedChar).hasClass("bloqueado");

    if (selectedChar !== null) {
        if (charData) {
            if (desbloquearSlot()) {
                confirmar.play();
                bloquearSlots();
            }


        }
    }
});

$(document).on('click', '#delete', function(e) {
    e.preventDefault();
    var charData = $(selectedChar).data('cid');

    if (selectedChar !== null) {
        if (charData !== "") {
            $('.characters-block').css("filter", "blur(2px)")
            $('.character-delete').fadeIn(250);
        }
    }
});

qbMultiCharacters.fadeOutUp = function(element, time) {
    $(element).css({ "display": "block" }).animate({ top: "-80.5%", }, time, function() {
        $(element).css({ "display": "none" });
    });
}

qbMultiCharacters.fadeOutDown = function(element, percent, time) {
    if (percent !== undefined) {
        $(element).css({ "display": "block" }).animate({ top: percent, }, time, function() {
            $(element).css({ "display": "none" });
        });
    } else {
        $(element).css({ "display": "block" }).animate({ top: "103.5%", }, time, function() {
            $(element).css({ "display": "none" });
        });
    }
}

qbMultiCharacters.fadeInDown = function(element, percent, time) {
    $(element).css({ "display": "block" }).animate({ top: percent, }, time);
}

qbMultiCharacters.resetAll = function() {
    // $('.characters-list').hide();
    // $('.characters-list').css("top", "-40");
    // $('.character-info').hide();
    // $('.character-info').css("top", "-40");
    // $('.welcomescreen').show();
    //$('.welcomescreen').css("top", WelcomePercentage);
    $('.server-log').show();
    //$('.server-log').css("top", "25%");
    $(".zona-info").fadeOut(300);
    $(".pantalla-seleccion, .home-screen").fadeOut();
    $(".main-screen").fadeIn();
    $(".welcomescreen").fadeIn(300);
    $(".fondo-negro").fadeIn(0);

}


function musicFadeOut() {
    /* var interval = setInterval(function(){
         if(background.volume>0){
             background.volume = background.volume-0.05;
             console.log(background.volume);
         } else {
             console.log("CERRAR INTERVAL");
             background.pause();
             clearInterval(interval);
         }
     },200);*/
    $(background).animate({ volume: 0 }, 1000);
}

function numeroAleatorio(min, max) {
    return Math.round(Math.random() * (max - min) + min);
}

function bloquearSlots() {

    if ($("#char-2").data('cid') == "") {
        $("#char-2").removeClass("bloqueado").html('<div id="slot-name"><i class="fas fa-plus"></i></br> Slot 2<span id="cid"></span></div>');
    }
    if ($("#char-3").data('cid') == "") {
        $("#char-3").removeClass("bloqueado").html('<div id="slot-name"><i class="fas fa-plus"></i></br> Slot 3<span id="cid"></span></div>');
    }
    if ($("#char-4").data('cid') == "") {
        $("#char-4").removeClass("bloqueado").html('<div id="slot-name"><i class="fas fa-plus"></i></br> Slot 4<span id="cid"></span></div>');
    }
    if ($("#char-5").data('cid') == "") {
        $("#char-5").removeClass("bloqueado").html('<div id="slot-name"><i class="fas fa-plus"></i></br> Slot 5<span id="cid"></span></div>');
    }

    if (slots == 0) {
        $("#char-2, #char-3, #char-4, #char-5").addClass("bloqueado").html('<div id="slot-name" class="slot-muted"><i class="fas fa-ban"></i></br> Personaje bloqueado<span id="cid"></span></span>');
    }
    if (slots == 1) {
        $("#char-3, #char-4, #char-5").addClass("bloqueado").html('<div id="slot-name" class="slot-muted"><i class="fas fa-ban"></i></br> Personaje bloqueado<span id="cid"></span></span>');;
    }
    if (slots == 2) {
        $("#char-4, #char-5").addClass("bloqueado").html('<div id="slot-name" class="slot-muted"><i class="fas fa-ban"></i></br> Personaje bloqueado<span id="cid"></span></span>');;
    }
    if (slots == 3) {
        $("#char-5").addClass("bloqueado").html('<div id="slot-name" class="slot-muted"><i class="fas fa-ban"></i></br> Personaje bloqueado<span id="cid"></span></span>');;
    }

}


function desbloquearSlot() {
    //OPERACIÓN DE COMPROBACIÓN Y RESTA DE COINS
    $.post('https://qb-multicharacter/unlockSlot', JSON.stringify({}), function(data) {
        if (data[0]) {
            let info = $("#char-1").data('cData');
            info.money.coins = data[1]
            $('#char-1').data('cData', info)
            slots++;
            setupCharInfo('empty');
            $("#play-text").html('<i class="fas fa-check"></i> Registrar');
            $("#play").css({ "display": "block" });
            $("#desbloquear").css("display", "none");
            bloquearSlots();
        } else {
            $("#desbloquear").html('<p>¡No tienes suficientes coins!</p>')
            return false;
        }
    })
}



function cargarHomeScreen() {
    $(".home-screen").fadeIn(500, function() {
        cargarSlideshow();
        setTimeout(function() {
            $(".btn-home").css("animation-delay", "0s");
        }, 1200);



        $.post('https://qb-multicharacter/recieveEvents', JSON.stringify({}), function(data) {
            console.log(data);
            // data.forEach(function(events, i) {
            //     // $("#zona-eventos").append(`
            //     // <h5> ${events.title} </h5>
            //     // <p> ${events.description} </p>
            //     // `);
            //     $(".eventos").append(`
            //     <div class="evento">
            //         <h5>${events.title}</h5>
            //         <p>${events.description}</p>
            //     </div>
            // `);


            // })
            if (data.length > 0) {
                $(".eventos").html('');
                $(data).each(function(e) {
                    $(".eventos").append(`
                         <div class="evento">
                             <h5>${this.title}</h5>
                             <p>${this.description}</p>
                         </div>
                    `);
                });
            } else {
                $(".eventos").html('');

                $(".eventos").append(`
                <p class="sin-eventos">No hay eventos disponibles.</p>
                `);
            }

        });


        $("#btn-personajes").off("click").on("click", function() {
            clearInterval(intervalSlider);
            click.play();
            $(this).removeClass("scale-in").addClass("scale-out");
            setTimeout(function() {
                $(".main-screen").fadeOut(300, function() {
                    $("#back-home-pj").off("click").on("click", function() {
                        intervalSlider = setInterval(moverSlider, 10000);
                        click.play();
                        $(".pantalla-seleccion").addClass("scale-out").fadeOut(300, function() {
                            $(this).removeClass("scale-out");
                            $(".main-screen").fadeIn(300);

                        });
                    });

                    $("#btn-personajes").css("animation-delay", "0.1s").removeClass("scale-out").addClass("scale-in");
                    //$(".bienvenida").fadeIn(300);
                    $(".characters-list, .shake2").fadeIn(300);
                    // qbMultiCharacters.fadeInDown('.character-info', '15%', 400);
                    // qbMultiCharacters.fadeInDown('.characters-list', '20%', 400);
                    transition.play();
                    particlesJS.load('particles-js2', 'particles.json');
                    $("#fondo-pj").hide();

                    $(".pantalla-seleccion").fadeIn(300);

                    bloquearSlots();
                });
            }, 300);
        });

        $("#btn-eventos").off("click").on("click", function() {
            click.play();
            swipe.play();
            if ($(this).hasClass("seleccionado") == false) {
                $(".btn-home.seleccionado").removeClass("seleccionado");
                $(this).addClass("seleccionado");
                $(".col-sm-7.scale-in-fast").addClass("scale-out-fast").fadeOut(150, function() {
                    $(this).removeClass("scale-out-fast").removeClass("scale-in-fast");
                    $("#zona-servidores").removeClass("scale-out-fast");

                    //$("#zona-eventos").html('');

                    $("#zona-eventos").addClass("scale-in-fast").fadeIn(150);



                });
            } else {
                $(this).removeClass("seleccionado");


                $("#zona-eventos").addClass("scale-out-fast").fadeOut(200, function() {
                    $(this).removeClass("scale-out-fast").removeClass("scale-in-fast");
                    $("#zona-servidores").addClass("scale-in-fast").fadeIn(150);
                });



            }
        });

        $("#btn-normativa").off("click").on("click", function() {
            click.play();
            swipe.play();
            if ($(this).hasClass("seleccionado") == false) {
                $(".btn-home.seleccionado").removeClass("seleccionado");
                $(this).addClass("seleccionado");
                $(".col-sm-7.scale-in-fast").addClass("scale-out-fast").fadeOut(150, function() {
                    $(this).removeClass("scale-out-fast").removeClass("scale-in-fast");
                    $("#zona-normativa").addClass("scale-in-fast").fadeIn(150);
                });
                $(".btn-normativa").off("click").on("click", function() {
                    click.play();
                    swipe.play();
                    $("#" + $(this).attr("normativa")).fadeIn(300);
                    $(".zona-info").css("opacity", "24%");
                });
                $(".normativa").off("click").on("click", function() {
                    $(this).fadeOut(300);
                    $(".zona-info").css("opacity", "100%");

                });
            } else {
                $(this).removeClass("seleccionado");
                $(".btn-normativa, .normativa").off("click");
                $("#zona-normativa").addClass("scale-out-fast").fadeOut(200, function() {
                    $(this).removeClass("scale-out-fast").removeClass("scale-in-fast");
                    $("#zona-servidores").addClass("scale-in-fast").fadeIn(150);
                });
            }
        });

        $("#btn-opciones").off("click").on("click", function() {
            click.play();
            swipe.play();
            if ($(this).hasClass("seleccionado") == false) {
                $(".btn-home.seleccionado").removeClass("seleccionado");
                $(this).addClass("seleccionado");
                $(".col-sm-7.scale-in-fast").addClass("scale-out-fast").fadeOut(150, function() {
                    $(this).removeClass("scale-out-fast").removeClass("scale-in-fast");
                    $("#zona-servidores").removeClass("scale-out-fast");
                    $("#zona-opciones").addClass("scale-in-fast").fadeIn(150);
                });
            } else {
                $(this).removeClass("seleccionado");

                $("#zona-opciones").addClass("scale-out-fast").fadeOut(200, function() {
                    $(this).removeClass("scale-out-fast").removeClass("scale-in-fast");
                    $("#zona-servidores").addClass("scale-in-fast").fadeIn(150);
                });
            }
        });

        $("#btn-staff").off("click").on("click", function() {
            click.play();
            swipe.play();
            if ($(this).hasClass("seleccionado") == false) {
                $(".btn-home.seleccionado").removeClass("seleccionado");
                $(this).addClass("seleccionado");
                $(".col-sm-7.scale-in-fast").addClass("scale-out-fast").fadeOut(150, function() {
                    $(this).removeClass("scale-out-fast").removeClass("scale-in-fast");
                    $("#zona-servidores").removeClass("scale-out-fast");
                    $("#zona-staff").addClass("scale-in-fast").fadeIn(150);
                });
            } else {
                $(this).removeClass("seleccionado");

                $("#zona-staff").addClass("scale-out-fast").fadeOut(200, function() {
                    $(this).removeClass("scale-out-fast").removeClass("scale-in-fast");
                    $("#zona-servidores").addClass("scale-in-fast").fadeIn(150);
                });
            }
        });



        setTimeout(function() {
            $(".btn-home").mouseenter(function() {
                $(".zona-descripcion").removeClass("central").removeClass("abajo");
                if ($(this).attr("id") == "btn-eventos" || $(this).attr("id") == "btn-normativa") {
                    $(".zona-descripcion").addClass("central");
                } else if ($(this).attr("id") == "btn-opciones" || $(this).attr("id") == "btn-staff") {
                    $(".zona-descripcion").addClass("abajo");
                }

                if ($(this).attr("id") == "btn-personajes") {
                    $(".zona-texto-descripcion").text("Accede a la Selección de Personajes donde podrás comenzar a jugar, crear tu personaje o gestionar tus slots disponibles.");
                }

                if ($(this).attr("id") == "btn-eventos") {
                    $(".zona-texto-descripcion").text("Echa un vistazo a la lista de los eventos más recientes que vamos a celebrar.");
                }

                if ($(this).attr("id") == "btn-normativa") {
                    $(".zona-texto-descripcion").text("En esta sección podrás encontrar y revisar la Normativa General, la Normativa de Actos Delictivos y la Normativa de Organizaciones.");
                }

                if ($(this).attr("id") == "btn-staff") {
                    $(".zona-texto-descripcion").text("Comprueba de un vistazo rápido que miembros de la administración se encuentran activos en este momento.");
                }

                if ($(this).attr("id") == "btn-opciones") {
                    $(".zona-texto-descripcion").text("Consulta la lista de comandos que puedes utilizar con el reconocimiento de voz");
                }

                $(".zona-descripcion").css("display", "block");
            });
            $(".btn-home").mouseleave(function() {
                $(".zona-descripcion").css("display", "none");

            });
        }, 300)

    });
    $(".consejo").html(consejos[numeroAleatorio(0, consejos.length)]);
    $(".zona-info").fadeIn(300);
}


function cargarSlideshow() {
    intervalSlider = setInterval(moverSlider, 10000);
    $("#prev").off("click").on("click", function() {
        clearInterval(intervalSlider);
        click.play();
        $("#prev img").addClass("scale-out-fast").fadeOut(150, function() {
            $("#actual img, .info-server").addClass("scale-out-fast").fadeOut(150, function() {
                $("#next img").addClass("scale-out-fast").fadeOut(150, function() {

                    $("#prev img, #actual img, #next img, .info-server").removeClass("scale-out-fast");
                    var anterior = $("#prev").html();
                    var actual = $("#actual").html();
                    var siguiente = $("#next").html();
                    $("#prev").html(siguiente);
                    $("#actual").html(anterior);
                    $("#next").html(actual);
                    $("#prev img").addClass("scale-in-fast").fadeIn(150, function() {
                        $("#actual img, .info-server").addClass("scale-in-fast").fadeIn(150, function() {
                            $("#next img").addClass("scale-in-fast").fadeIn(150, function() {

                            });
                        });
                    });
                });
            });
        });
        intervalSlider = setInterval(moverSlider, 10000);
    });
    $("#next").off("click").on("click", function() {
        click.play();
        clearInterval(intervalSlider)
        $("#prev img").addClass("scale-out-fast").fadeOut(150, function() {
            $("#actual img, .info-server").addClass("scale-out-fast").fadeOut(150, function() {
                $("#next img").addClass("scale-out-fast").fadeOut(150, function() {

                    $("#prev img, #actual img, #next img, .info-server").removeClass("scale-out-fast");
                    var anterior = $("#prev").html();
                    var actual = $("#actual").html();
                    var siguiente = $("#next").html();
                    $("#prev").html(actual);
                    $("#actual").html(siguiente);
                    $("#next").html(anterior);
                    $("#prev img").addClass("scale-in-fast").fadeIn(150, function() {
                        $("#actual img, .info-server").addClass("scale-in-fast").fadeIn(150, function() {
                            $("#next img").addClass("scale-in-fast").fadeIn(150, function() {

                            });
                        });
                    });
                });
            });
        });
        intervalSlider = setInterval(moverSlider, 10000);
    });

}


function moverSlider() {
    $("#prev img").addClass("scale-out-fast").fadeOut(150, function() {
        $("#actual img, .info-server").addClass("scale-out-fast").fadeOut(150, function() {
            $("#next img").addClass("scale-out-fast").fadeOut(150, function() {

                $("#prev img, #actual img, #next img, .info-server").removeClass("scale-out-fast");
                var anterior = $("#prev").html();
                var actual = $("#actual").html();
                var siguiente = $("#next").html();
                $("#prev").html(siguiente);
                $("#actual").html(anterior);
                $("#next").html(actual);
                $("#prev img").addClass("scale-in-fast").fadeIn(150, function() {
                    $("#actual img, .info-server").addClass("scale-in-fast").fadeIn(150, function() {
                        $("#next img").addClass("scale-in-fast").fadeIn(150, function() {

                        });
                    });
                });
            });
        });
    });
}
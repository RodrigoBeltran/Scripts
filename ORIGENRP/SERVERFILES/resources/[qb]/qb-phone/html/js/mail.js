var OpenedMail = null;
let urlAdv = null;

$(document).on('click', '.mail', function(e) {
    e.preventDefault();

    $(".mail-home").animate({
        left: 30 + "vh"
    }, 300);
    $(".opened-mail").animate({
        left: 0 + "vh"
    }, 300);

    var MailData = $("#" + $(this).attr('id')).data('MailData');
    QB.Phone.Functions.SetupMail(MailData);

    OpenedMail = $(this).attr('id');
});

$(document).on('click', '.mail-back', function(e) {
    e.preventDefault();

    $(".mail-home").animate({
        left: 0 + "vh"
    }, 300);
    $(".opened-mail").animate({
        left: -30 + "vh"
    }, 300);
    OpenedMail = null;
});

$(document).on('click', '#accept-mail', function(e) {

    e.preventDefault();
    var MailData = $("#" + OpenedMail).data('MailData');
    $.post('https://qb-phone/AcceptMailButton', JSON.stringify({
        buttonEvent: MailData.button.buttonEvent,
        buttonData: MailData.button.buttonData,
        mailId: MailData.mailid,
    }));
    $(".mail-home").animate({
        left: 0 + "vh"
    }, 300);
    $(".opened-mail").animate({
        left: -30 + "vh"
    }, 300);
});


$(document).on('click', '.advimage', function() {
    let source = $(this).attr('src')
    QB.Screen.popUp(source);
});

$('#close').on('click', function() {
    let source = $('.advimage').attr('src')
    QB.Screen.popDown(source);
});

$(document).on('click', '#remove-mail', function(e) {
    e.preventDefault();
    var MailData = $("#" + OpenedMail).data('MailData');
    $.post('https://qb-phone/RemoveMail', JSON.stringify({
        mailId: MailData.mailid
    }));
    $(".mail-home").animate({
        left: 0 + "vh"
    }, 300);
    $(".opened-mail").animate({
        left: -30 + "vh"
    }, 300);
});

QB.Phone.Functions.SetupMails = function(Mails) {
    var NewDate = new Date();
    var NewHour = NewDate.getHours();
    var NewMinute = NewDate.getMinutes();
    var Minutessss = NewMinute;
    var Hourssssss = NewHour;
    if (NewHour < 10) {
        Hourssssss = "0" + Hourssssss;
    }
    if (NewMinute < 10) {
        Minutessss = "0" + NewMinute;
    }
    var MessageTime = Hourssssss + ":" + Minutessss;

    $("#mail-header-mail").html(QB.Phone.Data.PlayerData.charinfo.firstname + "." + QB.Phone.Data.PlayerData.charinfo.lastname + "@origencompany.com");
    $("#mail-header-lastsync").html("Sincronizado a las " + MessageTime);
    if (Mails !== null && Mails !== undefined) {
        if (Mails.length > 0) {
            $(".mail-list").html("");
            $.each(Mails, function(i, mail) {
                var date = new Date(mail.date);
                var DateString = date.getDay() + " " + MonthFormatting[date.getMonth()] + " " + date.getFullYear() + " " + date.getHours() + ":" + date.getMinutes();
                var element = '<div class="mail" id="mail-' + mail.mailid + '"><span class="mail-sender" style="font-weight: bold;">' + mail.sender + '</span> <div class="mail-text"><p>' + mail.message + '</p></div> <div class="mail-time">' + DateString + '</div></div>';

                $(".mail-list").append(element);
                $("#mail-" + mail.mailid).data('MailData', mail);
            });
        } else {
            $(".mail-list").html('<p class="nomails">No tienes emails.</p>');
        }

    }
}

var MonthFormatting = ["Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre"];

QB.Phone.Functions.SetupMail = function(MailData) {
    var date = new Date(MailData.date);
    var DateString = date.getDay() + " " + MonthFormatting[date.getMonth()] + " " + date.getFullYear() + " " + date.getHours() + ":" + date.getMinutes();
    $(".mail-subject").html("<p><span style='font-weight: bold;'>" + MailData.sender + "</span><br>" + MailData.subject + "</p>");
    $(".mail-date").html("<p>" + DateString + "</p>");
    $(".mail-content").html("<p>" + MailData.message + "</p>");

    var AcceptElem = '<div class="opened-mail-footer-item" id="accept-mail"><i class="fas fa-check-circle mail-icon"></i></div>';
    var RemoveElem = '<div class="opened-mail-footer-item" id="remove-mail"><i class="fas fa-trash-alt mail-icon"></i></div>';

    $(".opened-mail-footer").html("");

    if (MailData.button !== undefined && MailData.button !== null) {
        $(".opened-mail-footer").append(AcceptElem);
        $(".opened-mail-footer").append(RemoveElem);
        $(".opened-mail-footer-item").css({ "width": "50%" });
    } else {
        $(".opened-mail-footer").append(RemoveElem);
        $(".opened-mail-footer-item").css({ "width": "100%" });
    }
}

// Advert JS

$(document).on('click', '.test-slet', function(e) {
    e.preventDefault();

    $(".advert-home").animate({
        left: 30 + "vh"
    });
    $(".new-advert").animate({
        left: 0 + "vh"
    });
});

$(document).on('click', '#new-advert-back', function(e) {
    e.preventDefault();

    $(".advert-home").animate({
        left: 0 + "vh"
    });
    $(".new-advert").animate({
        left: -30 + "vh"
    });
});

$(document).on('click', '#new-advert-submit', function(e) {
    e.preventDefault();
    let picture = $('#advert-new-url').val()
    var Advert = $(".new-advert-textarea").val();

    if (Advert !== "") {
        $(".advert-home").animate({
            left: 0 + "vh"
        });
        $(".new-advert").animate({
            left: -30 + "vh"
        });
        if (!picture) {
            $.post('https://qb-phone/PostAdvert', JSON.stringify({
                message: Advert,
                url: null
            }));
        } else {
            $.post('https://qb-phone/PostAdvert', JSON.stringify({
                message: Advert,
                url: picture
            }));
        }


        $('#advert-new-url').val("")
        $(".new-advert-textarea").val("");
    } else {
        QB.Phone.Notifications.Add("fas fa-ad", "Advertisement", "You can\'t post an empty ad!", "#ff8f1a", 2000);
    }
});

$(document).on('click', '#new-advert-photo', function(e) {
    e.preventDefault();

    $.post('https://qb-phone/GetImage', function(url) {
        if (url) {
            $('#advert-new-url').val(url)
        }
    })
    QB.Phone.Functions.Close();
})
$(document).on('click', '.advert-number', function(e) {
    e.preventDefault();
    let source = $(this).attr("data-number")
    if (source !== QB.Phone.Data.PlayerData.charinfo.phone) {
        $.post('https://qb-phone/GetInformation', JSON.stringify({ phone: source }), function(data) {
            $.post('https://qb-phone/GetWhatsappChat', JSON.stringify({ phone: source }), function(chat) {
                QB.Phone.Functions.SetupChatMessages(chat, {
                    name: data.name,
                    number: data.number
                });

            });
            $('.phone-application-container').animate({
                top: -160 + "%"
            });
            QB.Phone.Functions.HeaderTextColor("white", 400);
            setTimeout(function() {
                $('.phone-application-container').animate({
                    top: 0 + "%"
                });

                QB.Phone.Functions.ToggleApp("phone", "none");
                QB.Phone.Functions.ToggleApp("whatsapp", "block");
                QB.Phone.Data.currentApplication = "whatsapp";
                $('.whatsapp-openedchat-messages').animate({ scrollTop: 9999 }, 150);
                $(".whatsapp-openedchat").css({ "display": "block" });
                $(".whatsapp-openedchat").css({ left: 0 + "vh" });
                $(".whatsapp-chats").animate({ left: 30 + "vh" }, 100, function() {
                    $(".whatsapp-chats").css({ "display": "none" });
                });
            }, 400)
            QB.Phone.Functions.ToggleApp(QB.Phone.Data.currentApplication, "none")
        })

    } else {
        QB.Phone.Notifications.Add("fa fa-phone-alt", "Phone", "No puedes escribirte a t?? mismo...", "default", 3500);
    }

})
QB.Phone.Functions.RefreshAdverts = function(Adverts) {
    $("#advert-header-name").html("@" + QB.Phone.Data.PlayerData.charinfo.firstname + "" + QB.Phone.Data.PlayerData.charinfo.lastname + " | " + QB.Phone.Data.PlayerData.charinfo.phone);
    if (Adverts.length > 0 || Adverts.length == undefined) {
        $(".advert-list").html("");

        $.each(Adverts, function(i, advert) {

            if (advert.url) {
                var element = '<div class="advert"><span class="advert-sender">' + advert.name + '</span><span class="advert-number" data-number="' + advert.number + '"> | ' + advert.number + '</span><p>' + advert.message + '</p></br><img class="advimage" src=' + advert.url + ' style=" border-radius:4px; width: 95%; position:relative; z-index: 1; right:1px;height: auto; bottom:1vh;"></br><span><div class="adv-icon"></div> </span></div>';
            } else {
                var element = '<div class="advert"><span class="advert-sender">' + advert.name + '</span><span class="advert-number" data-number="' + advert.number + '"> | ' + advert.number + '</span><p>' + advert.message + '</p>';
            }
            $(".advert-list").append(element);
            if (advert.citizenid === QB.Phone.Data.PlayerData.citizenid) {
                $(".advert").append('<span><div class="adv-icon"><div id="adv-whataspp"><i class="fas fa-trash"style="font-size: 2.0rem;" id = "adv-delete"></i> </div></div>')
            }
        });
    } else {
        $(".advert-list").html("");
        var element = '<div class="advert"><span class="advert-sender">??No hay anuncios disponibles!</span></div>';
        $(".advert-number").append(element);
        $(".advert-list").append(element);
    }

}
$(document).on('click', '#adv-delete', function(e) {
    e.preventDefault();
    $.post('https://qb-phone/DeleteAdvert', JSON.stringify({
        citizenid: QB.Phone.Data.PlayerData.citizenid
    }), function() {
        setTimeout(function() {
            QB.Phone.Notifications.Add("fas fa-ad", "Advertisement", "El anuncio ha sido eliminado", "#ff8f1a", 2000);
        }, 400)

    });
})
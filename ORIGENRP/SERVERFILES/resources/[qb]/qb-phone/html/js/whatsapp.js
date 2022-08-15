var WhatsappSearchActive = false;
var OpenedChatPicture = null;
let WhatsappCreateChatActive = false;
let WhatsappSelectedContacts = [];
let WhatsappChanginGroupPicture = false;
let record = document.getElementById("record");
let record2 = document.getElementById("record2");
record.volume = 0.4;
record2.volume = 0.4;


$(document).ready(function() {

    $("#whatsapp-search-input").on("keyup", function() {
        var value = $(this).val().toLowerCase();
        $(".whatsapp-chats .whatsapp-chat").filter(function() {
            $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1);
        });
    });
});

$(document).on('click', '#whatsapp-search-chats', function(e) {
    e.preventDefault();

    if ($("#whatsapp-search-input").css('display') == "none") {
        $("#whatsapp-search-input").fadeIn(150);
        WhatsappSearchActive = true;
    } else {
        $("#whatsapp-search-input").fadeOut(150);
        WhatsappSearchActive = false;
    }
});

$(document).on('click', '#cancel-custom-group-picture', function(e) {
    e.preventDefault();
    $('#select-group-picture').hide();
    WhatsappChanginGroupPicture = false;
})

$(document).on('click', '#accept-custom-group-picture', function(e) {
    e.preventDefault();
    let groupPicture = $("#custom-group-picture-url").val();
    if (groupPicture == '' || groupPicture == undefined) {
        groupPicture = 'default'
    }
    $('#select-group-picture').hide();
    WhatsappChanginGroupPicture = false;

    $.post('https://qb-phone/ChangeGroupPicture', JSON.stringify({ picture: groupPicture, isGroup: OpenedChatData.isGroup, id: OpenedChatData.id }))
})

$(document).on('click', '.whatsapp-group-picture', function(e) {
    e.preventDefault();
    $('#select-group-picture').show();
    WhatsappChanginGroupPicture = true;

});

$(document).on('click', '#whatsapp-group-picture-back', function(e) {
    e.preventDefault();


    $('.whatsapp-openedchat').animate({ scrollTop: 9999 }, 150);
    $(".whatsapp-openedchat").css({ "display": "block" });
    $(".whatsapp-openedchat").css({ left: 0 + "vh" });
    $(".whatsapp-edit-group").animate({ left: 30 + "vh" }, 100, function() {
        $(".whatsapp-edit-group").css({ "display": "none" });
    });
});

$(document).on('click', '.whatsapp-openedchat-name', function(e) {
    e.preventDefault();

    if (OpenedChatData.isGroup == 1 && OpenedChatData.id != -1) {
        var ChatData = $("#whatsapp-chat-" + OpenedChatData.isGroup + "-" + OpenedChatData.id).data('chatdata');
        if (ChatData) {
            $('.whatsapp-group-name p').text(ChatData.name)

            let picture = './img/default.png'
            if (ChatData.picture !== "default") {
                picture = ChatData.picture
            }
            $('.whatsapp-group-picture').css({ "background-image": "url(" + picture + ")" });

            $('.whatsapp-edit-group').animate({ scrollTop: 9999 }, 150);
            $(".whatsapp-edit-group").css({ "display": "block" });
            $(".whatsapp-edit-group").css({ left: 0 + "vh" });
            $(".whatsapp-openedchat").animate({ left: 30 + "vh" }, 100, function() {
                $(".whatsapp-openedchat").css({ "display": "none" });
            });
        }
    }
})

$(document).on('click', '#whatsapp-new-chat', function(e) {
    e.preventDefault();

    if (!WhatsappCreateChatActive) {

        WhatsappSelectedContacts = [];
        $(".whatsapp-contact-list").css({ "display": "block" });
        $(".whatsapp-contact-list").animate({
            left: 0 + "vh"
        }, 200);

        $(".whatsapp-chats").animate({
            left: 30 + "vh"
        }, 200, function() {
            $(".whatsapp-chats").css({ "display": "none" });
        });

        $('.whatsapp-contact-list').animate({ scrollTop: 9999 }, 150);
        $('.whatsapp-contact-drop').html('');

        if (QB.Phone.Data.Contacts !== null) {
            $.each(QB.Phone.Data.Contacts, function(i, contact) {
                contact.name = DOMPurify.sanitize(contact.name, {
                    ALLOWED_TAGS: [],
                    ALLOWED_ATTR: []
                });
                if (contact.name == '') contact.name = 'Hmm, I shouldn\'t be able to do this...'
                let ChatElement = '<div class="whatsapp-contacts" data-whatsapp-contactid="' + i + '"><div class="whatsapp-chat-picture" style="background-image: url(' + "./img/default.png" + ');"></div><div class="whatsapp-chat-name"><p>' + contact.name + '</p></div>';

                $(".whatsapp-contact-drop").append(ChatElement);
                $("[data-whatsapp-contactid='" + i + "']").data('contactData', contact);
            });
            $(".whatsapp-contact-drop").append(`
                <div class="text-group">Puedes seleccionar varios contactos para crear un nuevo grupo</div>
            `);
        }
        WhatsappCreateChatActive = true;
    }
});

$(document).on('click', '.whatsapp-contacts', function(e) {
    e.preventDefault();
    if (WhatsappCreateChatActive) {
        const id = $(this).data('whatsapp-contactid') + 1
        const index = WhatsappSelectedContacts.indexOf(id);
        if (index > -1) {
            $(this).removeClass('whatsapp-contact-selected')
            WhatsappSelectedContacts.splice(index, id);
        } else {
            $(this).addClass('whatsapp-contact-selected')
            WhatsappSelectedContacts.push(id);
        }
    }

});

$(document).on('click', '#whatsapp-contact-list-back', function(e) {
    e.preventDefault();

    if (WhatsappCreateChatActive) {
        $.post('https://qb-phone/GetWhatsappChats', JSON.stringify({}), function(chats) {
            QB.Phone.Functions.LoadWhatsappChats(JSON.parse(chats));
        });
        $(".whatsapp-chats").css({ "display": "block" });
        $(".whatsapp-chats").animate({
            left: 0 + "vh"
        }, 200);
        $(".whatsapp-contact-list").animate({
            left: -30 + "vh"
        }, 200, function() {
            $(".whatsapp-contact-list").css({ "display": "none" });
        });
        WhatsappSelectedContacts = [];
        WhatsappCreateChatActive = false;
    }
});

$(document).on('click', '#whatsapp-contact-list-accept', function(e) {
    e.preventDefault();

    if (WhatsappCreateChatActive) {
        $.post('https://qb-phone/GetWhatsappChats', JSON.stringify({}), function(chats) {
            QB.Phone.Functions.LoadWhatsappChats(JSON.parse(chats));
        });

        $(".whatsapp-chats").css({ "display": "block" });
        $(".whatsapp-chats").animate({
            left: 0 + "vh"
        }, 200);
        $(".whatsapp-contact-list").animate({
            left: -30 + "vh"
        }, 200, function() {
            $(".whatsapp-contact-list").css({ "display": "none" });
        });

        if (WhatsappSelectedContacts.length == 1) {
            const id = WhatsappSelectedContacts[0] - 1
            let ContactData = $("[data-contactid='" + id + "']").data('contactData');

            if (ContactData.number !== QB.Phone.Data.PlayerData.charinfo.phone) {
                $.post('https://qb-phone/GetWhatsappChat', JSON.stringify({ phone: ContactData.number }), function(chat) {
                    QB.Phone.Functions.SetupChatMessages(chat, {
                        name: ContactData.name,
                        isGroup: 0,
                        number: ContactData.number
                    });
                });

                $('.whatsapp-openedchat-messages').animate({ scrollTop: 9999 }, 150);
                $(".whatsapp-openedchat").css({ "display": "block" });
                $(".whatsapp-openedchat").css({ left: 0 + "vh" });
                $(".whatsapp-chats").animate({ left: 30 + "vh" }, 100, function() {
                    $(".whatsapp-chats").css({ "display": "none" });
                });
            }
        } else if (WhatsappSelectedContacts.length > 1) {
            let ParsedGroupParticipants = []
            ParsedGroupParticipants.push(QB.Phone.Data.PlayerData.charinfo.phone)
            $.each(WhatsappSelectedContacts, function(i, val) {
                const id = val - 1;
                let ContactData = $("[data-contactid='" + id + "']").data('contactData');
                if (ContactData.number !== QB.Phone.Data.PlayerData.charinfo.phone) {
                    ParsedGroupParticipants.push(ContactData.number)
                }
            });

            QB.Phone.Functions.SetupChatMessages(undefined, {
                name: "Nuevo Grupo",
                isGroup: 1,
                number: -1,
                parsedGroupParticipants: ParsedGroupParticipants
            });


            $('.whatsapp-openedchat-messages').animate({ scrollTop: 9999 }, 150);
            $(".whatsapp-openedchat").css({ "display": "block" });
            $(".whatsapp-openedchat").css({ left: 0 + "vh" });
            $(".whatsapp-chats").animate({ left: 30 + "vh" }, 100, function() {
                $(".whatsapp-chats").css({ "display": "none" });
            });
        }


        WhatsappCreateChatActive = false;
    }
});

$(document).on('click', '.whatsapp-chat', function(e) {
    e.preventDefault();

    var ChatId = $(this).attr('id');
    var ChatData = $("#" + ChatId).data('chatdata');
    QB.Phone.Functions.SetupChatMessages(ChatData);

    $.post('https://qb-phone/ClearAlerts', JSON.stringify({
        isGroup: ChatData.isGroup,
        id: ChatData.id
    }));

    if (WhatsappSearchActive) {
        $("#whatsapp-search-input").fadeOut(150);
    }

    $(".whatsapp-openedchat").css({ "display": "block" });
    $(".whatsapp-openedchat").animate({
        left: 0 + "vh"
    }, 200);

    $(".whatsapp-chats").animate({
        left: 30 + "vh"
    }, 200, function() {
        $(".whatsapp-chats").css({ "display": "none" });
    });

    $('.whatsapp-openedchat-messages').animate({ scrollTop: 9999 }, 150);

    if (OpenedChatPicture == null) {
        OpenedChatPicture = "./img/default.png";
        if (ChatData.picture != null || ChatData.picture != undefined || ChatData.picture != "default") {
            OpenedChatPicture = ChatData.picture
        }
        $(".whatsapp-openedchat-picture").css({ "background-image": "url(" + OpenedChatPicture + ")" });
    }
});

$(document).on('click', '#whatsapp-openedchat-back', function(e) {
    e.preventDefault();
    $.post('https://qb-phone/GetWhatsappChats', JSON.stringify({}), function(chats) {
        QB.Phone.Functions.LoadWhatsappChats(JSON.parse(chats));
    });
    OpenedChatData.number = null;
    $(".whatsapp-chats").css({ "display": "block" });
    $(".whatsapp-chats").animate({
        left: 0 + "vh"
    }, 200);
    $(".whatsapp-openedchat").animate({
        left: -30 + "vh"
    }, 200, function() {
        $(".whatsapp-openedchat").css({ "display": "none" });
    });
    OpenedChatPicture = null;
});

QB.Phone.Functions.GetLastMessage = function(messages) {
    let LastMessageData = {
        time: "00:00",
        message: "nothing"
    }
    let msgData = messages[messages.length - 1];
    LastMessageData.time = msgData.time
    LastMessageData.message = DOMPurify.sanitize(msgData.message, {
        ALLOWED_TAGS: [],
        ALLOWED_ATTR: []
    });
    if (LastMessageData.message == '') 'Hmm, I shouldn\'t be able to do this...'
    return LastMessageData
}

GetCurrentDateKey = function() {
    let date = new Date();
    let utcDate = new Date(
        date.getUTCFullYear(),
        date.getUTCMonth(),
        date.getUTCDate(),
        date.getUTCHours(),
        date.getUTCMinutes(),
        date.getUTCSeconds()
    ).getTime();
    let CurrentDate = new Date(utcDate + (3600 * 2));
    let CurrentMonth = CurrentDate.getMonth();
    let CurrentDOM = CurrentDate.getDate();
    let CurrentYear = CurrentDate.getFullYear();
    let CurDate = "" + CurrentDOM + "-" + CurrentMonth + "-" + CurrentYear + "";

    return CurDate;
}

QB.Phone.Functions.LoadWhatsappChats = function(chats) {
    $(".whatsapp-chats").html("");
    $("#whatsapp-contact-list").css('display', 'none');
    $.each(chats, function(i, chat) {
        var profilepicture = "./img/default.png";
        if (chat.picture !== "default") {
            profilepicture = chat.picture
        }
        var LastMessage = QB.Phone.Functions.GetLastMessage(chat.messages);
        var ChatElement = '<div class="whatsapp-chat" id="whatsapp-chat-' + chat.isGroup + "-" + chat.id + '"><div class="whatsapp-chat-picture" style="background-image: url(' + profilepicture + ');"></div><div class="whatsapp-chat-name"><p>' + QB.Phone.Functions.IsNumberInContacts(chat.name) + '</p></div><div class="whatsapp-chat-lastmessage"><p>' + LastMessage.message + '</p></div> <div class="whatsapp-chat-lastmessagetime"><p>' + LastMessage.time + '</p></div><div class="whatsapp-chat-unreadmessages unread-chat-id-' + chat.isGroup + "-" + chat.id + '">1</div><div class="delete-chat"><i class="fas fa-trash"></i></div></div>';

        $(".whatsapp-chats").append(ChatElement);
        $("#whatsapp-chat-" + chat.isGroup + "-" + chat.id).data('chatdata', chat);

        if (chat.Unread > 0 && chat.Unread !== undefined && chat.Unread !== null) {
            $(".unread-chat-id-" + chat.isGroup + "-" + chat.id).html(chat.Unread);
            $(".unread-chat-id-" + chat.isGroup + "-" + chat.id).css({ "display": "block" });
        } else {
            $(".unread-chat-id-" + chat.isGroup + "-" + chat.id).css({ "display": "none" });
        }
    });
}

QB.Phone.Functions.ReloadWhatsappAlerts = function(chats) {
    $.each(chats, function(i, chat) {
        if (chat.Unread > 0 && chat.Unread !== undefined && chat.Unread !== null) {
            $(".unread-chat-id-" + chat.isGroup + "-" + chat.id).html(chat.Unread);
            $(".unread-chat-id-" + chat.isGroup + "-" + chat.id).css({ "display": "block" });
        } else {
            $(".unread-chat-id-" + chat.isGroup + "-" + chat.id).css({ "display": "none" });
        }
    });
}

const monthNames = ["Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre"];

FormatChatDate = function(date) {
    let TestDate = date.split("-")
    var NewDate = new Date((parseInt(TestDate[1]) + 1) + "-" + TestDate[0] + "-" + TestDate[2]);

    var CurrentMonth = monthNames[NewDate.getMonth()];
    var CurrentDOM = NewDate.getDate();
    var CurrentYear = NewDate.getFullYear();
    var CurDateee = CurrentDOM + "-" + NewDate.getMonth() + "-" + CurrentYear;
    var ChatDate = CurrentDOM + " de " + CurrentMonth + " del " + CurrentYear;
    var CurrentDate = GetCurrentDateKey();

    var ReturnedValue = ChatDate;
    if (CurrentDate == CurDateee) {
        ReturnedValue = "Hoy";
    }

    return ReturnedValue;
}

FormatMessageTime = function() {
    let date = new Date();
    let utcDate = new Date(
        date.getUTCFullYear(),
        date.getUTCMonth(),
        date.getUTCDate(),
        date.getUTCHours(),
        date.getUTCMinutes(),
        date.getUTCSeconds()
    ).getTime();
    let NewDate = new Date(utcDate + (3600 * 2));
    var NewHour = NewDate.getHours();
    var NewMinute = NewDate.getMinutes();
    var Minutessss = NewMinute;
    var Hourssssss = NewHour;
    if (NewMinute < 10) {
        Minutessss = "0" + NewMinute;
    }
    if (NewHour < 10) {
        Hourssssss = "0" + NewHour;
    }
    var MessageTime = Hourssssss + ":" + Minutessss
    return MessageTime;
}

$(document).on('click', '#whatsapp-openedchat-send', function(e) {
    e.preventDefault();

    var Message = $("#whatsapp-openedchat-message").val();
    if (Message !== null && Message !== undefined && Message !== "") {
        $.post('https://qb-phone/SendMessage', JSON.stringify({
            ChatIsGroup: OpenedChatData.isGroup,
            ChatId: OpenedChatData.id,
            ChatNumber: OpenedChatData.number,
            ChatDate: GetCurrentDateKey(),
            ChatMessage: Message,
            ChatTime: FormatMessageTime(),
            ChatType: "message",
            ChatIsNew: OpenedChatData.isNew || false,
            ChatParticipants: OpenedChatData.parsedGroupParticipants || undefined
        }));
        if (OpenedChatData.isNew)
            OpenedChatData.isNew = false
        $("#whatsapp-openedchat-message").val("");
    } else {
        QB.Phone.Notifications.Add("fab fa-whatsapp", "Whatsapp", "No puedes enviar un mensaje vacío!", "#25D366", 1750);
    }
});

$(document).on('keypress', function(e) {
    if (OpenedChatData.number !== null) {
        if (e.which === 13) {
            var Message = $("#whatsapp-openedchat-message").val();
            if (Message !== null && Message !== undefined && Message !== "") {
                var clean = DOMPurify.sanitize(Message, {
                    ALLOWED_TAGS: [],
                    ALLOWED_ATTR: []
                });
                if (clean == '') clean = 'Hmm, I shouldn\'t be able to do this...'
                $.post('https://qb-phone/SendMessage', JSON.stringify({
                    ChatIsGroup: OpenedChatData.isGroup,
                    ChatId: OpenedChatData.id,
                    ChatNumber: OpenedChatData.number,
                    ChatDate: GetCurrentDateKey(),
                    ChatMessage: clean,
                    ChatTime: FormatMessageTime(),
                    ChatType: "message",
                    ChatIsNew: OpenedChatData.isNew || false,
                    ChatParticipants: OpenedChatData.parsedGroupParticipants || undefined
                }));
                if (OpenedChatData.isNew)
                    OpenedChatData.isNew = false
                $("#whatsapp-openedchat-message").val("");
            } else {
                QB.Phone.Notifications.Add("fab fa-whatsapp", "Whatsapp", "No puedes enviar un mensaje vacío!", "#25D366", 1750);
            }
        }
    }
});

$(document).on('click', '#whatsapp-openedchat-record', function(e) {
    e.preventDefault();
    if (usingVoiceDictation) {
        record2.play();
        stopRecording(function(e) {
            url = URL.createObjectURL(e), sendAudio(function(link) {
                if (link) {
                    $.post('https://qb-phone/SendMessage', JSON.stringify({
                        ChatIsGroup: OpenedChatData.isGroup,
                        ChatId: OpenedChatData.id,
                        ChatNumber: OpenedChatData.number,
                        ChatDate: GetCurrentDateKey(),
                        ChatMessage: "Audio",
                        ChatTime: FormatMessageTime(),
                        ChatType: "audio",
                        url: link,
                        ChatIsNew: OpenedChatData.isNew || false,
                        ChatParticipants: OpenedChatData.parsedGroupParticipants || undefined
                    }))

                    if (OpenedChatData.isNew)
                        OpenedChatData.isNew = false
                }
            });
            var o = document.createElement("li"),
                t = document.createElement("audio"),
                a = document.createElement("a");
            t.controls = !0, t.src = url, a.href = url, a.download = (new Date).toISOString() + ".wav", a.innerHTML = a.download, o.appendChild(t), o.appendChild(a)
        }, "audio/wav")
        $(this).removeClass("whatsapp-openedchat-recording");
        usingVoiceDictation = false;
    } else {
        record.play();
        startRecording();
        $(this).addClass("whatsapp-openedchat-recording");
        usingVoiceDictation = true;
    }
});


$(document).on('click', '#send-location', function(e) {
    e.preventDefault();
    $.post('https://qb-phone/SendMessage', JSON.stringify({
        ChatIsGroup: OpenedChatData.isGroup,
        ChatId: OpenedChatData.id,
        ChatNumber: OpenedChatData.number,
        ChatDate: GetCurrentDateKey(),
        ChatMessage: "Localización compartida",
        ChatTime: FormatMessageTime(),
        ChatType: "location",
        ChatIsNew: OpenedChatData.isNew || false,
        ChatParticipants: OpenedChatData.parsedGroupParticipants || undefined
    }));
    if (OpenedChatData.isNew)
        OpenedChatData.isNew = false
});

$(document).on('click', '#send-image', function(e) {
    e.preventDefault();
    $.post('https://qb-phone/GetImage', JSON.stringify({}), function(url) {
        if (url) {
            $.post('https://qb-phone/SendMessage', JSON.stringify({
                ChatIsGroup: OpenedChatData.isGroup,
                ChatId: OpenedChatData.id,
                ChatNumber: OpenedChatData.number,
                ChatDate: GetCurrentDateKey(),
                ChatMessage: "Imagen",
                ChatTime: FormatMessageTime(),
                ChatType: "picture",
                url: url,
                ChatIsNew: OpenedChatData.isNew || false,
                ChatParticipants: OpenedChatData.parsedGroupParticipants || undefined
            }))
        }
    })
    if (OpenedChatData.isNew)
        OpenedChatData.isNew = false
    QB.Phone.Functions.Close();
    $(".whatsapp-extra-buttons").animate({
        left: -14 + "vh"
    }, 250, function() {
        $(".whatsapp-extra-buttons").css({ "display": "block" });
    });

});

$(document).on('click', '#open-emoji', function(e) {
    e.preventDefault();

    $(".whatsapp-extra-buttons").animate({
        left: -14 + "vh"
    }, 250, function() {
        $(".whatsapp-extra-buttons").css({ "display": "block" });
    });

    $(".whatsapp-emojis").animate({ left: 0 + 'vh' }, 250);

    $(".emoji").off("click").on("click", function() {
        let text = $(this).parent().parent().find('#whatsapp-openedchat-message').val();
        $(this).parent().parent().find('#whatsapp-openedchat-message').val(text + $(this).text()).focus();
    });
    $(".close-emojis").off("click").on("click", function() {
        $(".whatsapp-emojis").animate({ left: -27 + 'vh' }, 250);

    });



});

$(document).on('click', '.whatsapp-openedchat-name', function(e) {
    e.preventDefault();
    if ($('.whatsapp-openedchat-name p').text() == OpenedChatData.number) {
        QB.Phone.Functions.CloseApp();
        setTimeout(function() {
            QB.Phone.Functions.OpenApp("phone", $(".phone-app"))
            QB.Phone.Animations.TopSlideDown(".phone-add-contact", 200, 0);
            $(".phone-add-contact-number").val(OpenedChatData.number);
        }, 410)
    }
});

$(document).on('click', '.whatsapp-openedchat-message-sender-name', function(e) {
    e.preventDefault();
    let number = $(this).text();
    if (number == QB.Phone.Functions.IsNumberInContacts(number)) {
        QB.Phone.Functions.CloseApp();
        setTimeout(function() {
            QB.Phone.Functions.OpenApp("phone", $(".phone-app"))
            QB.Phone.Animations.TopSlideDown(".phone-add-contact", 200, 0);
            $(".phone-add-contact-number").val(number);
        }, 410)
    }
});


QB.Phone.Functions.IsNumberInContacts = function(number) {
    let retval = number;
    $.each(QB.Phone.Data.Contacts, function(i, contact) {
        if (number == contact.number) {
            retval = contact.name
            return;
        }
    });
    return retval;
}

QB.Phone.Functions.SetupChatMessages = async function(cData, NewChatData) {
    if (cData) {
        OpenedChatData.number = cData.number;
        OpenedChatData.isGroup = cData.isGroup;
        OpenedChatData.id = cData.id;
        console.log(OpenedChatData.id)
        if (OpenedChatPicture == null) {
            let data = cData.isGroup == 1 ? { isGroup: 1, id: cData.id } : { isGroup: 0, number: cData.number }
            $.post('https://qb-phone/GetProfilePicture', JSON.stringify(data), function(picture) {
                OpenedChatPicture = "./img/default.png";
                if (picture != "default" && picture != null) {
                    OpenedChatPicture = picture
                }
                $(".whatsapp-openedchat-picture").css({ "background-image": "url(" + OpenedChatPicture + ")" });
            });
        } else {
            $(".whatsapp-openedchat-picture").css({ "background-image": "url(" + OpenedChatPicture + ")" });
        }

        $(".whatsapp-openedchat-name").html("<p>" + QB.Phone.Functions.IsNumberInContacts(cData.name) + "</p>");
        $(".whatsapp-openedchat-messages").html("");

        let hashTable = {}
        let currentIndex = -1
        $.each(cData.messages, function(i, message) {
            console.log(message.message)
            let ChatDate = FormatChatDate(message.date);
            if (!hashTable[ChatDate]) {
                currentIndex++;
                hashTable[ChatDate] = currentIndex;
                let ChatDiv = '<div class="whatsapp-openedchat-messages-' + currentIndex + ' unique-chat"><div class="whatsapp-openedchat-date">' + ChatDate + '</div></div>';

                $(".whatsapp-openedchat-messages").append(ChatDiv);
            }

            message.message = DOMPurify.sanitize(message.message, {
                ALLOWED_TAGS: [],
                ALLOWED_ATTR: []
            });
            if (message.message == '') message.message = 'Hmm, I shouldn\'t be able to do this...'
            var Sender = "me";
            if (message.sender !== QB.Phone.Data.PlayerData.citizenid) { Sender = "other"; }
            var MessageElement
            if (Sender == 'me') {
                if (message.type == "message") {
                    MessageElement = '<div class="whatsapp-openedchat-message whatsapp-openedchat-message-' + Sender + '" data-id=' + i + '>' + message.message + '<div class="whatsapp-openedchat-message-time">' + message.time + '</div></div><div class="clearfix"></div>'
                } else if (message.type == "location") {
                    MessageElement = '<div class="whatsapp-openedchat-message whatsapp-openedchat-message-' + Sender + ' whatsapp-shared-location" data-x="' + message.data.x + '" data-y="' + message.data.y + '" data-id=' + i + '><span style="font-size: 1.2vh;"><i class="fas fa-thumbtack" style="font-size: 1vh;"></i> Localización</span><div class="whatsapp-openedchat-message-time">' + message.time + '</div></div><div class="clearfix"></div>'
                } else if (message.type == "picture") {
                    MessageElement = '<div class="whatsapp-openedchat-message whatsapp-openedchat-message-' + Sender + '" data-id=' + i + '><img class="wppimage" src=' + message.data.url + '  style=" border-radius:4px; width: 100%; position:relative; z-index: 1; right:1px;height: auto;"></div><div class="whatsapp-openedchat-message-time">' + message.time + '</div>'
                } else if (message.type == "audio") {
                    MessageElement = '<div class="whatsapp-openedchat-message whatsapp-openedchat-message-' + Sender + '" data-id=' + i + '><audio controls  style="width:20vh;"><source src="' + message.data.url + '" type="audio/wav"></audio><div class="whatsapp-openedchat-message-time">' + message.time + '</div>'
                }
                $(".whatsapp-openedchat-messages-" + hashTable[ChatDate]).append(MessageElement);

             
            } else {
                console.log(Sender)
                let extraData
                if (cData.isGroup == 1) {
                    let name = QB.Phone.Functions.IsNumberInContacts(message.phone);
                    extraData = '<div class="whatsapp-openedchat-message-sender-name">' + name + '</div>' + message.message;
                } else {
                    extraData = message.message;
                }

                if (message.type == "message") {
                    MessageElement = '<div class="whatsapp-openedchat-message whatsapp-openedchat-message-' + Sender + '" data-id=' + i + '>' + extraData + '<div class="whatsapp-openedchat-message-time">' + message.time + '</div></div><div class="clearfix"></div>'
                } else if (message.type == "location") {
                    MessageElement = '<div class="whatsapp-openedchat-message whatsapp-openedchat-message-' + Sender + ' whatsapp-shared-location" data-x="' + message.data.x + '" data-y="' + message.data.y + '" data-id=' + i + '><span style="font-size: 1.2vh;"><i class="fas fa-thumbtack" style="font-size: 1vh;"></i>' + message.number + ":" + 'Localización</span><div class="whatsapp-openedchat-message-time">' + message.time + '</div></div><div class="clearfix"></div>'
                } else if (message.type == "picture") {
                    MessageElement = '<div class="whatsapp-openedchat-message whatsapp-openedchat-message-' + Sender + '" data-id=' + i + '><img class="wppimage" src=' + message.data.url + '  style=" border-radius:4px; width: 100%; position:relative; z-index: 1; right:1px;height: auto;"></div><div class="whatsapp-openedchat-message-time">' + message.time + '</div>'
                } else if (message.type == "audio") {
                    MessageElement = '<div class="whatsapp-openedchat-message whatsapp-openedchat-message-' + Sender + '" data-id=' + i + '><audio controls  style="width:20vh;"><source src="' + message.data.url + '" type="audio/wav"></audio><div class="whatsapp-openedchat-message-time">' + message.time + '</div>'
                }
                $(".whatsapp-openedchat-messages-" + hashTable[ChatDate]).append(MessageElement);
            }
            
            
            lastDate = ChatDate
        });
        $('.whatsapp-openedchat-messages').animate({ scrollTop: 9999 }, 1);
    } else {
        OpenedChatData.number = NewChatData.number;
        OpenedChatData.isGroup = NewChatData.isGroup;
        OpenedChatData.id = -1;
        OpenedChatData.isNew = true;
        OpenedChatData.parsedGroupParticipants = NewChatData.parsedGroupParticipants || undefined;
        if (OpenedChatPicture == null) {
            $.post('https://qb-phone/GetProfilePicture', JSON.stringify({
                number: OpenedChatData.number,
                isGroup: OpenedChatData.isGroup
            }), function(picture) {
                OpenedChatPicture = "./img/default.png";
                if (picture != "default" && picture != null) {
                    OpenedChatPicture = picture
                }
                $(".whatsapp-openedchat-picture").css({ "background-image": "url(" + OpenedChatPicture + ")" });
            });
        }

        $(".whatsapp-openedchat-name").html("<p>" + NewChatData.name + "</p>");
        $(".whatsapp-openedchat-messages").html("");
        var NewDate = new Date();
        var NewDateMonth = NewDate.getMonth();
        var NewDateDOM = NewDate.getDate();
        var NewDateYear = NewDate.getFullYear();
        var DateString = "" + NewDateDOM + "-" + (NewDateMonth + 1) + "-" + NewDateYear;
        var ChatDiv = '<div class="whatsapp-openedchat-messages-' + DateString + ' unique-chat"><div class="whatsapp-openedchat-date">Hoy</div></div>';

        $(".whatsapp-openedchat-messages").append(ChatDiv);
    }

    $('.whatsapp-openedchat-messages').animate({ scrollTop: 9999 }, 1);
}
$(document).on('click', '.wppimage', function(e) {
    e.preventDefault();
    let source = $(this).attr('src')
    QB.Screen.popUp(source)
});

$(document).on('click', '.whatsapp-shared-location', function(e) {
    e.preventDefault();
    var messageCoords = {}
    messageCoords.x = $(this).data('x');
    messageCoords.y = $(this).data('y');

    $.post('https://qb-phone/SharedLocation', JSON.stringify({
        coords: messageCoords,
    }))
});

var ExtraButtonsOpen = false;

$(document).on('click', '#whatsapp-openedchat-message-extras', function(e) {
    e.preventDefault();

    if (!ExtraButtonsOpen) {
        $(".whatsapp-extra-buttons").css({ "display": "block" }).animate({
            left: 0 + "vh"
        }, 250);
        ExtraButtonsOpen = true;
    } else {
        $(".whatsapp-extra-buttons").animate({
            left: -14 + "vh"
        }, 250, function() {
            $(".whatsapp-extra-buttons").css({ "display": "block" });
            ExtraButtonsOpen = false;
        });
    }
});
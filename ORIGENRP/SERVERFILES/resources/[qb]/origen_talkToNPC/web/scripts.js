var options = undefined;
var hasCreatedButtons = false;
var canSelect = true

var over_button = document.getElementById('over_button');
var click = document.getElementById('click');
var abrir = document.getElementById('abrir');

over_button.volume = 0.3;
click.volume = 0.4;


window.addEventListener('message', function(event) {

    item = event.data;
    switch (event.data.action) {
        case 'openDialog':
            options = item.options;
            $('#npc-header').html(item.header);
            $('#npc-name').html(item.name);
            $('#dialog').html(item.dialog);
            for (let i = 0; i < item.options.length; i++) {
                if (i <= 6) {
                    $("#option" + i).show();
                    $("#option" + i).html(item.options[i][0]);
                    if (!hasCreatedButtons) {
                        $(document).on('click', "#option" + i, function() {
                            click.play();
                            if (canSelect) {
                                canSelect = false
                                $.post('https://origen_talkToNPC/action', JSON.stringify({
                                    action: "option",
                                    options: options[i],
                                }));
                                $('body').fadeOut();
                                setTimeout(function() {
                                    canSelect = true
                                }, 1000);
                            }
                        });
                    }
                }
                if (i < 6) {
                    for (let i = item.options.length; i < 6; i++) {
                        $("#option" + i).hide();
                    }
                }
            }
            hasCreatedButtons = true
            $(".btn").mouseenter(function() {
                over_button.play();
            });
            abrir.play();
            $('body').fadeIn();
            break
    }
});

$(document).on('click', ".btn-closeinterface", function() {
    $('body').fadeOut();
    $.post('https://origen_talkToNPC/action', JSON.stringify({
        action: "close",
    }));
});

$(document).ready(function() {
    document.onkeyup = function(data) {
        if (data.which == 27) {
            $('body').fadeOut();
            $.post('https://origen_talkToNPC/action', JSON.stringify({
                action: "close",
            }));
        }
    };
});
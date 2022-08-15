var sound = document.getElementById("sound");
var sound2 = document.getElementById("sound2");
sound2.volume = 0.7;

sound.volume = 0.3;
$("document").ready(function() {
    OrigenNotify = {};

    let lastTime;
    let lastText;

    OrigenNotify.HelpNotification = function(data) {
        if (lastTime == null) {
            lastTime = new Date().getTime();
            $("#helpBar").css({ display: "block" });
            sound.play();
            $("#helpBar").removeClass('help-out').addClass('help-in');
            $("#helpText").html(data.text);

        } else {
            lastTime = new Date().getTime();
            if (data.text != lastText) {
                $("#helpText").html(data.text);
                lastText = data.text;
            }
        }

        setTimeout(function() {
            if (new Date().getTime() - lastTime >= 800) {
                $("#helpBar").removeClass("help-in").addClass('help-out');
                setTimeout(function() {
                    $("#helpBar").css({ display: "none" });
                }, 300);

                lastTime = null;
            }
        }, 1500);
    };

    window.addEventListener("message", function(event) {

        switch (event.data.action) {
            case "SetQueueMax":
                Noty.setMaxVisible(event.data.value, event.data.queue);
                break;
            case "SendNotification":
                if (event.data.text) {
                    event.data.text = event.data.text.replace(/~w~/g, "");
                    event.data.text = event.data.text.replace(/~b~/g, "");
                    event.data.text = event.data.text.replace(/~g~/g, "");
                    event.data.text = event.data.text.replace(/~y~/g, "");
                    event.data.text = event.data.text.replace(/~o~/g, "");
                    event.data.text = event.data.text.replace(/~r~/g, "");
                    event.data.text = event.data.text.replace(/~s~/g, "");
                    event.data.text = event.data.text.replace(
                        /~INPUT_WEAPON_SPECIAL_TWO~/g,
                        ""
                    );
                    event.data.text = event.data.text.replace(/~INPUT_PICKUP~/g, "");
                    event.data.text = event.data.text.replace(/~INPUT_CONTEXT~/g, "");
                    event.data.text = event.data.text.replace(/~INPUT_DETONATE~/g, "");
                }

                let text = event.data.text || "n/a";

                Noty.setMaxVisible(4, "general");
                let type = 'alert';
                let layout = 'bottomRight';
                let glitch = 'glitch';

                let style = 'padding:10px;';
                let title = event.data.title;
                sound2.play();
                if (event.data.type) {
                    type = event.data.type;
                }
                if (event.data.layout) {
                    layout = event.data.layout;
                }
                let logo = '<div class="titulo">' + title + '</div>';

                if (layout != 'bottomRight') {
                    glitch = '';
                    logo = '';
                    style = 'border:none !important;';
                }

                if (type == "disparos") {
                    logo = '<img width="75" style="padding-right: 7px; opacity: 68%;" src="https://i.imgur.com/GLTsSyA.png">';
                }



                const n = new Noty({
                    theme: "origen",
                    layout: layout,
                    text: logo + '<div class="mensaje"><div class="' + glitch + '">' +
                        text + "</div></div>",
                    queue: event.data.queue || "general",
                    timeout: event.data.timeout || 5000,
                    type: type

                });


                n.show();
                break;
            case "SendHelpNotification":
                if (event.data.text) {
                    event.data.text = event.data.text.replace(
                        /~w~/g,
                        "<span style='color: #ffffffcc'>"
                    );
                    event.data.text = event.data.text.replace(
                        /~b~/g,
                        "<span style='color: #879ef690'>"
                    );
                    event.data.text = event.data.text.replace(
                        /~g~/g,
                        "<span style='color: #79ff7990'>"
                    );
                    event.data.text = event.data.text.replace(
                        /~y~/g,
                        "<span style='color: #e0ee1f90'>"
                    );
                    event.data.text = event.data.text.replace(
                        /~o~/g,
                        "<span style='color: #ee7c1f90'>"
                    );
                    event.data.text = event.data.text.replace(
                        /~r~/g,
                        "<span style='color: #ff797990'>"
                    );
                    event.data.text = event.data.text.replace(
                        /~s~/g,
                        "<span style='color: #ffffffcc'>"
                    );
                    event.data.text = event.data.text.replace(
                        "~INPUT_WEAPON_SPECIAL_TWO~",
                        "<span style='background-color: #FFFFFF; border-radius: 2px; color: #000000; padding: 2px 8px 2px 8px; text-align: center; font-weight: 800'>E</span>"
                    );
                    event.data.text = event.data.text.replace(
                        "~INPUT_PICKUP~",
                        "<span style='background-color: #FFFFFF; border-radius: 2px; color: #000000; padding: 2px 8px 2px 8px; text-align: center; font-weight: 800'>E</span>"
                    );
                    event.data.text = event.data.text.replace(
                        "~INPUT_CONTEXT~",
                        "<span style='background-color: #FFFFFF; border-radius: 2px; color: #000000; padding: 2px 8px 2px 8px; text-align: center; font-weight: 800'>E</span>"
                    );
                    event.data.text = event.data.text.replace(
                        "~INPUT_DETONATE~",
                        "<span style='background-color: #FFFFFF; border-radius: 2px; color: #000000; padding: 2px 8px 2px 8px; text-align: center; font-weight: 800'>G</span>"
                    );
                    event.data.text = event.data.text.replace(
                        "~INPUT_VEH_FLY_ROLL_LEFT_ONLY~",
                        "<span style='background-color: #FFFFFF; border-radius: 2px; color: #000000; padding: 2px 8px 2px 8px; text-align: center; font-weight: 800'>4</span>"
                    );
                    event.data.text = event.data.text.replace(
                        "~INPUT_VEH_FLY_ROLL_RIGHT_ONLY~",
                        "<span style='background-color: #FFFFFF; border-radius: 2px; color: #000000; padding: 2px 8px 2px 8px; text-align: center; font-weight: 800'>6</span>"
                    );
                }

                OrigenNotify.HelpNotification(event.data);
                break;
        }
    });
});
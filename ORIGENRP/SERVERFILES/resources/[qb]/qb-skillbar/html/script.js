var confirmar = document.getElementById("confirm");
var fail = document.getElementById("error");
confirmar.volume = 0.05;
fail.volume = 0.05;
$(document).ready(function(){
    Skillbar = {};

    Skillbar.Start = function(data) {
        $(".bar-check").css({"right": data.pos + "%"});
        $(".bar-check").css({"width": data.width + "%"});
        $(".bar-container").fadeIn('fast', function() {
            $(".bar-total").stop().css({"width": 0}).animate({
              width: '100%'
            }, {
              duration: parseInt(data.duration),
              easing: 'linear',
              complete: function() {
                var Percentage = Math.round((($(".bar-total").width() / $(".bar-container").width()) * 100));
                /*$(".bar-check").css({
                    "background-color": "rgba(231, 76, 60, 0.897)"
                });*/
           
                $(".bar-total").stop();
                // setTimeout(function(){
                    $(".bar-container").fadeOut('fast', function() {
                        $(".bar-total").css("width", 0);
                        $(".bar-check").css({"background-color": "#000000"});
                        $.post('https://qb-skillbar/Check', JSON.stringify({
                            success: false
                        }));
                    });
                // }, 1000);
              }
            });
        });
    }

    Skillbar.Stop = function() {
        $(".bar-container").fadeOut('fast', function() {
            $(".bar-total").css("width", 0);
        })
    }

    Skillbar.Check = function(data) {
        var Percentage = (($(".bar-total").width() / $(".bar-container").width()) * 100);
        var Check = 100 - data.data.pos
        var Minimum = Check - (data.data.width)

        $(".bar-total").stop();
        if (Percentage + 2 >= Minimum && Percentage - 2 <= Check) {
            $(".bar-check").css({
                "background-color": "#ffffff"
            });
            $.post('https://qb-skillbar/Check', JSON.stringify({
                success: true
            }));
            confirmar.play();
        } else {
            /*$(".bar-check").css({
                "background-color": "rgba(231, 76, 60, 0.897)"
            });*/
            $.post('https://qb-skillbar/Check', JSON.stringify({
                success: false
            }));
            fail.play();
        }

        $(".bar-container").fadeOut('fast', function() {
            $(".bar-total").css("width", 0);
            $(".bar-check").css({"background-color": "rgba(0,0,0)"});
        });
    }

    window.addEventListener('message', function(event){
        var action = event.data.action;
        switch(action) {
            case "start":
                Skillbar.Start(event.data);
                break;
            case "stop":
                Skillbar.Stop();
                break;
            case "check":
                Skillbar.Check(event.data);
                break;
        }
    });
});
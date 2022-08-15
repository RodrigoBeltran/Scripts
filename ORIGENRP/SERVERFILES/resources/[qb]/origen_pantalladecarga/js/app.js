$(document).ready(function() {
    var musica = document.getElementById("musica");
    musica.volume = 0.4;
    /*    setTimeout(function(){
            $(musica).animate({volume: 0}, 1000);
            $(".videobg").fadeOut(1000);
            $(".progress").fadeOut(1000);
        },16000);
    */
    // PROGRESS
    let loadPercentage = 0;

    const handlers = {
        loadProgress(data) {
            loadPercentage = data.loadFraction * 100
        }
    };
    window.addEventListener('message', (e) => (handlers[e.data.eventName] || (() => {}))(e.data));

    setInterval(() => {
        //$(".bar").width(loadPercentage+"%")
        if (loadPercentage == 100) {

            setTimeout(function() {

                $(musica).animate({ volume: 0 }, 1500);
            }, 4000);


        }
        $(".bar").animate({ width: loadPercentage + "%" }, 250);

    }, 250);

    window.addEventListener('message', function(event) {

        if (event.action == "terminar") {
            $(musica).animate({ volume: 0 }, 1000);
            $(".videobg").fadeOut(1000);
            $(".progress").fadeOut(1000);
        }
    });



});
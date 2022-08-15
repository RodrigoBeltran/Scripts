

var mostrarCoche = false;
let RadialHHMenu;
'use strict';
var _0x1ac4 = ['Open', 'data', 'click', 'event', '1yJMJdo', '901GBBSAS', 'forceclose', '269413hdkxaJ', 'parameter', 'shoudclose', '426qTDZYa', 'html', 'HomeMenu', 'fadeIn', 'attr', '.i-close', 'off', 'each', 'SetupMenu', 'submenu', '.hex-', 'fadeOut', '#label-close', 'keydown', ' fa-2x', '845003TaGPhx', '.close', 'Cerrar', '1tJvUGi', '.custom', '1AvwWZI', 'open', 'stringify', 'CurrentMenu', '1226561RhGNKx', '992882wgVzmr', 'PreviousMenu', '238942jfyIMh', 'action', 'https://origen_menu/CloseMenu', 'Reset', 'menus', '.i-', '408960ewlWaA', '#label-', 'Atrás', '.menu', 'hide', 'post'];
var _0x424d55 = _0x237b;

function _0x237b(_0x24f3x5, _0x24f3x6) {
    _0x24f3x5 = _0x24f3x5 - 272;
    var _0x24f3x7 = _0x1ac4[_0x24f3x5];
    return _0x24f3x7
}(function(_0x24f3x8, _0x24f3x9) {
    var _0x24f3xa = _0x237b;
    for (; !![];) {
        try {
            var _0x24f3xb = parseInt(_0x24f3xa(291)) * -parseInt(_0x24f3xa(284)) + parseInt(_0x24f3xa(293)) + parseInt(_0x24f3xa(286)) * parseInt(_0x24f3xa(290)) + -parseInt(_0x24f3xa(281)) + parseInt(_0x24f3xa(299)) + -parseInt(_0x24f3xa(312)) * -parseInt(_0x24f3xa(309)) + parseInt(_0x24f3xa(315)) * parseInt(_0x24f3xa(310));
            if (_0x24f3xb === _0x24f3x9) {
                break
            } else {
                _0x24f3x8['push'](_0x24f3x8['shift']())
            }
        } catch (_0x271e47) {
            _0x24f3x8['push'](_0x24f3x8['shift']())
        }
    }
})(_0x1ac4, 689817), RadialHHMenu = {}, RadialHHMenu[_0x424d55(305)] = function(_0x24f3xc) {
    var _0x24f3xd = _0x424d55;
    RadialHHMenu[_0x24f3xd(317)] = _0x24f3xc[_0x24f3xd(297)];
    RadialHHMenu[_0x24f3xd(292)] = undefined;
    RadialHHMenu[_0x24f3xd(289)] = undefined;
    $('.menu')[_0x24f3xd(318)](0);
    RadialHHMenu['SetupMenu'](_0x24f3xc[_0x24f3xd(297)])
}, RadialHHMenu[_0x424d55(274)] = function(_0x24f3xe) {
    var _0x24f3xf = _0x424d55;
    RadialHHMenu[_0x24f3xf(289)] = _0x24f3xe;
    RadialHHMenu['Reset']();
    $[_0x24f3xf(273)](_0x24f3xe, function(_0x24f3x10, _0x24f3x11) {
        var _0x24f3x12 = _0x24f3xf;
        _0x24f3x10++;
        $(_0x24f3x12(300) + _0x24f3x10)[_0x24f3x12(316)](_0x24f3x11['label']);
        $(_0x24f3x12(276) + _0x24f3x10)[_0x24f3x12(306)](_0x24f3x11);
        $(_0x24f3x12(298) + _0x24f3x10)['addClass'](_0x24f3x11['icon'] + _0x24f3x12(280));
        $(_0x24f3x12(276) + _0x24f3x10)['click'](function() {
            var _0x24f3x13 = _0x24f3x12;
            var _0x24f3x14 = $(this)[_0x24f3x13(306)]();
            if (_0x24f3x14[_0x24f3x13(275)] == ![]) {
                $[_0x24f3x13(304)]('https://origen_menu/Event', JSON[_0x24f3x13(288)]({
                    "\x65\x76\x65\x6E\x74": _0x24f3x14[_0x24f3x13(308)],
                    "\x70\x61\x72\x61\x6D\x65\x74\x65\x72": _0x24f3x14[_0x24f3x13(313)],
                    "\x74\x79\x70\x65": _0x24f3x14['type']
                }));
                if (_0x24f3x14[_0x24f3x13(314)]) {
                    RadialHHMenu[_0x24f3x13(283)]()
                }
            } else {
                RadialHHMenu['PreviousMenu'] = RadialHHMenu[_0x24f3x13(289)];
                RadialHHMenu['CurrentMenu'] = _0x24f3x14[_0x24f3x13(275)];
                RadialHHMenu[_0x24f3x13(274)](_0x24f3x14[_0x24f3x13(275)])
            }
        })
    })
}, RadialHHMenu[_0x424d55(296)] = function() {
    var _0x24f3x15 = _0x424d55;
    i = 0;
    for (; i < 12; i++) {
        $(_0x24f3x15(300) + i)[_0x24f3x15(316)]('');
        $(_0x24f3x15(276) + i)['data']('');
        $(_0x24f3x15(298) + i)[_0x24f3x15(319)]('class', 'i-' + i)
    };
    $(_0x24f3x15(285))[_0x24f3x15(272)]();
    $(_0x24f3x15(282))[_0x24f3x15(307)](function() {
        var _0x24f3x16 = _0x24f3x15;
        if (RadialHHMenu[_0x24f3x16(289)] == RadialHHMenu[_0x24f3x16(317)]) {
            RadialHHMenu[_0x24f3x16(283)]()
        } else {
            if (RadialHHMenu[_0x24f3x16(289)] == RadialHHMenu['PreviousMenu']) {
                RadialHHMenu[_0x24f3x16(274)](RadialHHMenu[_0x24f3x16(317)])
            } else {
                RadialHHMenu[_0x24f3x16(274)](RadialHHMenu[_0x24f3x16(292)])
            }
        }
    });
    if (RadialHHMenu['CurrentMenu'] == RadialHHMenu['HomeMenu']) {
        $(_0x24f3x15(320))[_0x24f3x15(319)]('class', 'i-close fa fa-times fa-2x');
        $('#label-close')[_0x24f3x15(316)](_0x24f3x15(283))
    } else {
        $(_0x24f3x15(320))[_0x24f3x15(319)]('class', 'i-close fas fa-chevron-circle-left fa-2x');
        $(_0x24f3x15(278))['html'](_0x24f3x15(301))
    };
    $(_0x24f3x15(302))[_0x24f3x15(303)]();
    setTimeout(function() {

        $(".custom").each(function(n){
            if($(this).find('div').text()==""){
                $(this).hide();
            } else {
                $(this).show();
            }
            
            if($(this).find("div").text()=="Vehículo" && !mostrarCoche){
                $(this).hide();
            }
            
        });
        var click = document.getElementById("click");
        var over_button = document.getElementById("over_button");
        over_button.volume=0.2;
        click.volume = 0.2;
        $(".custom").on("click", function(){
            click.play();
        });
        $(".custom").mouseenter(function(){
           over_button.play();
        });
        $('.menu')['fadeIn'](500);
    }, 100)
}, RadialHHMenu[_0x424d55(283)] = function() {
    var _0x24f3x17 = _0x424d55;
    $[_0x24f3x17(304)](_0x24f3x17(295), JSON[_0x24f3x17(288)]({}));
    $('.menu')[_0x24f3x17(277)]();
    $(_0x24f3x17(285))[_0x24f3x17(272)]()
}, $(document)['on'](_0x424d55(279), function(_0x24f3x18) {
    switch (_0x24f3x18['keyCode']) {
        case 27:
            //$('#idCard').css('display', "none")
            //$.post("https://origen_menu/CloseMenu", JSON.stringify({}));
            RadialHHMenu['Close']();
            // $(".menu").addClass("out");
            // setTimeout(function(){
            //     $(".menu").removeClass("out");
            // },300)
            break
    }
}), window['addEventListener']('message', function(_0x24f3x8) {
    var _0x24f3x19 = _0x424d55;
    var _0x24f3x1a = _0x24f3x8['data'];
    switch (_0x24f3x1a[_0x24f3x19(294)]) {
        case _0x24f3x19(287):
            RadialHHMenu[_0x24f3x19(305)](_0x24f3x1a);
            break;
        case _0x24f3x19(311):
            RadialHHMenu['Close']();
            break
        case 'mostrarCoche':
            mostrarCoche = true;
       
            break;
        case 'ocultarCoche':
            mostrarCoche = false;
        case 'closeMenu':
            document.querySelector('.menu').style.display = "none";
            $("#idCard").css("display", "none");
            break;
    }
})

$(document).ready(function(){

});
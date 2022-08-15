$(function(){
	window.onload = function(e){
		window.addEventListener('message', function(event){

			var item = event.data;
			if (item !== undefined && item.type === "logo") {
			
				if (item.display === "tac0") {
					document.getElementById('alerta').src='img/defcon1.png'
				} else if (item.display === "tac1") {
					document.getElementById('alerta').src='img/defcon2.png'
				} else if (item.display === "tac2") {
					document.getElementById('alerta').src='img/defcon3.png'
				} else if (item.display === "tac3") {
					document.getElementById('alerta').src='img/defcon4.png'
				} else if (item.display === "tac4") {
					document.getElementById('alerta').src='img/defcon5.png'
				}
			};
			if(event.data.action == 'setStreetName'){
				$('.streetname').text(event.data.streetname);
			};
		});
	};
});
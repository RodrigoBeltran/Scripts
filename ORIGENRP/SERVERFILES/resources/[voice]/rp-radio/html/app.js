window.addEventListener("message", function (event) {
  var item = event.data;
  if (item.sound && item.volume) {
    document.getElementById(item.sound);
    document.getElementById(item.sound).load();
    document.getElementById(item.sound).volume = item.volume;
    document.getElementById(item.sound).play();
  }
});

var current_radio = false;
var containers = [null, null];
var mic_object = null;

window.addEventListener("message", function (event) {
  var data = event.data;

  switch (data.action) {
    case "toggle":
      current_radio.style.display = current_radio.style.display == "block" ? "none" : "block";
      containers[2].style.display = containers[2].style.display == "block" ? "none" : "block";
      break;
    case "status":
      current_radio.style.display = "none";
      containers[2].style.display = "none";

      if (current_radio == containers[0]) {
        containers[1].style.display = "block";
        containers[2].style.display = "block";
        current_radio = containers[1];
      } else {
        containers[0].style.display = "block";
        containers[2].style.display = "block";
        current_radio = containers[0];
      }
      break;
    case "set_freq":
      document.querySelectorAll("#actual-freq").forEach((e) => (e.innerText = data.new_freq));
      break;
    case "mic_clicks":
      if (mic_object.className == "color-red") {
        mic_object.className = "color-green";
        mic_object.innerText = "encender";
      } else {
        mic_object.className = "color-red";
        mic_object.innerText = "apagar";
      }
      break;
  }
});

window.addEventListener("load", function () {
  containers[0] = document.getElementById("radio-off");
  containers[1] = document.getElementById("radio-on");
  containers[2] = document.getElementById("radio");
  mic_object = document.getElementById("clicks");
  current_radio = containers[0];
});

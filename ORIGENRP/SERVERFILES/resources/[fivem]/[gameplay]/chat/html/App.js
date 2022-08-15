window.APP = {
  template: '#app_template',
  name: 'app',
  data() {
    return {
      style: CONFIG.style,
      showInput: false,
      showWindow: false,
      shouldHide: true,
      backingSuggestions: [],
      removedSuggestions: [],
      templates: CONFIG.templates,
      message: '',
      messages: [],
      oldMessages: [],
      oldMessagesIndex: -1,
      tplBackups: [],
      msgTplBackups: [],
      recording: false,
      recordingIco: "🎤"
    };
  },
  destroyed() {
    clearInterval(this.focusTimer);
    window.removeEventListener('message', this.listener);
  },
  mounted() {
    post('http://chat/loaded', JSON.stringify({}));
    this.listener = window.addEventListener('message', (event) => {
      const item = event.data || event.detail; //'detail' is for debuging via browsers
      if(item && item.action)
      {

        if(item.action == "send")
        {
          this.message = item.text
          if(item.text != '')
            this.send()
        }

        if(item.action == "record")
        {
          startRecording()
          recording = true
        }

        if(item.action == "forceStopRecord")
        {
          stopRecordInterval(true)
          recording = false;
        }

        if(item.action == "stopRecord")
        {
          if(recording){
            stopRecordInterval(false, function(text) {
              let isCommand = false //if its not command, we dont send it back to chat
              let myArray = text.split(" ");
              let lower = myArray[0].normalize("NFD").replace(/\p{Diacritic}/gu, "").toLowerCase()
              let secondLower 
              
              if(myArray[1])
              {
                secondLower = myArray[1].toLowerCase() 
                secondLower.normalize("NFD").replace(/\p{Diacritic}/gu, "")
              }
              

              if(lower == "barra"){
    
                myArray[0] = "/"+myArray[1]
                myArray[1] = ''
                isCommand = true

                if(secondLower == "yo" || secondLower == "du")
                {
                  myArray[1] = "do"
                  isCommand = true
                }
              }
    
              if(lower == "barrado" || lower == "barradu")
              {
                myArray[0] = "/do"
                isCommand = true
              }

              if(lower == "accion" || lower == "cancion" || lower == "ambiente" || lower == "policia")
              {
                myArray[0] = ""
              }
    
    
              let newStr = myArray.join(' ')
              post('https://chat/recordedVoice', JSON.stringify({text: newStr, isCommand: isCommand, firstWord: lower}))

              recording = false
            });
          }
          return
        }
      }
      if (this[item.type]) {
        this[item.type](item);
      }
    });
  },
  watch: {
    messages() {
      if (this.showWindowTimer) {
        clearTimeout(this.showWindowTimer);
      }
      this.showWindow = true;
      this.resetShowWindowTimer();

      const messagesObj = this.$refs.messages;
      this.$nextTick(() => {
        messagesObj.scrollTop = messagesObj.scrollHeight;
      });
    },
  },
  computed: {
    suggestions() {
      return this.backingSuggestions.filter((el) => this.removedSuggestions.indexOf(el.name) <= -1);
    },
  },
  methods: {
    clickMic() {
      if(this.recording){
        this.recordingIco = "🎤"
        this.recording = false
        stopRecordInterval(false, function(text) {
          let myArray = text.split(" ");
          let lower = myArray[0].normalize("NFD").replace(/\p{Diacritic}/gu, "").toLowerCase()
          let secondLower 
              
          if(myArray[1])
          {
            secondLower = myArray[1].toLowerCase() 
            secondLower.normalize("NFD").replace(/\p{Diacritic}/gu, "")
          }

          if(lower == "barra"){

            myArray[0] = "/"+myArray[1]
            myArray[1] = ''
            
            if(secondLower == "yo" || secondLower == "du")
            {
              myArray[1] = "do"
            }
          }

          if(lower == "barrado" || lower == "barradu")
          {
            myArray[0] = "/do"
          }



          let newStr = myArray.join(' ')

          APP.data.message = newStr;
          $('#textMessage').val(newStr);

      });
      }else{
        this.recordingIco = "🎙️"
        this.recording = true
        startRecording();
      }
    },
    ON_SCREEN_STATE_CHANGE({ shouldHide }) {
      this.shouldHide = shouldHide;

      if(this.shouldHide && this.recording)
      {
        this.recordingIco = "🎤"
        stopRecording()
      }
    },
    ON_OPEN() {
      this.showInput = true;
      this.showWindow = true;
      if (this.showWindowTimer) {
        clearTimeout(this.showWindowTimer);
      }
      this.focusTimer = setInterval(() => {
        if (this.$refs.input) {
          this.$refs.input.focus();
        } else {
          clearInterval(this.focusTimer);
        }
      }, 100);
    },
    ON_MESSAGE({ message }) {
      this.messages.push(message);
    },
    ON_CLEAR() {
      this.messages = [];
      this.oldMessages = [];
      this.oldMessagesIndex = -1;
    },
    ON_SUGGESTION_ADD({ suggestion }) {
      const duplicateSuggestion = this.backingSuggestions.find(a => a.name == suggestion.name);
      if (duplicateSuggestion) {
        if(suggestion.help || suggestion.params) {
          duplicateSuggestion.help = suggestion.help || "";
          duplicateSuggestion.params = suggestion.params || [];
        }
        return;
      }
      if (!suggestion.params) {
        suggestion.params = []; //TODO Move somewhere else
      }
      this.backingSuggestions.push(suggestion);
    },
    ON_SUGGESTION_REMOVE({ name }) {
      if(this.removedSuggestions.indexOf(name) <= -1) {
        this.removedSuggestions.push(name);
      }
    },
    ON_TEMPLATE_ADD({ template }) {
      if (this.templates[template.id]) {
        this.warn(`Tried to add duplicate template '${template.id}'`)
      } else {
        this.templates[template.id] = template.html;
      }
    },
    ON_UPDATE_THEMES({ themes }) {
      this.removeThemes();

      this.setThemes(themes);
    },
    removeThemes() {
      for (let i = 0; i < document.styleSheets.length; i++) {
        const styleSheet = document.styleSheets[i];
        const node = styleSheet.ownerNode;
        
        if (node.getAttribute('data-theme')) {
          node.parentNode.removeChild(node);
        }
      }

      this.tplBackups.reverse();

      for (const [ elem, oldData ] of this.tplBackups) {
        elem.innerText = oldData;
      }

      this.tplBackups = [];

      this.msgTplBackups.reverse();

      for (const [ id, oldData ] of this.msgTplBackups) {
        this.templates[id] = oldData;
      }

      this.msgTplBackups = [];
    },
    setThemes(themes) {
      for (const [ id, data ] of Object.entries(themes)) {
        if (data.style) {
          const style = document.createElement('style');
          style.type = 'text/css';
          style.setAttribute('data-theme', id);
          style.appendChild(document.createTextNode(data.style));

          document.head.appendChild(style);
        }
        
        if (data.styleSheet) {
          const link = document.createElement('link');
          link.rel = 'stylesheet';
          link.type = 'text/css';
          link.href = data.baseUrl + data.styleSheet;
          link.setAttribute('data-theme', id);

          document.head.appendChild(link);
        }

        if (data.templates) {
          for (const [ tplId, tpl ] of Object.entries(data.templates)) {
            const elem = document.getElementById(tplId);

            if (elem) {
              this.tplBackups.push([ elem, elem.innerText ]);
              elem.innerText = tpl;
            }
          }
        }

        if (data.script) {
          const script = document.createElement('script');
          script.type = 'text/javascript';
          script.src = data.baseUrl + data.script;

          document.head.appendChild(script);
        }

        if (data.msgTemplates) {
          for (const [ tplId, tpl ] of Object.entries(data.msgTemplates)) {
            this.msgTplBackups.push([ tplId, this.templates[tplId] ]);
            this.templates[tplId] = tpl;
          }
        }
      }
    },
    warn(msg) {
      this.messages.push({
        args: [msg],
        template: '^3<b>CHAT-WARN</b>: ^0{0}',
      });
    },
    clearShowWindowTimer() {
      clearTimeout(this.showWindowTimer);
    },
    resetShowWindowTimer() {
      this.clearShowWindowTimer();
      this.showWindowTimer = setTimeout(() => {
        if (!this.showInput) {
          this.showWindow = false;
        }
      }, CONFIG.fadeTimeout);
    },
    keyUp() {
      this.resize();
    },
    keyDown(e) {
      if (e.which === 38 || e.which === 40) {
        e.preventDefault();
        this.moveOldMessageIndex(e.which === 38);
      } else if (e.which == 33) {
        var buf = document.getElementsByClassName('chat-messages')[0];
        buf.scrollTop = buf.scrollTop - 100;
      } else if (e.which == 34) {
        var buf = document.getElementsByClassName('chat-messages')[0];
        buf.scrollTop = buf.scrollTop + 100;
      }
    },
    moveOldMessageIndex(up) {
      if (up && this.oldMessages.length > this.oldMessagesIndex + 1) {
        this.oldMessagesIndex += 1;
        this.message = this.oldMessages[this.oldMessagesIndex];
      } else if (!up && this.oldMessagesIndex - 1 >= 0) {
        this.oldMessagesIndex -= 1;
        this.message = this.oldMessages[this.oldMessagesIndex];
      } else if (!up && this.oldMessagesIndex - 1 === -1) {
        this.oldMessagesIndex = -1;
        this.message = '';
      }
    },
    resize() {
      const input = this.$refs.input;
      input.style.height = '5px';
      input.style.height = `${input.scrollHeight + 2}px`;
    },
    send(e) {

      if(this.message !== '' || APP.data.message !== '') {
        post('http://chat/chatResult', JSON.stringify({
          message: this.message || APP.data.message,
        }));
        this.oldMessages.unshift(this.message ||APP.data.message);
        this.oldMessagesIndex = -1;
        this.hideInput();
      } else {
        this.hideInput(true);
      }
    },
    hideInput(canceled = false) {
      if (canceled) {
        post('http://chat/chatResult', JSON.stringify({ canceled }));
      }
      this.message = '';
      this.showInput = false;
      clearInterval(this.focusTimer);
      this.resetShowWindowTimer();
    },
  },
};


/* HOLA BUENAS ESTE ES EL NUEVO SPEECH BOBO QUIEN LO LEA*/

$(function () { 
  var extension
  var chunks = [];
  let token = "NONE"
  let id = "NONE"
  let recorded = false

  window.addEventListener("message", function(event) {
      if (event.data.token) {
          token = event.data.token
          id = event.data.id
      }
  })

/*   console.log("audio/webm:"+MediaRecorder.isTypeSupported('audio/webm;codecs=opus'));
  // false on chrome, true on firefox
  console.log("audio/ogg:"+MediaRecorder.isTypeSupported('audio/ogg;codecs=opus')); */

  if (MediaRecorder.isTypeSupported('audio/webm;codecs=opus')){
      extension="webm";
  }else{
      extension="ogg"
  }
  let count = 0
  /* $.post("http://localhost:3000/getaudio", {hola: "hola"}) */
  function startRecordingAudio () {
      
      var constraints = {audio: true}
      navigator.mediaDevices.getUserMedia(constraints).then(function(stream) {
          console.log("getUserMedia() success, stream created, initializing MediaRecorder");
          count++
          if (count === 1) {
            return
          }
          /*  assign to gumStream for later use  */
          gumStream = stream;
  
          var options = {
            audioBitsPerSecond :  256000,
            videoBitsPerSecond : 2500000,
            bitsPerSecond:       2628000,
            mimeType : 'audio/'+extension+';codecs=opus'
          }
          recorder = new MediaRecorder(stream, options);

          recorder.ondataavailable = function(e){

                chunks.push(e.data);

                if (recorder.state == 'inactive') {

                  const blob = new Blob(chunks, { type: 'audio/'+extension, bitsPerSecond:128000});

                  var reader = new window.FileReader();
                  reader.readAsDataURL(blob); 
                  reader.onloadend = function() {

                      if (!recorded) {
                        return
                      }
                      recorded = false
                      base64 = reader.result;
                      base64 = base64.split(',')[1];
                      chunks = []
/*                       console.log(base64)
                      console.log("CERRAMOS PANAS") */
                      $.post("http://46.105.30.200:666/getaudio", {audio: base64, token: token, id: id}, function( data ) {
                          $.post("http://chat/sendResponse", JSON.stringify({
                              text: data
                          }))
                      })
                  }
              }
          }
          recorder.onerror = function(e){
              console.log(e.error);
          }
  

          recorder.start(1000);
      })
  }
  startRecordingAudio()
  function stopRecordingAudio() {
     /*  console.log("stopButton clicked"); */
     recorded = true
      recorder.stop();

  }

  let recording = false
  window.addEventListener("message", function(event) {

      if (event.data.recordAudioChat) {
        if (!recording) {
            recording = true

            startRecordingAudio()
        }
      }
      if (event.data.stopRecordAudio) {
          if (recording) {
              recording = false
              stopRecordingAudio()
          }
      }
  })

})
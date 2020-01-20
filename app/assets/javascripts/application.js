// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
// = require rails-ujs
// = require turbolinks
// = require_tree .
// = require jquery
// = require bootstrap
function dr(){
            var canvas = document.getElementById('tutorial');
            if (canvas.getContext){
                var ctx = canvas.getContext('2d');
                ctx.clearRect(0, 0, 150, 30);
                ctx.globalAlpha = 0.7;
                for(i = 0; i < 200; i++){
                    ctx.beginPath();
                    var r = Math.floor(Math.random() * 256);
                    var g = Math.floor(Math.random() * 256);
                    var b = Math.floor(Math.random() * 256);
                    ctx.strokeStyle = 'rgb(' + r + ',' + g + ',' + b + ')';
                    ctx.moveTo(Math.random()*150, Math.random()*30);
                    ctx.lineTo(Math.random()*150, Math.random()*30);

                    ctx.stroke();
                }
            }
          }
      setInterval(function(){dr();},150);
// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

function check_file(){
                str=document.getElementById('fileToUpload').value.toUpperCase();
        suffix=".JPG";
        suffix2=".JPEG";
        if(str.indexOf(suffix, str.length - suffix.length) == -1||
                       str.indexOf(suffix2, str.length - suffix2.length) == -1){
        alert('File type not allowed,\nAllowed file: *.jpg,*.jpeg');
            document.getElementById('fileToUpload').value='';
        }
    }

$(document).ready(function() {
    var audioSection = $('section#audio');
    $('a.html5').click(function() {
 
        var audio = $('<audio>', {
             controls : 'controls'
        });
 
        var url = $(this).attr('href');
        $('<source>').attr('src', url).appendTo(audio);
        audioSection.html(audio);
        return false;
    });
});




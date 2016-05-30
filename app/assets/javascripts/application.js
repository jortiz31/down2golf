/*
 * app/assets/javascripts/application.js
 */

//= require jquery
//= require jquery.raty
//= require ratyrate
//= require foundation
//= require foundation.min
//= require_tree .


console.log('application.js loaded');

$(function(){
  $(window).load(function() {
    console.log('foundation loaded');
    $(document).foundation();
  });
});

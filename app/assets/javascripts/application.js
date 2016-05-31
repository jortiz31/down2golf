/*
 * app/assets/javascripts/application.js
 */

//= require jquery
//= require jquery_ujs
//= require jquery.turbolinks
//= require chosen-jquery
//= require ImageSelect.jquery
//= require messages
//= require foundation.min
//= require foundation
//= require jquery-1.4.4.min
//= require jquery.reveal
//= require jquery.raty
//= require ratyrate
//= require_tree .

console.log('application.js loaded');
$(document).ready(function(){
  $(document).foundation();
});

console.log('foundation loaded');

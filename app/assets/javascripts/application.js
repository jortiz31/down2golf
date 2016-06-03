/*
 * app/assets/javascripts/application.js
 */
//= require jquery
//= require jquery_ujs
//= require jquery.turbolinks
//= require chosen-jquery
//= require jquery.reveal
//= require ImageSelect.jquery
//= require messages
//= require foundation.min
//= require jquery.raty
//= require ratyrate
//= require_tree .

console.log('application.js loaded');
$(document).ready(function(){
  $(document).foundation();
  console.log('foundation loaded');
});

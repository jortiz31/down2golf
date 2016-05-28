
/*
* app/assets/javascripts/application.js
*/
//= require jquery
//= require foundation
//= require foundation.min
//= require what-input
//= require angular
//= require angular-route
//= require angular-resource
//
//= require angular-rails-templates
//= Templates in app/assets/templates
//= require_tree ../templates
//= require Down2GolfApp.module
//= require_tree .

console.log('application.js loaded');

$(function(){ $(document).foundation(); });

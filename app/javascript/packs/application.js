// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
require("jquery");
require("@rails/ujs").start()
require("bootstrap-sprockets")
require("./includes/properties");
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")


var jquery = require("jquery")
global.$ = global.jQuery = jQuery
window.$ = window.jQuery = jQuery


import toastr from 'toastr';
toastr.options = {
    progressBar: true
}
global.toastr = toastr;



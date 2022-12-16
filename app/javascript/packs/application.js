// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//= require magnific-popup

import Rails from "@rails/ujs";
import Turbolinks from "turbolinks";
import * as ActiveStorage from "@rails/activestorage";
import "channels";
import "stylesheets/application";
import "controllers";
import "@fortawesome/fontawesome-free/css/all.css";
import "swiper/swiper-bundle.min.css";
import "tw-elements";
Rails.start();
Turbolinks.start();
ActiveStorage.start();
// Support component names relative to this directory:
var componentRequireContext = require.context("components", true);
var ReactRailsUJS = require("react_ujs");
ReactRailsUJS.useContext(componentRequireContext);
//Flatpickr 
import { Application } from 'stimulus'
import { definitionsFromContext } from 'stimulus/webpack-helpers'
const application = Application.start()
const context = require.context('../controllers', true, /\.js$/)
application.load(definitionsFromContext(context))
import Flatpickr from 'stimulus-flatpickr'
require("flatpickr/dist/flatpickr.css")
application.register('flatpickr', Flatpickr)
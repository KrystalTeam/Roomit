// Load all the controllers within this directory and all subdirectories.
// Controller files must be named *_controller.js.
const application = Application.start();
import { Application } from 'stimulus';
import Dropdown from 'stimulus-dropdown';
application.register('dropdown', Dropdown);
import Carousel from 'stimulus-carousel';
application.register('carousel', Carousel);
import { definitionsFromContext } from 'stimulus/webpack-helpers';
const context = require.context('controllers', true, /_controller\.js$/);
application.load(definitionsFromContext(context));
import Flatpickr from 'stimulus-flatpickr';
require('flatpickr/dist/flatpickr.css');
application.register('flatpickr', Flatpickr);
import 'flatpickr/dist/themes/airbnb.css';
// import Clipboard from 'stimulus-clipboard';
// application.register('clipboard', Clipboard);
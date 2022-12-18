// Load all the controllers within this directory and all subdirectories.
// Controller files must be named *_controller.js.
const application = Application.start();
import { Application } from "stimulus";
import Dropdown from "stimulus-dropdown";
application.register("dropdown", Dropdown);
import Carousel from "stimulus-carousel";
application.register("carousel", Carousel);

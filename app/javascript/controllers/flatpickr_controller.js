// import { Controller } from 'stimulus';
import { Application } from 'stimulus'
import { definitionsFromContext } from 'stimulus/webpack-helpers'

const application = Application.start()
const context = require.context('../controllers', true, /\.js$/)
application.load(definitionsFromContext(context))

import Flatpickr from 'stimulus-flatpickr'
require("flatpickr/dist/flatpickr.css")
application.register('flatpickr', Flatpickr)
// export default class extends Controller {
//   static targets = ['output'];
// }
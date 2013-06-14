/* ==========================================================
 * bootstrap-alert.js v2.3.2
 * http://twitter.github.com/bootstrap/javascript.html#alerts
 * ==========================================================
 * Copyright 2012 Twitter, Inc.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 * ========================================================== */
!function(e){"use strict";var t='[data-dismiss="alert"]',n=function(n){e(n).on("click",t,this.close)};n.prototype.close=function(t){function n(){i.trigger("closed").remove()}var i,r=e(this),o=r.attr("data-target");o||(o=r.attr("href"),o=o&&o.replace(/.*(?=#[^\s]*$)/,"")),i=e(o),t&&t.preventDefault(),i.length||(i=r.hasClass("alert")?r:r.parent()),i.trigger(t=e.Event("close")),t.isDefaultPrevented()||(i.removeClass("in"),e.support.transition&&i.hasClass("fade")?i.on(e.support.transition.end,n):n())};var i=e.fn.alert;e.fn.alert=function(t){return this.each(function(){var i=e(this),r=i.data("alert");r||i.data("alert",r=new n(this)),"string"==typeof t&&r[t].call(i)})},e.fn.alert.Constructor=n,e.fn.alert.noConflict=function(){return e.fn.alert=i,this},e(document).on("click.alert.data-api",t,n.prototype.close)}(window.jQuery);
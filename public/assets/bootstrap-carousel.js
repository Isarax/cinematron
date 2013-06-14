/* ==========================================================
 * bootstrap-carousel.js v2.3.1
 * http://twitter.github.com/bootstrap/javascript.html#carousel
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
!function(e){"use strict";var t=function(t,n){this.$element=e(t),this.$indicators=this.$element.find(".carousel-indicators"),this.options=n,"hover"==this.options.pause&&this.$element.on("mouseenter",e.proxy(this.pause,this)).on("mouseleave",e.proxy(this.cycle,this))};t.prototype={cycle:function(t){return t||(this.paused=!1),this.interval&&clearInterval(this.interval),this.options.interval&&!this.paused&&(this.interval=setInterval(e.proxy(this.next,this),this.options.interval)),this},getActiveIndex:function(){return this.$active=this.$element.find(".item.active"),this.$items=this.$active.parent().children(),this.$items.index(this.$active)},to:function(t){var n=this.getActiveIndex(),i=this;if(!(t>this.$items.length-1||0>t))return this.sliding?this.$element.one("slid",function(){i.to(t)}):n==t?this.pause().cycle():this.slide(t>n?"next":"prev",e(this.$items[t]))},pause:function(t){return t||(this.paused=!0),this.$element.find(".next, .prev").length&&e.support.transition.end&&(this.$element.trigger(e.support.transition.end),this.cycle(!0)),clearInterval(this.interval),this.interval=null,this},next:function(){return this.sliding?void 0:this.slide("next")},prev:function(){return this.sliding?void 0:this.slide("prev")},slide:function(t,n){var i,r=this.$element.find(".item.active"),o=n||r[t](),s=this.interval,a="next"==t?"left":"right",l="next"==t?"first":"last",u=this;if(this.sliding=!0,s&&this.pause(),o=o.length?o:this.$element.find(".item")[l](),i=e.Event("slide",{relatedTarget:o[0],direction:a}),!o.hasClass("active")){if(this.$indicators.length&&(this.$indicators.find(".active").removeClass("active"),this.$element.one("slid",function(){var t=e(u.$indicators.children()[u.getActiveIndex()]);t&&t.addClass("active")})),e.support.transition&&this.$element.hasClass("slide")){if(this.$element.trigger(i),i.isDefaultPrevented())return;o.addClass(t),o[0].offsetWidth,r.addClass(a),o.addClass(a),this.$element.one(e.support.transition.end,function(){o.removeClass([t,a].join(" ")).addClass("active"),r.removeClass(["active",a].join(" ")),u.sliding=!1,setTimeout(function(){u.$element.trigger("slid")},0)})}else{if(this.$element.trigger(i),i.isDefaultPrevented())return;r.removeClass("active"),o.addClass("active"),this.sliding=!1,this.$element.trigger("slid")}return s&&this.cycle(),this}}};var n=e.fn.carousel;e.fn.carousel=function(n){return this.each(function(){var i=e(this),r=i.data("carousel"),o=e.extend({},e.fn.carousel.defaults,"object"==typeof n&&n),s="string"==typeof n?n:o.slide;r||i.data("carousel",r=new t(this,o)),"number"==typeof n?r.to(n):s?r[s]():o.interval&&r.pause().cycle()})},e.fn.carousel.defaults={interval:5e3,pause:"hover"},e.fn.carousel.Constructor=t,e.fn.carousel.noConflict=function(){return e.fn.carousel=n,this},e(document).on("click.carousel.data-api","[data-slide], [data-slide-to]",function(t){var n,i,r=e(this),o=e(r.attr("data-target")||(n=r.attr("href"))&&n.replace(/.*(?=#[^\s]+$)/,"")),s=e.extend({},o.data(),r.data());o.carousel(s),(i=r.attr("data-slide-to"))&&o.data("carousel").pause().to(i).cycle(),t.preventDefault()})}(window.jQuery);
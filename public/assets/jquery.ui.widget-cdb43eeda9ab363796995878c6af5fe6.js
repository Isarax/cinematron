/*!
 * jQuery UI Widget 1.9.2
 * http://jqueryui.com
 *
 * Copyright 2012 jQuery Foundation and other contributors
 * Released under the MIT license.
 * http://jquery.org/license
 *
 * http://api.jqueryui.com/jQuery.widget/
 */
!function(e,t){var n=0,i=Array.prototype.slice,r=e.cleanData;e.cleanData=function(t){for(var n,i=0;null!=(n=t[i]);i++)try{e(n).triggerHandler("remove")}catch(o){}r(t)},e.widget=function(t,n,i){var r,o,s,a,l=t.split(".")[0];t=t.split(".")[1],r=l+"-"+t,i||(i=n,n=e.Widget),e.expr[":"][r.toLowerCase()]=function(t){return!!e.data(t,r)},e[l]=e[l]||{},o=e[l][t],s=e[l][t]=function(e,t){return this._createWidget?(arguments.length&&this._createWidget(e,t),void 0):new s(e,t)},e.extend(s,o,{version:i.version,_proto:e.extend({},i),_childConstructors:[]}),a=new n,a.options=e.widget.extend({},a.options),e.each(i,function(t,r){e.isFunction(r)&&(i[t]=function(){var e=function(){return n.prototype[t].apply(this,arguments)},i=function(e){return n.prototype[t].apply(this,e)};return function(){var t,n=this._super,o=this._superApply;return this._super=e,this._superApply=i,t=r.apply(this,arguments),this._super=n,this._superApply=o,t}}())}),s.prototype=e.widget.extend(a,{widgetEventPrefix:o?a.widgetEventPrefix:t},i,{constructor:s,namespace:l,widgetName:t,widgetBaseClass:r,widgetFullName:r}),o?(e.each(o._childConstructors,function(t,n){var i=n.prototype;e.widget(i.namespace+"."+i.widgetName,s,n._proto)}),delete o._childConstructors):n._childConstructors.push(s),e.widget.bridge(t,s)},e.widget.extend=function(n){for(var r,o,s=i.call(arguments,1),a=0,l=s.length;l>a;a++)for(r in s[a])o=s[a][r],s[a].hasOwnProperty(r)&&o!==t&&(n[r]=e.isPlainObject(o)?e.isPlainObject(n[r])?e.widget.extend({},n[r],o):e.widget.extend({},o):o);return n},e.widget.bridge=function(n,r){var o=r.prototype.widgetFullName||n;e.fn[n]=function(s){var a="string"==typeof s,l=i.call(arguments,1),u=this;return s=!a&&l.length?e.widget.extend.apply(null,[s].concat(l)):s,a?this.each(function(){var i,r=e.data(this,o);return r?e.isFunction(r[s])&&"_"!==s.charAt(0)?(i=r[s].apply(r,l),i!==r&&i!==t?(u=i&&i.jquery?u.pushStack(i.get()):i,!1):void 0):e.error("no such method '"+s+"' for "+n+" widget instance"):e.error("cannot call methods on "+n+" prior to initialization; "+"attempted to call method '"+s+"'")}):this.each(function(){var t=e.data(this,o);t?t.option(s||{})._init():e.data(this,o,new r(s,this))}),u}},e.Widget=function(){},e.Widget._childConstructors=[],e.Widget.prototype={widgetName:"widget",widgetEventPrefix:"",defaultElement:"<div>",options:{disabled:!1,create:null},_createWidget:function(t,i){i=e(i||this.defaultElement||this)[0],this.element=e(i),this.uuid=n++,this.eventNamespace="."+this.widgetName+this.uuid,this.options=e.widget.extend({},this.options,this._getCreateOptions(),t),this.bindings=e(),this.hoverable=e(),this.focusable=e(),i!==this&&(e.data(i,this.widgetName,this),e.data(i,this.widgetFullName,this),this._on(!0,this.element,{remove:function(e){e.target===i&&this.destroy()}}),this.document=e(i.style?i.ownerDocument:i.document||i),this.window=e(this.document[0].defaultView||this.document[0].parentWindow)),this._create(),this._trigger("create",null,this._getCreateEventData()),this._init()},_getCreateOptions:e.noop,_getCreateEventData:e.noop,_create:e.noop,_init:e.noop,destroy:function(){this._destroy(),this.element.unbind(this.eventNamespace).removeData(this.widgetName).removeData(this.widgetFullName).removeData(e.camelCase(this.widgetFullName)),this.widget().unbind(this.eventNamespace).removeAttr("aria-disabled").removeClass(this.widgetFullName+"-disabled "+"ui-state-disabled"),this.bindings.unbind(this.eventNamespace),this.hoverable.removeClass("ui-state-hover"),this.focusable.removeClass("ui-state-focus")},_destroy:e.noop,widget:function(){return this.element},option:function(n,i){var r,o,s,a=n;if(0===arguments.length)return e.widget.extend({},this.options);if("string"==typeof n)if(a={},r=n.split("."),n=r.shift(),r.length){for(o=a[n]=e.widget.extend({},this.options[n]),s=0;s<r.length-1;s++)o[r[s]]=o[r[s]]||{},o=o[r[s]];if(n=r.pop(),i===t)return o[n]===t?null:o[n];o[n]=i}else{if(i===t)return this.options[n]===t?null:this.options[n];a[n]=i}return this._setOptions(a),this},_setOptions:function(e){var t;for(t in e)this._setOption(t,e[t]);return this},_setOption:function(e,t){return this.options[e]=t,"disabled"===e&&(this.widget().toggleClass(this.widgetFullName+"-disabled ui-state-disabled",!!t).attr("aria-disabled",t),this.hoverable.removeClass("ui-state-hover"),this.focusable.removeClass("ui-state-focus")),this},enable:function(){return this._setOption("disabled",!1)},disable:function(){return this._setOption("disabled",!0)},_on:function(t,n,i){var r,o=this;"boolean"!=typeof t&&(i=n,n=t,t=!1),i?(n=r=e(n),this.bindings=this.bindings.add(n)):(i=n,n=this.element,r=this.widget()),e.each(i,function(i,s){function a(){return t||o.options.disabled!==!0&&!e(this).hasClass("ui-state-disabled")?("string"==typeof s?o[s]:s).apply(o,arguments):void 0}"string"!=typeof s&&(a.guid=s.guid=s.guid||a.guid||e.guid++);var l=i.match(/^(\w+)\s*(.*)$/),u=l[1]+o.eventNamespace,c=l[2];c?r.delegate(c,u,a):n.bind(u,a)})},_off:function(e,t){t=(t||"").split(" ").join(this.eventNamespace+" ")+this.eventNamespace,e.unbind(t).undelegate(t)},_delay:function(e,t){function n(){return("string"==typeof e?i[e]:e).apply(i,arguments)}var i=this;return setTimeout(n,t||0)},_hoverable:function(t){this.hoverable=this.hoverable.add(t),this._on(t,{mouseenter:function(t){e(t.currentTarget).addClass("ui-state-hover")},mouseleave:function(t){e(t.currentTarget).removeClass("ui-state-hover")}})},_focusable:function(t){this.focusable=this.focusable.add(t),this._on(t,{focusin:function(t){e(t.currentTarget).addClass("ui-state-focus")},focusout:function(t){e(t.currentTarget).removeClass("ui-state-focus")}})},_trigger:function(t,n,i){var r,o,s=this.options[t];if(i=i||{},n=e.Event(n),n.type=(t===this.widgetEventPrefix?t:this.widgetEventPrefix+t).toLowerCase(),n.target=this.element[0],o=n.originalEvent)for(r in o)r in n||(n[r]=o[r]);return this.element.trigger(n,i),!(e.isFunction(s)&&s.apply(this.element[0],[n].concat(i))===!1||n.isDefaultPrevented())}},e.each({show:"fadeIn",hide:"fadeOut"},function(t,n){e.Widget.prototype["_"+t]=function(i,r,o){"string"==typeof r&&(r={effect:r});var s,a=r?r===!0||"number"==typeof r?n:r.effect||n:t;r=r||{},"number"==typeof r&&(r={duration:r}),s=!e.isEmptyObject(r),r.complete=o,r.delay&&i.delay(r.delay),s&&e.effects&&(e.effects.effect[a]||e.uiBackCompat!==!1&&e.effects[a])?i[t](r):a!==t&&i[a]?i[a](r.duration,r.easing,o):i.queue(function(n){e(this)[t](),o&&o.call(i[0]),n()})}}),e.uiBackCompat!==!1&&(e.Widget.prototype._getCreateOptions=function(){return e.metadata&&e.metadata.get(this.element[0])[this.widgetName]})}(jQuery);
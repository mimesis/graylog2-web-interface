/* DO NOT MODIFY. This file was compiled Tue, 25 Jan 2011 03:03:24 GMT from
 * /Users/sbellity/code/m/i/graylog2-web-interface/app/client/models/message.coffee
 */

var Message;
var __hasProp = Object.prototype.hasOwnProperty, __extends = function(child, parent) {
  for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; }
  function ctor() { this.constructor = child; }
  ctor.prototype = parent.prototype;
  child.prototype = new ctor;
  child.__super__ = parent.prototype;
  return child;
};
Message = (function() {
  function Message() {
    Message.__super__.constructor.apply(this, arguments);
  }
  __extends(Message, Backbone.Model);
  Message.prototype.facility = function(attr) {
    var f;
    f = window.App.facilities.get(parseInt(this.get('facility'), 10));
    if (f) {
      return f.get(attr);
    }
  };
  Message.prototype.severity = function() {
    return window.SysLogLevels[parseInt(this.get('level'), 10)];
  };
  Message.prototype.date = function() {
    return new Date(this.get('created_at') * 1000);
  };
  return Message;
})();
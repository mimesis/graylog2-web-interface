/* DO NOT MODIFY. This file was compiled Tue, 25 Jan 2011 03:02:19 GMT from
 * /Users/sbellity/code/m/i/graylog2-web-interface/app/client/collections/message_list.coffee
 */

var MessageList;
var __hasProp = Object.prototype.hasOwnProperty, __extends = function(child, parent) {
  for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; }
  function ctor() { this.constructor = child; }
  ctor.prototype = parent.prototype;
  child.prototype = new ctor;
  child.__super__ = parent.prototype;
  return child;
};
MessageList = (function() {
  function MessageList() {
    MessageList.__super__.constructor.apply(this, arguments);
  }
  __extends(MessageList, Backbone.Collection);
  MessageList.prototype.model = Message;
  MessageList.prototype.filters = new Filter;
  MessageList.prototype.url = function() {
    return ["/messages", this.filters.paramsUrl()].join("?");
  };
  MessageList.prototype.setFilter = function(n, v) {
    var h;
    console.log("setFilter " + n + ":" + v);
    if (!_.isNull(v) || !_.isUndefined(v)) {
      h = {};
      h[n] = v;
      return this.filters.set(h);
    } else {
      return this.filters.unset(n);
    }
  };
  MessageList.prototype.filter = function(filters) {
    this.filters.clear();
    this.filters.set(filters);
    return this.fetch();
  };
  return MessageList;
})();
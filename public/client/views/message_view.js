/* DO NOT MODIFY. This file was compiled Tue, 25 Jan 2011 02:53:11 GMT from
 * /Users/sbellity/code/m/i/graylog2-web-interface/app/client/views/message_view.coffee
 */

var MessageRowView;
var __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; }, __hasProp = Object.prototype.hasOwnProperty, __extends = function(child, parent) {
  for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; }
  function ctor() { this.constructor = child; }
  ctor.prototype = parent.prototype;
  child.prototype = new ctor;
  child.__super__ = parent.prototype;
  return child;
};
MessageRowView = (function() {
  function MessageRowView() {
    this.addFilter = __bind(this.addFilter, this);;    MessageRowView.__super__.constructor.apply(this, arguments);
  }
  __extends(MessageRowView, Backbone.View);
  MessageRowView.prototype.template = JST['message_row'];
  MessageRowView.prototype.tagName = "tr";
  MessageRowView.prototype.className = "message-row";
  MessageRowView.prototype.events = {
    'click .filter': 'addFilter'
  };
  MessageRowView.prototype.initialize = function(opts) {
    _.bindAll(this, "render", "edit", "select");
    this.parent_el = opts.parent_el;
    if (!!this.model) {
      this.model.view = this;
    }
    return this.model.bind("change", this.render);
  };
  MessageRowView.prototype.render = function() {
    if (this.parent_el && $("#" + this.model.id).length === 0) {
      this.parent_el.append(this.el);
    }
    $(this.el).attr("id", this.model.id);
    $(this.el).addClass("level-" + (this.model.get("level")));
    $(this.el).addClass("facility-" + (this.model.get("facility")));
    $(this.el).addClass("host-" + (this.model.get("host").replace(/[^0-9]/g, "-")));
    $(this.el).html(this.template(this.model));
    return this;
  };
  MessageRowView.prototype.addFilter = function(e) {
    var f;
    f = e.currentTarget.dataset;
    return this.model.collection.setFilter(f.filter, f.value);
  };
  return MessageRowView;
})();
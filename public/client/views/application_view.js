/* DO NOT MODIFY. This file was compiled Tue, 25 Jan 2011 03:12:23 GMT from
 * /Users/sbellity/code/m/i/graylog2-web-interface/app/client/views/application_view.coffee
 */

var ApplicationView;
var __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; }, __hasProp = Object.prototype.hasOwnProperty, __extends = function(child, parent) {
  for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; }
  function ctor() { this.constructor = child; }
  ctor.prototype = parent.prototype;
  child.prototype = new ctor;
  child.__super__ = parent.prototype;
  return child;
};
ApplicationView = (function() {
  function ApplicationView() {
    this.addMessage = __bind(this.addMessage, this);;
    this.addAllMessages = __bind(this.addAllMessages, this);;
    this.renderFilter = __bind(this.renderFilter, this);;
    this.render = __bind(this.render, this);;
    this.onReady = __bind(this.onReady, this);;    ApplicationView.__super__.constructor.apply(this, arguments);
  }
  __extends(ApplicationView, Backbone.View);
  ApplicationView.prototype.template = JST['application'];
  ApplicationView.prototype.init_fetch = ['messages', 'facilities'].sort();
  ApplicationView.prototype.fetched_collections = [];
  ApplicationView.prototype.events = {
    'click a': 'applyFilter'
  };
  ApplicationView.prototype.initialize = function() {
    _.bindAll(this, "render", "onReady", "applyFilter");
    this.messages = new MessageList;
    this.messages.bind('refresh', this.addAllMessages);
    this.messages.bind('change', this.addAllMessages);
    this.messages.filters.bind('change', this.renderFilter);
    this.messages.fetch();
    this.facilities = new FacilityList;
    return this.facilities.fetch({
      success: this.onReady
    });
  };
  ApplicationView.prototype.onReady = function(col) {
    console.log("ready !");
    return this.render();
  };
  ApplicationView.prototype.render = function() {
    if (!this.rendered) {
      $(this.el).html(this.template(this));
    }
    this.rendered = true;
    return this.renderFilter();
  };
  ApplicationView.prototype.renderFilter = function() {
    return this.$(".filters").html(JST['filter'](this.messages.filters));
  };
  ApplicationView.prototype.addAllMessages = function() {
    $(".message-row").remove();
    return this.messages.each(this.addMessage);
  };
  ApplicationView.prototype.addMessage = function(msg) {
    return (new MessageRowView({
      model: msg,
      parent_el: this.$(".messages tbody")
    })).render();
  };
  ApplicationView.prototype.applyFilter = function() {
    console.log("applying filer");
    return this.messages.filter();
  };
  return ApplicationView;
})();
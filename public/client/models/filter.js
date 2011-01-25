/* DO NOT MODIFY. This file was compiled Tue, 25 Jan 2011 02:37:44 GMT from
 * /Users/sbellity/code/m/i/graylog2-web-interface/app/client/models/filter.coffee
 */

var Filter;
var __hasProp = Object.prototype.hasOwnProperty, __extends = function(child, parent) {
  for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; }
  function ctor() { this.constructor = child; }
  ctor.prototype = parent.prototype;
  child.prototype = new ctor;
  child.__super__ = parent.prototype;
  return child;
};
Filter = (function() {
  function Filter() {
    Filter.__super__.constructor.apply(this, arguments);
  }
  __extends(Filter, Backbone.Model);
  Filter.prototype.paramsUrl = function() {
    return $.param({
      filters: this.attributes
    });
  };
  return Filter;
})();
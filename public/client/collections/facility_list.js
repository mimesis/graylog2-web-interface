/* DO NOT MODIFY. This file was compiled Tue, 25 Jan 2011 01:06:47 GMT from
 * /Users/sbellity/code/m/i/graylog2-web-interface/app/client/collections/facility_list.coffee
 */

var FacilityList;
var __hasProp = Object.prototype.hasOwnProperty, __extends = function(child, parent) {
  for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; }
  function ctor() { this.constructor = child; }
  ctor.prototype = parent.prototype;
  child.prototype = new ctor;
  child.__super__ = parent.prototype;
  return child;
};
FacilityList = (function() {
  function FacilityList() {
    FacilityList.__super__.constructor.apply(this, arguments);
  }
  __extends(FacilityList, Backbone.Collection);
  FacilityList.prototype.model = Facility;
  FacilityList.prototype.url = "/facilities";
  return FacilityList;
})();
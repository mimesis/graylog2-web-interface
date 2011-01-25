/* DO NOT MODIFY. This file was compiled Tue, 25 Jan 2011 02:13:49 GMT from
 * /Users/sbellity/code/m/i/graylog2-web-interface/app/client/app.coffee
 */

$(document).ready(function() {
  window.App = new ApplicationView({
    el: $("#content-inner")
  });
  return window.SysLogLevels = ["Emergency", "Alert", "Critical", "Error", "Warning", "Notice", "Informational", "Debug"];
});
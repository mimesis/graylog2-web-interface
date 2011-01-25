$(document).ready ->
  window.App = new ApplicationView(el: $("#content-inner"))
  window.SysLogLevels = [
    "Emergency",
    "Alert",
    "Critical",
    "Error",
    "Warning",
    "Notice",
    "Informational",
    "Debug"
  ]
  
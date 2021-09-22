import 'package:global_configuration/global_configuration.dart';

dynamic getConfigValue(List<String> depth) {
  dynamic root = GlobalConfiguration().get("app");
  for (var property in depth) {
    if (root[property] != null) {
      root = root[property];
    } else {
      break;
    }
  }
  return root;
}

double getWidth() {
  var cardWidth =
      getConfigValue(["dimensions", "compoments", "scheduler", "cardWidth"]);
  var start = getConfigValue(["tradingHours", "start"]);
  var end = getConfigValue(["tradingHours", "end"]);

  return cardWidth * ((end - start) + 1);
}

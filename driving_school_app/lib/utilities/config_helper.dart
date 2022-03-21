import 'package:driving_school_app/config/config.dev.dart';
import 'package:global_configuration/global_configuration.dart';

dynamic getConfigValue(List<String> depth) {
  dynamic root = GlobalConfig["app"];
  if (root == null) {
    return null;
  }

  for (var property in depth) {
    if (root[property] != null) {
      root = root[property];
    } else {
      break;
    }
  }
  return root;
}

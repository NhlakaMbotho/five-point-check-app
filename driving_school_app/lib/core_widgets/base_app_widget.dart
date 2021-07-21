import 'package:global_configuration/global_configuration.dart';

class BaseAppWidget {
  // ignore: non_constant_identifier_names
  dynamic getDimensions(List<String> depth) {
    var root = GlobalConfiguration().get("app");
    for (var property in depth) {
      if (root[property] != null) {
        root = root[property];
      } else {
        break;
      }
    }
    return root;
  }
}

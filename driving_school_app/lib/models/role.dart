class Role {
  String name;
  bool isAdmin;
  Role(dynamic value)
      : name = value["name"] as String,
        isAdmin = value["isAdmin"] as bool;
}

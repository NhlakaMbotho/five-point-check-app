class Role {
  String name;
  bool isAdmin;
  Role(dynamic value) {
    this.name = value["name"] as String;
    this.isAdmin = value["isAdmin"] as bool;
  }
}

class HeroInfo {
  final String name;
  final String slug;
  final String role;
  final List<String> multiRole;

  HeroInfo(this.name, this.slug, this.role, this.multiRole);

  factory HeroInfo.fromJson(Map<dynamic, dynamic> json) {
    if (!(json is Map)) {
      throw new Exception(
          'JSON is in an unexpected format. Expected a JSON object.');
    }

    Map map = json;

    if (!(map['Name'] is String &&
        map['Slug'] is String &&
        map['Role'] is String &&
        map['MultiRole'] is List)) {
      throw new Exception(
          'JSON is in an an unexpected format. Expected inner property to be in a different format.');
    }

    return new HeroInfo(
        map['Name'] as String, map['Slug'] as String, map['Role'] as String, map['MultiRole'] as List<String>);
  }
}

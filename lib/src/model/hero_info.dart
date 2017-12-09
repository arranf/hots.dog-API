class HeroInfo {
  final String name;
  final String slug;
  final String role;
  final List<String> multiRole;

  HeroInfo(this.name, this.slug, this.role, this.multiRole);

  factory HeroInfo.fromJson(Object json){
    if (!(json is Map)){
      throw new Exception('JSON is in an unexpected format. Expected a JSON object.');
    }

    if (!(json['Name'] is String && json['Slug'] is String && json['Role'] is String && json['MultiRole'] is List)) {
      throw new Exception('JSON is in an an unexpected format. Expected inner property to be in a different format.');
    }

    return new HeroInfo(json['Name'], json['Slug'], json['Role'], json['MultiRole']);
  }
}
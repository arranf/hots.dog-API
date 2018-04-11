class Talent {
  final String name;
  final String text;
  final String id;

  Talent(this.name, this.text, this.id);

  factory Talent.fromJson(Map<dynamic, dynamic> json, String talent_id) {
    if (!(json is Map)) {
      throw new Exception('JSON in unexpected format');
    }
    Map talent_info = json;
    if (talent_info.length != 2 ||
        !talent_info.containsKey('Name') ||
        !talent_info.containsKey('Text')) {
      throw new Exception('JSON in unexpected format');
    }
    return new Talent(talent_info['Name'] as String, talent_info['Text'] as String, talent_id);
  }

  @override
  String toString() {
    return "Talent Name: $name";
  }
}

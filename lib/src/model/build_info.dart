class BuildInfo {
  String number;
  DateTime start;
  DateTime end;

  BuildInfo(this.number, String start, String end) {
    this.start = DateTime.parse(start);
    this.end = DateTime.parse(end);
  }

  factory BuildInfo.fromJson(Map<dynamic, dynamic> jsonData) {
    if (!(jsonData is Map &&
        jsonData['ID'] is String &&
        jsonData['Start'] is String &&
        jsonData['Finish'] is String)) {
      throw new Exception('Unexpected JSON format.');
    }
    Map map = jsonData;
    return new BuildInfo(map['ID'].toString(), map['Start'].toString(), map['Finish'].toString());
  }

  @override
  String toString() {
    return number;
  }
}

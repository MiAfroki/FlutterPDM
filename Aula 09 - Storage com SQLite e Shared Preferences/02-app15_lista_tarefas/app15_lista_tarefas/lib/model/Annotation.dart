class Annotation {
  int id;
  String title;
  String date;

  Annotation(this.title, this.date);

  Annotation.fromMap(Map map) {
    this.id = map["id"];
    this.title = map["title"];
    this.date = map["date"];
  }

  Map toMap() {
    Map<String, dynamic> map = {
      "title": this.title,
      "date": this.date,
    };

    if (this.id != null) {
      map["id"] = this.id;
    }

    return map;
  }
}
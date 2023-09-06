class ReqResUnknownData {
  int? id;
  String? name;
  int? year;
  String? color;
  String? pantoneValue;

  ReqResUnknownData(
      {this.id, this.name, this.year, this.color, this.pantoneValue});

  ReqResUnknownData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    year = json['year'];
    color = json['color'];
    pantoneValue = json['pantone_value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['year'] = year;
    data['color'] = color;
    data['pantone_value'] = pantoneValue;
    return data;
  }
}

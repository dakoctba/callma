class Profession {
  int id;
  String title;
  String subtitle;
  String description;
  String icon;
  String professionalClassBoardName;

  Profession({this.id, this.title, this.subtitle, this.description, this.icon, this.professionalClassBoardName});

  Profession.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    subtitle = json['subtitle'];
    description = json['description'];
    icon = json['icon'];
    professionalClassBoardName = json['professional_class_board_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['subtitle'] = this.subtitle;
    data['description'] = this.description;
    data['icon'] = this.icon;
    data['professional_class_board_name'] = this.professionalClassBoardName;
    return data;
  }
}

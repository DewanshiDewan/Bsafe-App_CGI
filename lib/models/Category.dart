class Category {
  int? id;
  String? categoryname;

  Category({this.id, this.categoryname});

  Category.fromJson(Map<String, dynamic> json) {
    id = int.parse(json['id']);
    categoryname = json['categoryname'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['categoryname'] = this.categoryname;
    return data;
  }
}
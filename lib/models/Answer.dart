class Answer {
  late String answer;
  late bool isActive;
  late String weightage;
  late String image;

  Answer(this.answer, this.isActive, this.weightage, this.image);

  Answer.fromJson(Map<String, dynamic> json) {
    answer = json['answer'];
    isActive = json['isActive'].toString() == "1" ? true : false;
    weightage = json['weightage'].toString();
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['answer'] = this.answer;
    data['isActive'] = this.isActive;
    data['weightage'] = this.weightage;
    data['image'] = this.image;
    return data;
  }
}

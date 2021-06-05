class Task {
  String id;
  String name;
  String description;
  bool isCompleted;

  Task({this.description, this.name, this.isCompleted = false, this.id});

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "description": description,
      "isCompleted": isCompleted
    };
  }

  Task.fromJson(Map<String, dynamic> json)
    : id = json["id"],
    name = json["name"],
    description = json["description"],
    isCompleted = json["isCompleted"];

}

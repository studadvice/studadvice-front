class RequiredDocument {
  late String id;
  late String name;
  late String description;
  String? imageId;
  String? url;

  RequiredDocument(
      {required this.id,
      required this.name,
      required this.description,
      this.imageId,
      this.url});

  RequiredDocument.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    imageId = json['imageId'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['imageId'] = imageId;
    data['url'] = url;
    return data;
  }
}

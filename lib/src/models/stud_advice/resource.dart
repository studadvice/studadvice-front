class Resource {
  late String name;
  late String description;
  String? url;
  String? imageId;

  Resource(
      {
        required this.name,
        required this.description,
        this.imageId,
        this.url
      });

  Resource.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    description = json['description'];
    imageId = json['imageId'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['description'] = description;
    data['imageId'] = imageId;
    data['url'] = url;
    return data;
  }
}

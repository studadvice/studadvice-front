class CustomFile {
  String? filename;
  String? fileContent;
  String? size;

  CustomFile({this.filename, this.fileContent, this.size});

  CustomFile.fromJson(Map<String, dynamic> json) {
    filename = json['filename'];
    fileContent = json['fileContent'];
    size = json['size'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['filename'] = filename;
    data['fileContent'] = fileContent;
    data['size'] = size;
    return data;
  }
}

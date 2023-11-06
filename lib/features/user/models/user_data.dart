class UserData {
  String email;
  String passwordHash;
  String username;
  String city;
  int postalCode;
  DateTime dateOfBirth;
  String university;
  String formation;
  String country;

  UserData({
    required this.email,
    required this.passwordHash,
    required this.username,
    required this.city,
    required this.postalCode,
    required this.dateOfBirth,
    required this.university,
    required this.formation,
    required this.country,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
        email: json['email'] ?? '',
        city: json['city'] ?? '',
        passwordHash: json['passwordHash'] ?? '',
        username: json['username'] ?? '',
        postalCode: json['postalCode'] ?? 99999,
        dateOfBirth:
            DateTime.tryParse(json['dateOfBirth'] ?? '') ?? DateTime.now(),
        university: json['university'] ?? '',
        formation: json['formation'] ?? '',
        country: json['country'] ?? '');
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'passwordHash': passwordHash,
      'username': username,
      'city': city,
      'postalCode': postalCode,
      'dateOfBirth': dateOfBirth.toIso8601String(),
      'university': university,
      'formation': formation,
      'country': country,
    };
  }
}

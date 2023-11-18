class UserData {
  String email;
  String passwordHash;
  String city;
  int postalCode;
  String birthDate;
  String university;
  String formation;
  String country;
  String? pseudo;
  bool hasAcceptedTermsAndConditions;

  UserData({
    this.pseudo,
    required this.email,
    required this.passwordHash,
    required this.city,
    required this.postalCode,
    required this.birthDate,
    required this.university,
    required this.formation,
    required this.country,
    required this.hasAcceptedTermsAndConditions,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
        email: json['email'] ?? '',
        city: json['city'] ?? '',
        passwordHash: json['passwordHash'] ?? '',
        postalCode: json['postalCode'] ?? 99999,
        birthDate: json['dateOfBirth'] ?? '',
        university: json['university'] ?? '',
        formation: json['formation'] ?? '',
        country: json['country'] ?? '',
        hasAcceptedTermsAndConditions:
            json['hasAcceptedTermsAndConditions'] ?? false,
        pseudo: json['pseudo'] ?? '');
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'passwordHash': passwordHash,
      'city': city,
      'postalCode': postalCode,
      'dateOfBirth': birthDate,
      'university': university,
      'formation': formation,
      'country': country,
      'hasAcceptedTermsAndConditions': hasAcceptedTermsAndConditions,
    };
  }
}

class UserData {
  String city;
  int postalCode;
  String birthDate;
  String university;
  String formation;
  String country;
  String pseudo;
  List<String>? favoriteAdministrativeProcesses = [];
  bool hasAcceptedTermsAndConditions;

  UserData({
    required this.pseudo,
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
        city: json['city'] ?? '',
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
      'city': city,
      'postalCode': postalCode,
      'dateOfBirth': birthDate,
      'university': university,
      'formation': formation,
      'country': country,
      'pseudo': pseudo,
      'hasAcceptedTermsAndConditions': hasAcceptedTermsAndConditions,
    };
  }
}

class CityData {
  String? nom;
  String? code;
  String? codeDepartement;
  String? siren;
  String? codeEpci;
  String? codeRegion;
  List<String>? codesPostaux;
  int? population;
  double? dScore;

  CityData(
      {this.nom,
      this.code,
      this.codeDepartement,
      this.siren,
      this.codeEpci,
      this.codeRegion,
      this.codesPostaux,
      this.population,
      this.dScore});

  CityData.fromJson(Map<String, dynamic> json) {
    nom = json['nom'];
    code = json['code'];
    codeDepartement = json['codeDepartement'];
    siren = json['siren'];
    codeEpci = json['codeEpci'];
    codeRegion = json['codeRegion'];
    codesPostaux = json['codesPostaux'].cast<String>();
    population = json['population'];
    dScore = json['_score'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['nom'] = nom;
    data['code'] = code;
    data['codeDepartement'] = codeDepartement;
    data['siren'] = siren;
    data['codeEpci'] = codeEpci;
    data['codeRegion'] = codeRegion;
    data['codesPostaux'] = codesPostaux;
    data['population'] = population;
    data['_score'] = dScore;
    return data;
  }
}

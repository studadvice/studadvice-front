class UniversityResults {
  int? totalCount;
  List<UniversityData>? results;

  UniversityResults({this.totalCount, this.results});

  UniversityResults.fromJson(Map<String, dynamic> json) {
    totalCount = json['total_count'];
    if (json['results'] != null) {
      results = <UniversityData>[];
      json['results'].forEach((v) {
        results!.add(UniversityData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['total_count'] = totalCount;
    if (results != null) {
      data['results'] = results!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class UniversityData {
  String? champRecherche;
  String? uoLib;
  String? depNom;
  String? nomCourt;
  String? uucrNom;

  UniversityData(
      {this.champRecherche,
      this.uoLib,
      this.depNom,
      this.nomCourt,
      this.uucrNom});

  UniversityData.fromJson(Map<String, dynamic> json) {
    champRecherche = json['champ_recherche'];
    uoLib = json['uo_lib'];
    depNom = json['dep_nom'];
    nomCourt = json['nom_court'];
    uucrNom = json['uucr_nom'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['champ_recherche'] = champRecherche;
    data['uo_lib'] = uoLib;
    data['dep_nom'] = depNom;
    data['nom_court'] = nomCourt;
    data['uucr_nom'] = uucrNom;
    return data;
  }

  @override
  String toString() {
    return '$uoLib';
  }
}

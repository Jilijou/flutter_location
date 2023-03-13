import 'typehabitat.dart';

class Habitation {
  int id;
  TypeHabitat typeHabitat;
  String image;
  String libelle;
  String adresse;
  int nbpersonnes;
  int chambres;
  int lits;
  int salleBains;
  int superficie;
  double prixmois;
  List<Option> options;
  List<OptionPayante> optionspayantes;

  Habitation(
      this.id,
      this.typeHabitat,
      this.image,
      this.libelle,
      this.adresse,
      this.nbpersonnes,
      this.chambres,
      this.lits,
      this.salleBains,
      this.superficie,
      this.prixmois,
      {this.options = const [],
      this.optionspayantes = const []});

  Habitation.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        typeHabitat = TypeHabitat.fromJson(json['typehabitat']),
        image = json['image'],
        libelle = json['libelle'],
        adresse = json['adresse'],
        nbpersonnes = json['habitantsmax'],
        chambres = json['chambres'],
        lits = json['lits'],
        salleBains = json['sdb'],
        superficie = json['superficie'],
        prixmois = json['prixmois'],
        options = (json['items'] as List)
            .map((item) => Option.fromJson(item))
            .toList(),
        optionspayantes = (json['optionspayantes'] as List).map((item) {
          return OptionPayante.fromJson({
            'id': item['optionpayante']['id'],
            'libelle': item['optionpayante']['libelle'],
            'description': item['optionpayante']['description'],
            'prix': item['prix']
          });
        }).toList();
}

class Option {
  int id;
  String libelle;
  String description;

  Option(this.id, this.libelle, {this.description = ""});

  Option.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        libelle = json['libelle'],
        description = json['description'];
}

class OptionPayante extends Option {
  double prix;

  OptionPayante(super.id, super.libelle,
      {super.description = "", this.prix = 0});

  OptionPayante.fromJson(Map<String, dynamic> json)
      : prix = json['prix'],
        super.fromJson(json);
}

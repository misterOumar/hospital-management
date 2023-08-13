import 'package:hive/hive.dart';

part 'patients.g.dart';

@HiveType(typeId: 1)
class Person {

  Person({required this.nom, required this.prenom, required this.birthday,required this.age,required this.sexe,required this.sanguin,required this.family,required this.job,required this.email,required this.tel,required this.cel,required this.assurance,required this.adresse,required this.note,required this.ant1,required this.ant2,required this.ant3,required this.ant4});

  @HiveField(0)
  late String nom;

  @HiveField(1)
  late String prenom;
  

  @HiveField(2)
  late String birthday;

  @HiveField(3)
  late String age;

  @HiveField(4)
  late String sexe;

  @HiveField(5)
  late String sanguin;

  @HiveField(6)
  late String family;

  @HiveField(7)
  late String job;

  @HiveField(8)
  late String email;

  @HiveField(9)
  late String tel;

  @HiveField(10)
  late String cel;

  @HiveField(11)
  late String assurance;

  @HiveField(12)
  late String adresse;

  @HiveField(13, defaultValue: "none")
  late String note;

  @HiveField(14, defaultValue: "none")
  late String ant1;

  @HiveField(15, defaultValue: "none")
  late String ant2;

  @HiveField(16, defaultValue: "none")
  late String ant3;

  @HiveField(17, defaultValue: "none")
  late String ant4;

}
import 'package:flutter/material.dart';
import 'package:hospital_dashboard/models/boxes.dart';
import 'package:hospital_dashboard/models/patients.dart';

class AjouterPatient extends StatefulWidget {
  const AjouterPatient({Key? key}) : super(key: key);

  @override
  State<AjouterPatient> createState() => _AjouterPatientState();
}

class _AjouterPatientState extends State<AjouterPatient> {
  int compteur = 0;
  bool etat=false;
  List<Widget> textFieldList = [];
  List<String> headerValue = [
    'Informations Patient',
    'Coordonnées Patient',
    'Antécédents',
  ];
  List<bool> headerListBool = <bool>[];
  Map<String, Map<String, TextEditingController>> listController = {
    "Informations Patient": {
      "N° Dossier": TextEditingController(),
      "Nom": TextEditingController(),
      "Prenom": TextEditingController(),
      "Date de naissance": TextEditingController(),
      "Age": TextEditingController(),
      "Sexe patient": TextEditingController(),
      "Groupe sanguin": TextEditingController(),
      "Situation familiale": TextEditingController(),
      "Profession": TextEditingController(),
    },
    "Coordonnées Patient": {
      "Email": TextEditingController(),
      "Téléphone / Tel": TextEditingController(),
      "Cellulaire / Cel": TextEditingController(),
      "N° Assurance": TextEditingController(),
      "Adresse": TextEditingController(),
      "Note": TextEditingController(),
    },
    "Antécédents": {
      "Antécédents médicaux": TextEditingController(),
      "Antécédents chirurgicaux": TextEditingController(),
      "Antécédents familiale": TextEditingController(),
      "Autres antécédents": TextEditingController(),
    }
  };

  @override
  void initState() {
    headerListBool = List.generate(headerValue.length, (index) => true);
    // listController.forEach((key, value) {
    //    textFieldList.add(CustomTextField(controller: value, label: key, inputType: TextInputType.name));
    // });
    super.initState();
  }

  @override
  Widget build(BuildContext principalContext) {
    return SafeArea(
      child: ListView.builder(
        itemCount: 4,
        itemBuilder: (context, indexListView) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(80, 10, 80, 0),
            child: (indexListView < 3)
                ? Card(
                    color: Colors.black.withOpacity(0.5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    child: SizedBox(
                      width: MediaQuery.of(principalContext).size.width,
                      child: Column(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                            height: (headerListBool[indexListView]) ? 70 : 90,
                            color: Color(0xFF2DAAB8).withOpacity(0.7),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(headerValue[indexListView]),
                                ),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        headerListBool[indexListView] =
                                            !headerListBool[indexListView];
                                      });
                                    },
                                    icon: Icon(Icons.arrow_drop_down_sharp),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: Visibility(
                              visible: headerListBool[indexListView],
                              child: Container(
                                padding:
                                    const EdgeInsets.fromLTRB(20, 8, 20, 20),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(10.0),
                                    bottomRight: Radius.circular(10.0),
                                  ),
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                        "" /* "https://www.celside-magazine.com/app/uploads/2021/02/meilleures-applications-bilan-sante-Celside-Magazine-1024x700.jpg" */),
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      //alignment: Alignment.centerLeft,
                                      //color: Colors.red,
                                      //height: MediaQuery.of(context).size.height,
                                      child: Column(
                                        children: listController[
                                                headerValue[indexListView]]!
                                            .entries
                                            .map((secondKey) {
                                          return Container(
                                            //color: Colors.black.withOpacity(0.5),
                                            child: CustomTextField(
                                              controller: secondKey.value,
                                              label: secondKey.key,
                                              inputType: TextInputType.name,
                                            ),
                                          );
                                        }).toList(),
                                      ),
                                    ),
                                    if (headerValue[indexListView] ==
                                        "Informations Patient")
                                      Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(0, 0, 40, 0),
                                        child: Container(
                                            //alignment: Alignment.centerRight,
                                            //color: Colors.white,
                                            height: 500,
                                            width: 400,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Container(
                                                  height: 150,
                                                  width: 150,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  10.0)),
                                                      image: DecorationImage(
                                                          fit: BoxFit.cover,
                                                          image: AssetImage(
                                                              "" /* "assets/images/client_img.png" */))),
                                                )
                                              ],
                                            )),
                                      ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                : MaterialButton(
                    onPressed: () {
                      for (var key1 in listController.entries) {
                        for (var data1 in key1.value.entries) {
                          print(data1.value.text);
                          print(data1.key);
                        }
                      }
                      setState(() {

                        boxPersonnes.put(
                            'key_${listController["Informations Patient"]!["Nom"]!.text}',
                            Person(
                                nom: listController["Informations Patient"]!["Nom"]!
                                    .text,
                                prenom: listController["Informations Patient"]!["Prenom"]!
                                    .text,
                                birthday: listController["Informations Patient"]![
                                        "Date de naissance"]!
                                    .text,
                                age: listController["Informations Patient"]!["Age"]!
                                    .text,
                                sexe: listController["Informations Patient"]![
                                        "Sexe patient"]!
                                    .text,
                                sanguin:
                                    listController["Informations Patient"]![
                                            "Groupe sanguin"]!
                                        .text,
                                family: listController["Informations Patient"]![
                                        "Situation familiale"]!
                                    .text,
                                job: listController["Informations Patient"]!["Profession"]!.text,
                                email: listController["Coordonnées Patient"]!["Email"]!.text,
                                tel: listController["Coordonnées Patient"]!["Téléphone / Tel"]!.text,
                                cel: listController["Coordonnées Patient"]!["Cellulaire / Cel"]!.text,
                                assurance: listController["Coordonnées Patient"]!["N° Assurance"]!.text,
                                adresse: listController["Coordonnées Patient"]!["Adresse"]!.text,
                                note: listController["Coordonnées Patient"]!["Note"]!.text,
                                ant1:  listController["Antécédents"]!["Antécédents médicaux"]!.text,
                                ant2:  listController["Antécédents"]!["Antécédents chirurgicaux"]!.text,
                                ant3:  listController["Antécédents"]!["Antécédents familiale"]!.text,
                                ant4:  listController["Antécédents"]!["Autres antécédents"]!.text,));
                      });
                      print("taille de notre bd : ${boxPersonnes.length}");

                    },
                    child: Text("Valider")),


          );
        },
      ),
    );
  }
}

//https://static.vecteezy.com/ti/vecteur-libre/p3/23225439-vecteur-illustration-de-femelle-medecin-a-la-recherche-os-x-rayon-rapport-pour-une-patient-mensonge-avec-fracture-jambe-sur-lit-dans-hopital-chambre-vectoriel.jpg
class CustomTextField extends StatefulWidget {
  const CustomTextField(
      {Key? key,
      required this.controller,
      required this.label,
      required this.inputType})
      : super(key: key);

  final TextEditingController controller;
  final String label;
  final TextInputType inputType;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool onTapTextField = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(40, 10, 40, 0),
      child: Container(
        width: 450,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.8),
          borderRadius: BorderRadius.all(
            Radius.circular(5.0),
          ),
        ),
        child: TextField(
          key: UniqueKey(),
          keyboardType: widget.inputType,
          style: const TextStyle(
            color: Colors.black,
          ),
          controller: widget.controller,
          cursorColor: Colors.black,
          decoration: InputDecoration(
            hintText: widget.label,
            hintStyle: TextStyle(
                color: Colors.black.withOpacity(0.7),
                fontWeight: FontWeight.bold),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.white,
                width: 0.5,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.black,
                width: 1.0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

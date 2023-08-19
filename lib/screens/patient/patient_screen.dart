import 'package:flutter/material.dart';
import 'package:hospital_dashboard/models/boxes.dart';
import 'package:hospital_dashboard/models/patients.dart';
import 'package:hospital_dashboard/screens/dashboard/components/custom_search_bar.dart';
import 'package:hospital_dashboard/screens/dashboard/components/header.dart';

class PatientScreen extends StatefulWidget {
  @override
  _PatientScreenState createState() => _PatientScreenState();
}

class _PatientScreenState extends State<PatientScreen> {
  TextStyle transparent = TextStyle(color: Colors.transparent);
  TextStyle tableHeader = TextStyle(fontWeight: FontWeight.bold, fontSize: 16);
  late TextEditingController patientScreenController;
  List<Row> tableRows = [];
  List<Row> tempRows = [];
  String searchValue = "";

  int hoveredRowIndex = -1;
  List<DataCell> dataCell = [];
  Map<int, List<String>> banqueDeDonnee = {};
  List<String> identifiants = <String>[
    'Identifiant',
    'Nom',
    'Prenom',
    'Birthday',
    'Age',
    'Sexe',
    'Groupe sanguin',
    'Profession',
    'Contact',
    'Action',
  ];

  @override
  void initState() {
    patientScreenController = TextEditingController();

    for (var index = 0; index < boxPersonnes.length; index++) {
      setState(() {
        banqueDeDonnee[index] = obtenirDonnee(index);
      });
    }

    super.initState();
  }

  @override
  void dispose() {
    patientScreenController.clear();
    patientScreenController.dispose();
    super.dispose();
  }

  List<String> obtenirDonnee(int index) {
    List<String> data = [];

    Person person = boxPersonnes.getAt(index);

    data = [
      index.toString(),
      person.nom.toString(),
      person.prenom.toString(),
      person.birthday.toString(),
      person.age.toString(),
      person.sexe.toString(),
      person.sanguin.toString(),
      person.job.toString(),
      person.tel.toString(),
      person.cel.toString(),
    ];

    return data;
  }

  Color getDataRowColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };

    if (states.any(interactiveStates.contains)) {
      return const Color.fromARGB(255, 238, 238, 238);
    }
    return Colors.transparent;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: customPatientSearchBar(Header(
          controller: patientScreenController,
        )),
        preferredSize: Size.fromHeight(120),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 5),
        child: Card(
          elevation: 5.0,
          margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
          color: Colors.white,
          child: SizedBox(
            height: MediaQuery.of(context).size.height - 60,
            width: MediaQuery.of(context).size.width,
            child: Stack(
              children: [
                if (patientScreenController.text.isEmpty)
                  Expanded(
                    child: ListView(
                      padding: const EdgeInsets.all(0.0),
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                          child: DataTableTheme(
                            data: DataTableThemeData(
                              dataRowMaxHeight: 65,
                              horizontalMargin: 0.0,
                            ),
                            child: DataTable(
                              columnSpacing: 0,
                              dataRowColor: MaterialStateProperty.resolveWith(getDataRowColor),
                              headingRowColor: MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
                                if (states.contains(MaterialState.hovered)) {
                                  return Color.fromARGB(255, 45, 170, 184);
                                }
                                return Color.fromARGB(255, 45, 170, 184); // Use the default value.
                              }),
                              columns: List.generate(
                                identifiants.length,
                                (indexDataColumn) {
                                  return DataColumn(
                                    label: Container(
                                      width: 120,
                                      height: MediaQuery.of(context).size.height,
                                      child: Center(
                                        child: Text(identifiants[indexDataColumn]),
                                      ),
                                    ),
                                    numeric: false,
                                  );
                                },
                              ),
                              rows: banqueDeDonnee.entries.map((entry){
                                int dataKey = entry.key;
                                List<String> dataValues = entry.value;

                                return DataRow(
                                  cells: List.generate(
                                      dataValues.length,
                                      (indexCells) {
                                        if (indexCells == identifiants.length - 1) {
                                          return DataCell(
                                            Center(
                                              child: SizedBox(
                                                width: 120,
                                                height: MediaQuery.of(context).size.height,
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: <Widget>[
                                                    Padding(
                                                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                                      child: IconButton(
                                                        onPressed: () {
                                                          //Person removeValue = boxPersonnes.getAt(dataKey);
                                                           setState(() {
                                                            banqueDeDonnee.remove(dataKey);
                                                            boxPersonnes.deleteAt(dataKey);
                                                          });
                                                        },
                                                        icon: Icon(Icons.delete),
                                                        splashRadius: 20,
                                                        color: Color(0xFF2DAAB8),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                                      child: IconButton(
                                                        onPressed: () {
                                                         
                                                        },
                                                        icon: Icon(Icons.edit),
                                                        splashRadius: 20,
                                                        color: Color(0xFF2DAAB8),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          );
                                        } else {
                                          return DataCell(
                                            SizedBox(
                                              width: 120,
                                              height: MediaQuery.of(context).size.height,
                                              child: Center(
                                                child: Padding(
                                                  padding: const EdgeInsets.fromLTRB(10, 0, 5, 0),
                                                  child: Text(
                                                    dataValues[indexCells],
                                                    maxLines: 1,
                                                    overflow: TextOverflow.ellipsis,
                                                    softWrap: true,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          );
                                        }
                                      },
                                    ),
                                  onLongPress: (){},
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                if (patientScreenController.text.isNotEmpty)
                  ListView.builder(
                    itemCount: tableRows.length,
                    itemBuilder: (context, indexDataRow) {
                      return InkWell(
                        onTap: () {},
                        //onHover: (_) => _onHover(indexDataRow),
                        child: Container(
                          height: 70,
                          padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                          decoration: UnderlineTabIndicator(borderSide: BorderSide(width: 1, color: Color.fromARGB(255, 238, 238, 238))),
                          child: tableRows[indexDataRow],
                        ),
                      );
                    },
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}



                                     
                                        
                                      

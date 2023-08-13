import 'package:flutter/material.dart';

class ShowProfile extends StatefulWidget {
  const ShowProfile({Key? key, required this.name}) : super(key: key);

  final String name;
  @override
  State<ShowProfile> createState() => _ShowProfileState();
}

class _ShowProfileState extends State<ShowProfile> {
  TextStyle transparent = TextStyle(color: Colors.transparent);
  TextStyle tableHeader = TextStyle(fontWeight: FontWeight.bold, fontSize: 16);
  late TextEditingController consultationScreenController;
  List<Row> tableRows = [];
  List<Row> tempRows = [];
  String searchValue = "";

  int hoveredRowIndex = -1;

  List<String> valueCrudButton = <String>[
    'Ajouter',
    'Supprimer',
    'Modifier',
  ];

  List<String> identifiants = <String>[
    'Details',
    'Date     : ',
    'Motif',
    'Montant',
    'Versement',
    'Reste',
    'Action',
  ];

  List<String> constantesVitales = [
    'Poids (Kg)',
    'La taille (Cm)',
    'Température (C°)',
    'Fréquence cardiaque',
    'Glycemie (g/l)',
    'Pression artérielle',
    'Observation',
  ];

  List<String> constantesVitalesValue = [
    '65',
    '170',
    '37',
    '72',
    '1.4',
    '8/12',
    'noté',
  ];

  @override
  void initState() {
    consultationScreenController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    consultationScreenController.clear();
    consultationScreenController.dispose();
    super.dispose();
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
        child: Container(
          color: Colors.white,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
               Flexible(
                        flex: 5,
                        child: Container(
                          height: MediaQuery.of(context).size.height,
                          width: MediaQuery.of(context).size.width,
                          color: Colors.blue[100],
                          child: Row(
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.amber,
                                    borderRadius: BorderRadius.all( Radius.circular(10.0),),
                                  ),
                                  height: MediaQuery.of(context).size.height,
                                  width: 100,
                                  margin: EdgeInsets.only(left: 15, top: 6, bottom: 6),
                                  child: MaterialButton(
                                    onPressed: (){
                                      Navigator.pop(context);
                                    },
                                    elevation: 0.0,
                                    child: Row(
                                      children: [
                                        Icon(Icons.arrow_back_ios_new),
                                        SizedBox(width: 5,),
                                        Text("Retour"),
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ),
                      Flexible(
                        flex: 5,
                        child: Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Flexible(
                                flex: 7,
                                child: Container(
                                  child: Row(
                                    children: [
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Container(
                                          margin: EdgeInsets.only(left: 15),
                                          width: MediaQuery.of(context).size.width / 3,
                                          decoration: BoxDecoration(
                                            color: Colors.grey[200],
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(10.0),
                                              bottomLeft: Radius.circular(10.0),
                                            ),
                                          ),
                                          child: TextFieldTapRegion(
                                            child: TextField(
                                              decoration: InputDecoration(
                                                hintText: "Search",
                                                contentPadding: EdgeInsets.only(left: 10),
                                                border: InputBorder.none,
                                              ),
                                            ),

                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Container(
                                          margin: EdgeInsets.only(top: 6, bottom: 6),
                                          child: MaterialButton(
                                            onPressed: (){},
                                            elevation: 0.0,
                                            color: Colors.blue[400],
                                            height: MediaQuery.of(context).size.height,
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(10.0),
                                              bottomRight: Radius.circular(10.0),
                                            ),
                                            ),
                                            child: Text("Valider"),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.centerRight,
                                child: Flexible(
                                  flex: 3,
                                  child: Container(
                                    child: Row(
                                      children: List.generate(3, (indexMaterialButton){
                                return Container(
                                  margin: EdgeInsets.all(6.0),
                                  decoration: BoxDecoration(
                                    color: Colors.blue[400],
                                    borderRadius: BorderRadius.all(Radius.circular(10.0),),
                              
                                  ),
                                  height: MediaQuery.of(context).size.height,
                                  width: MediaQuery.of(context).size.width / 15,
                                  child: MaterialButton(
                                    onPressed: (){},
                                    child: Text(valueCrudButton[indexMaterialButton]),
                                  ),
                                );
                                                          },),
                                    ),
                              
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
            ],
          ),
        ),
        preferredSize: Size.fromHeight(120),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 5),
        // Notre grande Row qui nous permet de faire s'afficher nos deux elements
        child: Row(
          children: [
            Flexible(
              flex: 30,
              child: Column(
                children: [
                  Row(
                    children: [
                      Flexible(
                        flex: 10,
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 60,
                          color: Colors.blue[400],
                          child: Center(
                            child: Text(widget.name),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        flex: 10,
                        child: Card(
                          elevation: 5.0,
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                          color: Colors.white,
                          child: SizedBox(
                            height: MediaQuery.of(context).size.height - 210,
                            //width:  MediaQuery.of(context).size.width,
                            //width: 1200,
                            child: Stack(
                              children: [
                                if (consultationScreenController.text.isEmpty)
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
                                            ),
                                            child: DataTable(
                                              dataRowColor: MaterialStateProperty.resolveWith(getDataRowColor),
                                              headingRowColor: MaterialStateProperty.resolveWith<Color?>(
                                                  (Set<MaterialState> states) {
                                                if (states.contains(MaterialState.hovered)) {
                                                  return Color.fromARGB(255, 45, 170, 184);
                                                }
                                                return Color.fromARGB(255, 45, 170, 184);
                                              }),
                                              columns: List.generate(
                                                identifiants.length,
                                                (indexDataColumn) {
                                                  return DataColumn(
                                                    label: Flexible(
                                                      flex: 2,
                                                      child: Container(
                                                        //width: 100, //200
                                                        //color: Colors.green,
                                                        height: MediaQuery.of(context).size.height,
                                                        child: Center(
                                                          child: Text(identifiants[indexDataColumn], style: TextStyle(fontWeight: FontWeight.bold),),
                                                        ),
                                                      ),
                                                    ),
                                                    numeric: false,
                                                  );
                                                },
                                              ),
                                              rows: List.generate(
                                                10,
                                                (indexDataRows) {
                                                  return DataRow(
                                                    cells: List.generate(
                                                      identifiants.length,
                                                      (indexCells) {
                                                        if (indexCells == identifiants.length - 1) {
                                                          return DataCell(
                                                            Center(
                                                              child: SizedBox(
                                                                //width:  120, //120,
                                                                height: MediaQuery.of(context).size.height,
                                                                child: Row(
                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                  children: <Widget>[
                                                                    Padding(
                                                                      padding:
                                                                          const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                                                      child: IconButton(
                                                                        onPressed: () {},
                                                                        icon: Icon(Icons.delete),
                                                                        splashRadius: 20,
                                                                        color: Color(0xFF2DAAB8),
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding:
                                                                          const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                                                      child: IconButton(
                                                                        onPressed: () {},
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
                                                        } else if (indexCells == 0) {
                                                          return DataCell(
                                                            Padding(
                                                              padding: const EdgeInsets.all(8.0),
                                                              child: SizedBox(
                                                                  width: 100,
                                                                  height: MediaQuery.of(context).size.height,
                                                                  child: MaterialButton(
                                                                    
                                                                    onPressed: () {},
                                                                    color: Colors.blue[400],
                                                                    child: Row(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment.spaceBetween,
                                                                      mainAxisSize: MainAxisSize.max,
                                                                      children: [
                                                                        Text(
                                                                          "Details",
                                                                          style: TextStyle(color: Colors.white),
                                                                        ),
                                                                        Icon(
                                                                          Icons.info_outline_rounded,
                                                                          color: Colors.white,
                                                                        )
                                                                      ],
                                                                    ),
                                                                  )),
                                                            ),
                                                          );
                                                        } else {
                                                          return DataCell(
                                                            SizedBox(
                                                              //width:  120,
                                                              height: MediaQuery.of(context).size.height,
                                                              child: Center(
                                                                child: Padding(
                                                                  padding: const EdgeInsets.fromLTRB(10, 0, 5, 0),
                                                                  child: Text(
                                                                    "Pierrot $indexDataRows",
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
                                                    onLongPress: () {},
                                                  );
                                                },
                                              ),
                                            ),
                                          ),
                                        ),

                                        //),
                                      ],
                                    ),
                                  ),
                                if (consultationScreenController.text.isNotEmpty)
                                  ListView.builder(
                                    itemCount: tableRows.length,
                                    itemBuilder: (context, indexDataRow) {
                                      return InkWell(
                                        onTap: () {},
                                        //onHover: (_) => _onHover(indexDataRow),
                                        child: Container(
                                          height: 70,
                                          padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                          decoration: UnderlineTabIndicator(
                                              borderSide:
                                                  BorderSide(width: 1, color: Color.fromARGB(255, 238, 238, 238))),
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
                    ],
                  ),
                ],
              ),
            ),
            Flexible(
              flex: 10,
              child: Card(
                elevation: 0.0,
                color: Colors.white,
                margin: const EdgeInsets.only(left: 10.0, bottom: 0),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: <Widget>[
                      Flexible(
                        flex: 2,
                        child: Card(
                          color: Colors.blue[400],
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  Container(
                                    color: Colors.transparent,
                                    margin: const EdgeInsets.only(right: 15, top: 15),
                                    child: Center(
                                      child: Image.asset(
                                        "assets/images/client_img.png",
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Flexible(
                        flex: 10,
                        child: Card(
                          color: Colors.grey[300],
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Flexible(
                                  flex: 1,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 0),
                                    child: VerticalDivider(
                                      color: Colors.blue[400],
                                      thickness: 8,
                                    ),
                                  ),
                                ),
                                Flexible(
                                  flex: 7,
                                  child: ListView(
                                    children: List.generate(constantesVitales.length, (indexConstantesVitales) {
                                      if (indexConstantesVitales == constantesVitales.length - 1) {
                                        return Padding(
                                          padding: const EdgeInsets.fromLTRB(10, 10, 0, 10),
                                          child: Wrap(
                                            direction: Axis.horizontal,
                                            children: [
                                              Flexible(
                                                flex: 1,
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding: const EdgeInsets.only(left: 10, top: 30),
                                                      child: Text(
                                                        constantesVitales[6],
                                                        style: TextStyle(fontWeight: FontWeight.bold),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                              Expanded(
                                                flex: 1,
                                                child: Container(
                                                  margin: EdgeInsets.only(left: 10, top: 15),
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius: BorderRadius.all(
                                                      Radius.circular(5.0),
                                                    ),
                                                  ),
                                                  child: TextField(
                                                    //expands: true,
                                                    maxLines: 9,
                                                    textInputAction: TextInputAction.newline,
                                                    decoration: InputDecoration(
                                                      border: InputBorder.none,
                                                      contentPadding: EdgeInsets.only(left: 8, top: 8),
                                                      hintText: constantesVitalesValue[indexConstantesVitales],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      } else {
                                        return Padding(
                                          padding: const EdgeInsets.fromLTRB(10, 10, 0, 10),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            mainAxisSize: MainAxisSize.max,
                                            children: <Flexible>[
                                              Flexible(
                                                flex: 1,
                                                child: Align(
                                                  alignment: Alignment.centerLeft,
                                                  child: Padding(
                                                    padding: const EdgeInsets.only(left: 10.0),
                                                    child: Text(
                                                      constantesVitales[indexConstantesVitales],
                                                      style: TextStyle(
                                                          fontWeight: FontWeight.bold,
                                                          color: const Color.fromARGB(255, 33, 33, 33)
                                                              .withOpacity(0.7),),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Flexible(
                                                flex: 1,
                                                child: Align(
                                                  alignment: Alignment.centerRight,
                                                  child: Container(
                                                    width: 100,
                                                    height: 40,
                                                    color: Colors.white,
                                                    child: TextField(
                                                      cursorColor: Colors.blue[400],
                                                      decoration: InputDecoration(
                                                        contentPadding: (indexConstantesVitales < 2) ? EdgeInsets.only(left: 60, right: 8) : EdgeInsets.only(left: 8),
                                                        border: InputBorder.none,
                                                        hintText: constantesVitalesValue[indexConstantesVitales],
                                                       
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      }
                                    }),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class RandomTextField extends StatelessWidget {
  const RandomTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

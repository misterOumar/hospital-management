import 'package:flutter/material.dart';

class Consultation extends StatefulWidget {
  const Consultation({Key? key}) : super(key: key);

  @override
  State<Consultation> createState() => _ConsultationState();
}

class _ConsultationState extends State<Consultation> with TickerProviderStateMixin {
  late TabController _tabController;
  bool boolAddPatient = false;

  List<String> formGroup = [
    'Antécédents',
    'Constantes Vitales',
    'Resultat',
  ];

  List<String> constantesVitales = [
    'Poids (Kg)',
    'La taille (Cm)',
    'Température (C°)',
    'Fréquence cardiaque',
    'Glycemie (g/l)',
    'Pression artérielle',
  ];

  List<String> crudButtonAction = [
    'Ajouter',
    'Modifier',
    'Supprimer',
    'Imprimer',
  ];

  List<IconData> crudIconButton = [
    Icons.add,
    Icons.edit,
    Icons.delete,
    Icons.print,
  ];

  List<Color?> crudButtonColor = [
    Colors.green,
    Colors.blueGrey,
    Colors.red,
    Colors.blueGrey.withOpacity(0.7),
  ];

  List<IconData> tabBarIconValue = [
    Icons.info,
    Icons.info,
    Icons.info,
    Icons.monitor_heart,
    Icons.folder,
    Icons.assignment,
    Icons.info,
    Icons.credit_card,
  ];

  List<String> tabBarContentValue = [
    'Infos',
    'Consultations',
    'Bilans',
    'Radiologie',
    'Fichiers',
    'Ordonnances',
    'Rendez-vous',
    'Payments',
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

  List<String> textFieldTitleVlaue = [
    'Antéccédents Médicaux',
    'Antéccédents Chirurgicaux',
    'Antéccédents Familiales',
    'Autres Antéccédents',
  ];

  List<TextEditingController> textFieldController = List.generate(4, (index) => TextEditingController());

  @override
  void initState() {
    _tabController = TabController(length: 8, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
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
                          height: 80,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10.0),
                              bottomRight: Radius.circular(10.0),
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: Container(
                                        //width: MediaQuery.of(context).size.width,
                                        //height: 50,
                                        decoration: BoxDecoration(
                                          color: Color.fromARGB(255, 45, 170, 184),
                                          borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(10.0),
                                            bottomRight: Radius.circular(10.0),
                                          ),
                                        ),
                                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                                        child: TabBar(
                                          physics: const ScrollPhysics(),
                                          indicatorColor: Colors.amber[200],
                                          indicatorSize: TabBarIndicatorSize.tab,
                                          indicatorWeight: 3.0,
                                          isScrollable: true,
                                          labelPadding: EdgeInsets.only(left: 40, right: 40),
                                          controller: _tabController,
                                          tabs: List.generate(tabBarContentValue.length, (indexTabBar) {
                                            return Tab(
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Icon(tabBarIconValue[indexTabBar]),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  Text(tabBarContentValue[indexTabBar]),
                                                ],
                                              ),
                                            );
                                          }),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
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
                            height: MediaQuery.of(context).size.height - 110, //110,
                            child: Column(
                              children: [
                                Expanded(
                                  child: TabBarView(
                                    controller: _tabController,
                                    physics: const ScrollPhysics(),
                                    children: [
                                      Center(
                                        child: Text("Infos"),
                                      ),
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Flexible(
                                            flex: 2,
                                            child: Container(
                                              color: Colors.white,
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.end,
                                                children: List.generate(4, (indexActionButtonRow) {
                                                  return Padding(
                                                    padding: const EdgeInsets.all(5.0),
                                                    child: SizedBox(
                                                      height: MediaQuery.of(context).size.height,
                                                      width: 110,
                                                      child: MaterialButton(
                                                        onPressed: (crudButtonAction[indexActionButtonRow] == "Ajouter")
                                                            ? () {
                                                                //showAddFormConsultation
                                                                setState(() {
                                                                  boolAddPatient = !boolAddPatient;

                                                                });
                                                              }
                                                            : () {
                                                                
                                                              },
                                                        color: crudButtonColor[indexActionButtonRow],
                                                        shape: RoundedRectangleBorder(
                                                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                                        ),
                                                        child: Row(
                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                          children: [
                                                            Text(
                                                              crudButtonAction[indexActionButtonRow],
                                                              style: TextStyle(color: Colors.white.withOpacity(0.8)),
                                                            ),
                                                            Icon(crudIconButton[indexActionButtonRow], color: Colors.white.withOpacity(0.8)),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                }),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 20,
                                            child: (boolAddPatient == false)
                                                ? Container(
                                                    width: MediaQuery.of(context).size.width,
                                                    height: MediaQuery.of(context).size.height,
                                                    padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                                    child: SingleChildScrollView(
                                                      child: DataTableTheme(
                                                        data: DataTableThemeData(
                                                          dataRowMaxHeight: 65,
                                                        ),
                                                        child: DataTable(
                                                          dataRowColor: MaterialStateProperty.resolveWith(getDataRowColor),
                                                          headingRowColor: MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
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
                                                                    height: MediaQuery.of(context).size.height,
                                                                    child: Center(
                                                                      child: Text(
                                                                        identifiants[indexDataColumn],
                                                                        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white.withOpacity(0.8)),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                numeric: false,
                                                              );
                                                            },
                                                          ),
                                                          rows: List.generate(
                                                            20,
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
                                                                                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                                                                  child: IconButton(
                                                                                    onPressed: () {},
                                                                                    icon: Icon(Icons.delete),
                                                                                    splashRadius: 20,
                                                                                    color: Color(0xFF2DAAB8),
                                                                                  ),
                                                                                ),
                                                                                Padding(
                                                                                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
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
                                                  )
                                                : Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: List.generate(3, (indexDialog) {
                                                      return Flexible(
                                                        flex: 1,
                                                        child: Container(
                                                          height: MediaQuery.of(context).size.height,
                                                          width: MediaQuery.of(context).size.width / 3,
                                                          color: Colors.white,
                                                          child: Padding(
                                                            padding: const EdgeInsets.only(left: 25),
                                                            child: Column(
                                                              mainAxisSize: MainAxisSize.min,
                                                              children: [
                                                                Flexible(
                                                                  flex: 1,
                                                                  child: Row(
                                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                                    mainAxisSize: MainAxisSize.max,
                                                                    children: [
                                                                      Container(
                                                                        height: 40,
                                                                        width: 150,
                                                                        margin: const EdgeInsets.only(bottom: 0, top: 10),
                                                                        decoration: BoxDecoration(
                                                                          color: Colors.blue[400],
                                                                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                                                                        ),
                                                                        child: Center(
                                                                            child: Text(
                                                                          formGroup[indexDialog],
                                                                          style: TextStyle(color: Colors.white),
                                                                        )),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                Flexible(
                                                                  flex: 8,
                                                                  child: Row(
                                                                    mainAxisSize: MainAxisSize.min,
                                                                    children: [
                                                                      Flexible(
                                                                        flex: 1,
                                                                        child: Column(
                                                                          children: [
                                                                            Flexible(
                                                                              flex: 10,
                                                                              child: Container(
                                                                                width: 8,
                                                                                decoration: BoxDecoration(
                                                                                  borderRadius: BorderRadius.all(
                                                                                    Radius.circular(10.0),
                                                                                  ),
                                                                                ),
                                                                                child: VerticalDivider(
                                                                                  color: Color(0xFF2DAAB8),
                                                                                  thickness: 8,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                      if (indexDialog == 0)
                                                                        Expanded(
                                                                          flex: 10,
                                                                          child: ListView(
                                                                            children: List.generate(textFieldTitleVlaue.length, (indexListView) {
                                                                              return Padding(
                                                                                padding: const EdgeInsets.only(left: 25, right: 25),
                                                                                child: Container(
                                                                                  child: Column(
                                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                                    children: [
                                                                                      Padding(
                                                                                        padding: const EdgeInsets.only(top: 10, bottom: 10, left: 5),
                                                                                        child: Align(
                                                                                            alignment: Alignment.centerLeft,
                                                                                            child: Text(textFieldTitleVlaue[indexListView])),
                                                                                      ),
                                                                                      Container(
                                                                                        decoration: BoxDecoration(
                                                                                          color: Colors.grey[300],
                                                                                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                                                                                        ),
                                                                                        child: TextField(
                                                                                          maxLines: 4,
                                                                                          decoration: InputDecoration(
                                                                                            border: InputBorder.none,
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              );
                                                                            }),
                                                                          ),
                                                                        ),
                                                                      if (indexDialog == 1)
                                                                        Expanded(
                                                                          flex: 10,
                                                                          child: ListView(
                                                                            children: List.generate(constantesVitales.length, (indexConstantesVitales) {
                                                                              
                                                                              if (indexConstantesVitales != constantesVitales.length - 1){
                                                                                return Padding(
                                                                                padding: const EdgeInsets.only(left: 25),
                                                                                child: Column(
                                                                                  mainAxisSize: MainAxisSize.min,
                                                                                  children: [
                                                                                    Flexible(
                                                                                      flex: 1,
                                                                                      child: Container(
                                                                                        color: Colors.white,
                                                                                        //width: MediaQuery.of(context).size.width,
                                                                                        padding: const EdgeInsets.only(left: 10, top: 2),
                                                                                        height: MediaQuery.of(context).size.height / (constantesVitales.length * 2),
                                                                                        child: Row(
                                                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                                                          children: [
                                                                                            Flexible(
                                                                                              flex: 1,
                                                                                              child: Align(
                                                                                                alignment: Alignment.centerLeft,
                                                                                                child: Text(
                                                                                                  constantesVitales[indexConstantesVitales],
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                            Flexible(
                                                                                              flex: 1,
                                                                                              child: Align(
                                                                                                alignment: Alignment.centerRight,
                                                                                                child: Container(
                                                                                                  width: 100,
                                                                                                  height: 50,
                                                                                                  color: Colors.grey[300],
                                                                                                  margin: const EdgeInsets.only(right: 10, top: 10),
                                                                                                  child: TextField(
                                                                                                    
                                                                                                    decoration: InputDecoration(
                                                                                                      contentPadding: EdgeInsets.only(
                                                                                                        left: 8,
                                                                                                      ),
                                                                                                      border: InputBorder.none,
                                                                                                    ),
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
                                                                              );
                                                                              }

                                                                              else {
                                                                                return Padding(
                                                                                padding: const EdgeInsets.only(left: 30, right: 25, top: 35),
                                                                                child: Container(
                                                                                  child: Column(
                                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                                    children: [
                                                                                      Padding(
                                                                                        padding: const EdgeInsets.only(top: 10, bottom: 10, left: 5),
                                                                                        child: Align(
                                                                                            alignment: Alignment.centerLeft,
                                                                                            child: Text("Commentaires")),
                                                                                      ),
                                                                                      Container(
                                                                                        decoration: BoxDecoration(
                                                                                          color: Colors.grey[300],
                                                                                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                                                                                        ),
                                                                                        child: TextField(
                                                                                          maxLines: 6,
                                                                                          decoration: InputDecoration(
                                                                                            border: InputBorder.none,
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              );
                                                                              }
                                                                            }),
                                                                          ),
                                                                        ),

                                                                        if (indexDialog == 2)
                                                                          Expanded(
                                                                            flex: 10,
                                                                                  child: ListView(
                                                                                    children: [
                                                                                      Container(
                                                                                        margin: const EdgeInsets.only(top: 10, left: 12),
                                                                                        decoration: BoxDecoration(
                                                                                          color: Colors.grey[300],
                                                                                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                                                                                        ),
                                                                                        child: TextField(
                                                                                          maxLines: 22,
                                                                                          decoration: InputDecoration(
                                                                                            border: InputBorder.none,
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                      Padding(
                                                                                        padding: const EdgeInsets.only(top: 10, bottom: 10, left: 5),
                                                                                        child: Row(
                                                                                          mainAxisSize: MainAxisSize.min,
                                                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                          children: List.generate(3, (indexValidationAction){
                                                                                            return Flexible(
                                                                                              flex: 1,
                                                                                              child: SizedBox(
                                                                                                width: 115,
                                                                                                child: MaterialButton(
                                                                                                  color: Colors.blue[300],
                                                                                                  height: 55,
                                                                                                  elevation: 0.0,
                                                                                                  //padding: (indexValidationAction == 0) ? null : EdgeInsets.only(left: 5),
                                                                                                  shape: RoundedRectangleBorder(
                                                                                                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                                                                                  ),
                                                                                                  minWidth: MediaQuery.of(context).size.width,
                                                                                                  onPressed: (){},
                                                                                                  child: Text("data $indexValidationAction"),
                                                                                                ),
                                                                                              ),
                                                                                            );
                                                                                          },),
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    }),
                                                  ),
                                          ),
                                        ],
                                      ),
                                      Center(
                                        child: Text("Bilan"),
                                      ),
                                      Center(
                                        child: Text("Radiologies"),
                                      ),
                                      Center(
                                        child: Text("Fichiers"),
                                      ),
                                      Center(
                                        child: Text("Ordonnances"),
                                      ),
                                      Center(
                                        child: Text("Rendez-vous"),
                                      ),
                                      Center(
                                        child: Text("Payments"),
                                      ),
                                    ],
                                  ),
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
          ],
        ),
      ),
    );
  }

  Future<void> showAddFormConsultation() {
    return showDialog(
        context: context,
        builder: (BuildContext contextDialog) {
          return Padding(
            padding: const EdgeInsets.all(30),
            child: Dialog.fullscreen(
              backgroundColor: Colors.transparent,
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(20.0))),
                child: Row(
                  //mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(3, (indexDialog) {
                    return Flexible(
                      flex: 1,
                      child: Container(
                        height: MediaQuery.of(contextDialog).size.height,
                        width: MediaQuery.of(contextDialog).size.width / 3,
                        color: Colors.green[300],
                        child: ListView(
                          children: List.generate(textFieldTitleVlaue.length, (indexListView) {
                            return Padding(
                              padding: const EdgeInsets.only(left: 30, right: 30),
                              child: Container(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 10, bottom: 10, left: 5),
                                      child: Align(alignment: Alignment.centerLeft, child: Text(textFieldTitleVlaue[indexListView])),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                                      ),
                                      child: TextField(
                                        maxLines: 4,
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }),
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ),
          );
        });
  }
}

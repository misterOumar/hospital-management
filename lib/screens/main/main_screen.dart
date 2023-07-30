import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hospital_dashboard/screens/dashboard/dashboard_screen.dart';
import 'package:hospital_dashboard/constants.dart';
import 'package:hospital_dashboard/screens/patient/ajouter_patient.dart';
import 'package:hospital_dashboard/screens/patient/all_patient.dart';
import 'package:hospital_dashboard/screens/patient/patient_screen.dart';

import '../../responsive.dart';

class MainScreen extends StatefulWidget {
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentPage = 0;

  List<Widget> listScreen = <Widget>[
    DashboardScreen(),
    Center(
      child: Text("Ajouter patient"),
    ),
    AjouterPatient(),
    PatientScreen(),
    AllPatient(),
    Center(
      child: Text("Consultation"),
    ),
    Center(
      child: Text("Salle d'attente"),
    ),
    Center(
      child: Text("Documents"),
    ),
    Center(
      child: Text("Planing"),
    ),
    Center(
      child: Text("Finance"),
    ),
    Center(
      child: Text("Statistique"),
    ),
    Center(
      child: Text("Note"),
    ),
    Center(
      child: Text("Parametre"),
    ),
   Center(
      child: Text("Aide"),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //key: context.read<MenuController>().scaffoldKey,
      drawer: sideBar(),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Responsivité pour desktop
            if (Responsive.isDesktop(context))
              Expanded(
                // default flex = 1
                // la sideBar prend 1/6 de notre ecran
                child: sideBar(),
              ),
            Expanded(
              // Le contenu principal en prend 5/6
              flex: 5,
              child: listScreen[currentPage],
            ),
          ],
        ),
      ),
    );
  }

  Drawer sideBar() {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: Image.asset("assets/images/logo.png"),
          ),
          buildMainTab("Tableau de bord", "assets/icons/menu_dashbord.svg", 0),
          buildMainTabWithSubTabs("Patient", "assets/icons/page.svg", 1, [
            "Ajouter patient",
            "Patient en attente",
            "Liste des patients",
          ]),
          buildMainTab("Consultation", "assets/icons/application.svg", 5),
          buildMainTab("Salle d'attente", "assets/icons/ui.svg", 6),
          buildMainTab("Documents", "assets/icons/widget.svg", 7),
          buildMainTab("Planification", "assets/icons/forms.svg", 8),
          buildMainTab("Finance", "assets/icons/chart.svg", 9),
          buildMainTab("Statistiques", "assets/icons/menu_setting.svg", 10),
          buildMainTab("Notes", "assets/icons/chart.svg", 11),
          buildMainTab("Paramètres", "assets/icons/chart.svg", 12),
          buildMainTab("Aide", "assets/icons/chart.svg", 13),
        ],
      ),
    );
  }

  Widget buildMainTab(String title, String svgSrc, int pageIndex) {
    return ListTile(
      onTap: () {
        print(title);
        setState(() {
          currentPage = pageIndex;
        });
      },
      horizontalTitleGap: 0.0,
      leading: SvgPicture.asset(
        svgSrc,
        color: primaryColor,
        height: 16,
      ),
      title: Text(
        title,
        style: TextStyle(color: primaryColor),
      ),
    );
  }

  Widget buildMainTabWithSubTabs(String title, String svgSrc, int pageIndex, List<String> subTabs) {
    return ExpansionTile(
      leading: SvgPicture.asset(
        svgSrc,
        color: primaryColor,
        height: 16,
      ),
      title: Text(
        title,
        style: TextStyle(color: primaryColor),
      ),
      children: [
        for (int i = 0; i < subTabs.length; i++)
          ListTile(
            onTap: () {
              print(subTabs[i]);
              setState(() {
                currentPage = pageIndex + i + 1;
              });
            },
            horizontalTitleGap: 0.0,
            leading: Icon(
              Icons.arrow_right,
              color: primaryColor,
            ),
            title: Text(
              subTabs[i],
              style: TextStyle(color: primaryColor),
            ),
          ),
      ],
    );
  }
}


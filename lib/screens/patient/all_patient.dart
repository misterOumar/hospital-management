import 'package:flutter/material.dart';
import 'package:hospital_dashboard/screens/dashboard/components/custom_search_bar.dart';
import 'package:hospital_dashboard/screens/dashboard/components/header.dart';
import 'package:circular_reveal_animation/circular_reveal_animation.dart';
import 'package:hospital_dashboard/screens/profile/show_profile.dart';

class AllPatient extends StatefulWidget {
  const AllPatient({Key? key}) : super(key: key);

  @override
  State<AllPatient> createState() => _AllPatientState();
}

class _AllPatientState extends State<AllPatient> with SingleTickerProviderStateMixin {
  bool hoverColor = false;
  bool hoverImage = false;
  bool changePage = false;
  int currentPage = 1;
  late Animation<double> animation;
  late AnimationController _controller;
  late AnimationController animationController;
  List<bool> hoverColorListe = List.generate(18, (index) => false);
  TextEditingController allPatientController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  void _toggleVisibility() {
    setState(() {
      currentPage = (currentPage % 2) + 1;
    });
  }

  void _pressedCancel() {
    setState(() {
      currentPage--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: PreferredSize(
        child: customDefaultSearchBar(Header(
          controller: allPatientController,
        )),
        preferredSize: Size.fromHeight(100),
      ),
      body: Container(
        //color: Colors.white,
        child: GridView.builder(
          itemCount: 18,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 5),
          itemBuilder: (context, index) {
            return Stack(
              children: [
                TextButton(
                  onPressed: () {},
                  onHover: (value) {
                    setState(() {
                      hoverColorListe[index] = !hoverColorListe[index];
                    });
                  },
                  child: customCard("Smith Wright $index", "Male $index", index + 5, index),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Card customCard(String name, String gender, int age, int index) {
    return Card(
      elevation: 0.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))),
      color: (hoverColorListe[index] == false) ? Color(0xFF2DAAB8).withOpacity(0.7) : Colors.blue[300],
      child: SizedBox(
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      Container(
                        height: 85,
                        width: 85,
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          child: Center(
                            child: InkWell(
                              onTap: () => showRevealDialog(context),
                              child: Image.asset("assets/images/client_img.png"),
                            ),
                          ),
                        ),
                      ),
                    ]),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      //mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                          child: SizedBox(
                            child: Text(
                              "Name : $name",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                width: MediaQuery.of(context).size.width,
                color: Colors.grey[100],
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Container(
                        width: 100,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("$gender"),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              "Patient Gender",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        width: 100,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Age : $age"),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              "Years Old",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 50,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10.0),
                  bottomRight: Radius.circular(10.0),
                ),
                color: (hoverColorListe[index] == false) ? Color(0xFF2DAAB8).withOpacity(0.7) : Colors.blue[300],
              ),
              child: SafeArea(
                child: MaterialButton(
                  autofocus: true,
                  onPressed: () => goToProfilePage(context, name), //_toggleVisibility,
                  child: Text(
                    "Afficher Profile",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> showRevealDialog(BuildContext context) async {
    showGeneralDialog(
      barrierLabel: "Label",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: Duration(milliseconds: 700),
      context: context,
      pageBuilder: (context, anim1, anim2) {
        return Align(
          alignment: Alignment.center,
          child: Container(
            height: 400,
            width: 400,
            margin: EdgeInsets.only(top: 50, left: 12, right: 12, bottom: 0),
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(5),
              image: DecorationImage(image: AssetImage("assets/images/medecin.png"), fit: BoxFit.cover),
            ),
          ),
        );
      },
      transitionBuilder: (context, anim1, anim2, child) {
        return CircularRevealAnimation(
          child: child,
          animation: anim1,
          centerAlignment: Alignment.bottomCenter,
        );
      },
    );
  }
}

void goToProfilePage(context, String name) {
  Navigator.push(
    context,
    PageRouteBuilder(
      transitionDuration: Duration(milliseconds: 800),
      pageBuilder: (context, animation, secondaryAnimation) {
        return SlideTransition(
          position: Tween<Offset>(
            begin: Offset(0.0, 1.0),
            end: Offset.zero,
          ).animate(animation),
          child: ShowProfile(name: name),
        );
      },
    ),
  );
}

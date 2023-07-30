import 'package:flutter/material.dart';
import 'package:hospital_dashboard/screens/dashboard/components/custom_search_bar.dart';
import 'package:hospital_dashboard/screens/dashboard/components/header.dart';

class AllPatient extends StatefulWidget {
  const AllPatient({Key? key}) : super(key: key);

  @override
  State<AllPatient> createState() => _AllPatientState();
}

class _AllPatientState extends State<AllPatient> {
  bool hoverColor = false;
  List<bool> hoverColorListe = List.generate(18, (index) => false);
  TextEditingController allPatientController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: customDefaultSearchBar(Header(controller: allPatientController,)),
        preferredSize: Size.fromHeight(100),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(
                "https://www.celside-magazine.com/app/uploads/2021/02/meilleures-applications-bilan-sante-Celside-Magazine-1024x700.jpg"),
          ),

        ),
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
                    child: customCard("Smith Wright $index", "Male $index", index + 5, index)),
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
                            child: Image.asset("assets/images/client_img.png"),
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
                        //color: Colors.red,
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
                child: TextButton(
                  autofocus: true,
                  onPressed: () {
                    print("Afficher Profile");
                  },
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
}

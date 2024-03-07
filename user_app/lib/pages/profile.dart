import 'package:flutter/material.dart';
import 'package:graduation_project/pages/Edit%20Profile.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});
  @override
  State<Profile> createState() => _Profile();
}

class _Profile extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Profile",
              style: TextStyle(
                  color: Color(0xff0C8A7D),
                  fontSize: 24,
                  fontWeight: FontWeight.normal),
              textAlign: TextAlign.start),
          actions: [
            TextButton(
              child: const Text("Edit",
                  style: TextStyle(
                      color: Color(0xffEE7666),
                      fontSize: 22,
                      fontWeight: FontWeight.normal)),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const EditProfile()));
              },
            ),
          ],
          elevation: 0.0,
          iconTheme: const IconThemeData(color: Color(0xff0C8A7D), size: 27)),
      body: SingleChildScrollView(
        child: Column(children: [
          ListTile(
            leading: Container(child: Image.asset("images/person2.jpg")),
            title: const Text("USER NAME",
                style: TextStyle(
                    color: Color(0xff0C8A7D),
                    fontSize: 22,
                    fontWeight: FontWeight.normal)),
            subtitle: const Text("18/04/1996 - 28 years old",
                style: TextStyle(
                    color: Color(0xff000000),
                    fontSize: 12,
                    fontWeight: FontWeight.normal)),
          ),
          const Card(
            color: Colors.white,
            child: Column(children: [
              ListTile(
                leading: Text("ID",
                    style: TextStyle(
                        color: Color(0xff0C8A7D),
                        fontSize: 18,
                        fontWeight: FontWeight.normal)),
                trailing: Text("2000900",
                    style: TextStyle(
                        color: Color(0xff000000),
                        fontSize: 18,
                        fontWeight: FontWeight.normal)),
              ),
              ListTile(
                leading: Text("Gender",
                    style: TextStyle(
                        color: Color(0xff0C8A7D),
                        fontSize: 18,
                        fontWeight: FontWeight.normal)),
                trailing: Text("Female",
                    style: TextStyle(
                        color: Color(0xff000000),
                        fontSize: 18,
                        fontWeight: FontWeight.normal)),
              ),
              ListTile(
                leading: Text("Phone",
                    style: TextStyle(
                        color: Color(0xff0C8A7D),
                        fontSize: 18,
                        fontWeight: FontWeight.normal)),
                trailing: Text("+2011195252",
                    style: TextStyle(
                        color: Color(0xff000000),
                        fontSize: 18,
                        fontWeight: FontWeight.normal)),
              ),
              ListTile(
                leading: Text("Phone2",
                    style: TextStyle(
                        color: Color(0xff0C8A7D),
                        fontSize: 18,
                        fontWeight: FontWeight.normal)),
                trailing: Text("+2011195002",
                    style: TextStyle(
                        color: Color(0xff000000),
                        fontSize: 18,
                        fontWeight: FontWeight.normal)),
              ),
              ListTile(
                leading: Text("E-mail",
                    style: TextStyle(
                        color: Color(0xff0C8A7D),
                        fontSize: 18,
                        fontWeight: FontWeight.normal)),
                trailing: Text("username@gmail.con",
                    style: TextStyle(
                        color: Color(0xff000000),
                        fontSize: 18,
                        fontWeight: FontWeight.normal)),
              ),
              ListTile(
                leading: Text("Blood Group",
                    style: TextStyle(
                        color: Color(0xff0C8A7D),
                        fontSize: 18,
                        fontWeight: FontWeight.normal)),
                trailing: Text("A+",
                    style: TextStyle(
                        color: Color(0xff000000),
                        fontSize: 18,
                        fontWeight: FontWeight.normal)),
              ),
              ListTile(
                leading: Text("Height",
                    style: TextStyle(
                        color: Color(0xff0C8A7D),
                        fontSize: 18,
                        fontWeight: FontWeight.normal)),
                trailing: Text("169",
                    style: TextStyle(
                        color: Color(0xff000000),
                        fontSize: 18,
                        fontWeight: FontWeight.normal)),
              ),
              ListTile(
                leading: Text("Weight",
                    style: TextStyle(
                        color: Color(0xff0C8A7D),
                        fontSize: 18,
                        fontWeight: FontWeight.normal)),
                trailing: Text("65",
                    style: TextStyle(
                        color: Color(0xff000000),
                        fontSize: 18,
                        fontWeight: FontWeight.normal)),
              ),
            ]),
          ),
          Container(
            decoration: BoxDecoration(
                color: Color(0xffFDDDE5),
                borderRadius: BorderRadius.circular(20)),
            margin: EdgeInsets.all(10),
            child: ListTile(
              leading: Image.asset("images/heart.png"),
              title: const Text("Heart Rate",
                  style: TextStyle(
                      color: Color(0xff000000),
                      fontSize: 20,
                      fontWeight: FontWeight.bold)),
              subtitle: const Text("72 bpm",
                  style: TextStyle(
                      color: Color(0xff000000),
                      fontSize: 20,
                      fontWeight: FontWeight.normal)),
            ),
          ),
          Container(
            decoration: BoxDecoration(
                color: const Color(0xffDBEBF9),
                borderRadius: BorderRadius.circular(20)),
            margin: const EdgeInsets.all(10),
            child: ListTile(
                leading: Image.asset("images/Tonometer.png"),
                title: const Text("Blood Pressure",
                    style: TextStyle(
                        color: Color(0xff000000),
                        fontSize: 20,
                        fontWeight: FontWeight.bold)),
                subtitle: const Text("120/60",
                    style: TextStyle(
                        color: Color(0xff000000),
                        fontSize: 20,
                        fontWeight: FontWeight.normal))),
          ),
          Container(
            decoration: BoxDecoration(
                color: const Color(0xffFEE7E1),
                borderRadius: BorderRadius.circular(20)),
            margin: const EdgeInsets.all(10),
            child: ListTile(
                leading: Image.asset("images/Glucometer.png"),
                title: const Text("Diabetes",
                    style: TextStyle(
                        color: Color(0xff000000),
                        fontSize: 20,
                        fontWeight: FontWeight.bold)),
                subtitle: const Text("113",
                    style: TextStyle(
                        color: Color(0xff000000),
                        fontSize: 20,
                        fontWeight: FontWeight.normal))),
          ),
        ]),
      ),
    );
  }
}

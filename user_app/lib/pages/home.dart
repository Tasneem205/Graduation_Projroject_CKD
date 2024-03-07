import 'package:flutter/material.dart';
import 'package:graduation_project/pages/Pressure.dart';
import 'package:graduation_project/pages/login.dart';
import 'package:graduation_project/pages/medicine.dart';
import 'package:graduation_project/pages/profile.dart';
import 'package:graduation_project/pages/water.dart';
import 'package:graduation_project/pages/Diabetes.dart';
import 'package:graduation_project/pages/Walking.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 3,
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.notifications,
                size: 40,
                color: Color(0xFF0E725B),
              )),

          PopupMenuButton(
            color: const Color(0xffFFFFFF),
            icon: const Icon(Icons.person),
            iconSize: 40,
            iconColor: const Color(0xFF0E725B),
            itemBuilder: (context) =>[
              PopupMenuItem(
                value: "profile",
                child: MaterialButton(
                  child: const Row(
                    children: [
                      Icon(Icons.person, color: Color(0xff0C8A7D), size: 33,),
                      Text("Profile",
                      style: TextStyle(
                        color: Color(0xff000000),
                        fontSize: 22,
                        fontWeight: FontWeight.normal)),
                        ]),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const Profile()));
                      }),
                      ),
          
              PopupMenuItem(
                value: "log out",
                child: MaterialButton(
                  child: const Row(
                    children: [
                      Icon(Icons.logout, color: Color(0xff0C8A7D), size: 33,),
                      Text("Log out",
                      style: TextStyle(
                        color: Color(0xff000000),
                        fontSize: 22,
                        fontWeight: FontWeight.normal)),
                        ]),
                  onPressed: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => const Login()));
                      }))
                ])
                ],
        iconTheme: const IconThemeData(
          size: 40,
          color: Color(0xFF0E725B),
        ),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            SizedBox(
              height: 24,
            ),
            ElevatedButton(
              onPressed: () {},
              child: const ListTile(
                trailing: Icon(
                  Icons.menu_open,
                  size: 33,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {},
              child: const ListTile(
                trailing: Icon(
                  Icons.home,
                  size: 20,
                ),
                title: Text(
                  "Home",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {},
              child: const ListTile(
                trailing: Icon(
                  Icons.sticky_note_2_sharp,
                  size: 20,
                ),
                title: Text(" History", style: TextStyle(fontSize: 20)),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {},
              child: const ListTile(
                trailing: Icon(
                  Icons.phone,
                  size: 20,
                ),
                title: Text(" Contact Us", style: TextStyle(fontSize: 20)),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {},
              child: const ListTile(
                trailing: Icon(
                  Icons.language,
                  size: 20,
                ),
                title: Text(" Language", style: TextStyle(fontSize: 20)),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 2,
              width: double.infinity,
            ),
            Container(
              margin: EdgeInsets.only(bottom: 0),
              alignment: Alignment.topCenter,
              child: TextButton(
                onPressed: () {},
                child: Text(
                  "February, 2024",
                  style: TextStyle(
                    color: Color(0xFF0E725B),
                    fontSize: 30,
                  ),
                ),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.arrow_left,
                      size: 72,
                      color: Color(0xFF0E725B),
                    ),
                  ),
                  Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 0),
                        alignment: Alignment.center,
                        padding: EdgeInsets.fromLTRB(5, 15, 5, 6),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xFF0E725B),
                        ),
                        height: 70,
                        width: 60,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: const [
                            Text(
                              "1",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 30),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 0),
                        alignment: Alignment.center,
                        child: Text(
                          "Sun",
                          style:
                              TextStyle(color: Color(0xFF0E725B), fontSize: 20),
                        ),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 18),
                        alignment: Alignment.center,
                        padding: EdgeInsets.fromLTRB(5, 15, 5, 6),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xFF0E725B),
                        ),
                        height: 70,
                        width: 60,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: const [
                            Text(
                              "2",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 30),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 23),
                        alignment: Alignment.center,
                        child: Text(
                          "Mon",
                          style:
                              TextStyle(color: Color(0xFF0E725B), fontSize: 20),
                        ),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 23),
                        alignment: Alignment.center,
                        padding: EdgeInsets.fromLTRB(5, 15, 5, 6),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xFF0E725B),
                        ),
                        height: 70,
                        width: 60,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: const [
                            Text(
                              "3",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 30),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 23),
                        alignment: Alignment.center,
                        child: Text(
                          "Tue",
                          style:
                              TextStyle(color: Color(0xFF0E725B), fontSize: 20),
                        ),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 23),
                        alignment: Alignment.center,
                        padding: EdgeInsets.fromLTRB(5, 15, 5, 6),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xFF0E725B),
                        ),
                        height: 70,
                        width: 60,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: const [
                            Text(
                              "4",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 30),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 23),
                        alignment: Alignment.center,
                        child: Text(
                          "Thurs",
                          style:
                              TextStyle(color: Color(0xFF0E725B), fontSize: 20),
                        ),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 23),
                        alignment: Alignment.center,
                        padding: EdgeInsets.fromLTRB(5, 15, 5, 6),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xFF0E725B),
                        ),
                        height: 70,
                        width: 60,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: const [
                            Text(
                              "5",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 30),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 23),
                        alignment: Alignment.center,
                        child: Text(
                          "wed",
                          style:
                              TextStyle(color: Color(0xFF0E725B), fontSize: 20),
                        ),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 23),
                        alignment: Alignment.center,
                        padding: EdgeInsets.fromLTRB(5, 15, 5, 6),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xFF0E725B),
                        ),
                        height: 70,
                        width: 60,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: const [
                            Text(
                              "6",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 30),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 23),
                        alignment: Alignment.center,
                        child: Text(
                          "Fri",
                          style:
                              TextStyle(color: Color(0xFF0E725B), fontSize: 20),
                        ),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 23),
                        alignment: Alignment.center,
                        padding: EdgeInsets.fromLTRB(5, 15, 5, 6),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xFF0E725B),
                        ),
                        height: 70,
                        width: 60,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: const [
                            Text(
                              "7",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 30),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 23),
                        alignment: Alignment.center,
                        child: Text(
                          "Sat",
                          style:
                              TextStyle(color: Color(0xFF0E725B), fontSize: 20),
                        ),
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.arrow_right,
                      size: 75,
                      color: Color(0xFF0E725B),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
              width: 10,
            ),
            SingleChildScrollView(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(10, 2, 4, 20),
                            alignment: Alignment.topLeft,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color.fromARGB(217, 72, 203, 140)),
                            width: 40,
                            height: 50,
                            child: Image.asset("assets/img/person.png",
                                width: 100, height: 60, fit: BoxFit.contain),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 2, 2, 10),
                            alignment: Alignment.topLeft,
                            width: 100,
                            height: 56,
                            child: TextButton(
                              onPressed: () {},
                              child: const Text(
                                "O Steps",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(10, 4, 4, 20),
                            alignment: Alignment.topLeft,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle, color: Colors.white),
                            width: 40,
                            height: 50,
                            child: Image.asset("assets/img/stopwatch (2).png",
                                width: 100, height: 60, fit: BoxFit.contain),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 0, 5, 10),
                            alignment: Alignment.topLeft,
                            width: 100,
                            height: 56,
                            child: TextButton(
                              onPressed: () {},
                              child: const Text(
                                "O Mins",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(10, 4, 2, 20),
                            alignment: Alignment.topLeft,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color.fromARGB(219, 255, 138, 194)),
                            width: 40,
                            height: 50,
                            child: Image.asset("assets/img/drink-water.png",
                                width: 100, height: 70, fit: BoxFit.contain),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 2, 2, 10),
                            alignment: Alignment.topLeft,
                            width: 100,
                            height: 56,
                            child: TextButton(
                              onPressed: () {},
                              child: const Text(
                                "O ML",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(100, 40, 0, 10),
                    alignment: Alignment.topCenter,
                    color: Colors.white,
                    width: 100,
                    height: 120,
                    child: Image.asset(
                      "assets/img/photo1707749887 (8).png",
                      width: 100,
                      height: 120,
                      fit: BoxFit.fill,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton.icon(
                  icon: const Icon(
                    Icons.access_alarm,
                    size: 40,
                    color: Color(0xFF0E725B),
                  ),
                  label: const Text(
                    "00:00:00     Workouts this week",
                    style: TextStyle(fontSize: 19, color: Colors.black),
                  ),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: BeveledRectangleBorder(
                        borderRadius: BorderRadius.circular(2),
                      )),
                  onPressed: () {},
                ),
              ],
            ),
            SizedBox(
              height: 10,
              width: 10,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 0),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color.fromARGB(255, 158, 202, 237),
                    ),
                    height: 160,
                    width: 160,
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(10, 9, 10, 10),
                          alignment: Alignment.topCenter,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          width: 90,
                          height: 80,
                          child: Image.asset(
                            "assets/img/photo1707854998.png",
                            width: 90,
                            height: 80,
                            fit: BoxFit.fill,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => Water()));
                          },
                          child: Text(
                            "Water",
                            style: TextStyle(color: Colors.black, fontSize: 25),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 2,
                    width: 10,
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 0),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color.fromARGB(197, 252, 177, 177),
                    ),
                    height: 160,
                    width: 160,
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(10, 9, 10, 10),
                          alignment: Alignment.topCenter,
                          decoration: BoxDecoration(color: Colors.white),
                          width: 90,
                          height: 80,
                          child: Image.asset(
                            "assets/img/—Pngtree—side view of a beautiful_4795700.png",
                            width: 90,
                            height: 80,
                            fit: BoxFit.fill,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                          height: 1,
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => Walking()));
                          },
                          child: Text(
                            "Walking",
                            style: TextStyle(color: Colors.black, fontSize: 25),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
              width: 5,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 0),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color.fromARGB(204, 244, 209, 144),
                    ),
                    height: 160,
                    width: 160,
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(10, 9, 10, 10),
                          alignment: Alignment.topCenter,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          width: 90,
                          height: 80,
                          child: Image.asset(
                            "assets/img/photo1707854998 (1).png",
                            width: 90,
                            height: 80,
                            fit: BoxFit.fill,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                          height: 1,
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => Medicine()));
                          },
                          child: Text(
                            "Medicine",
                            style: TextStyle(color: Colors.black, fontSize: 25),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 2,
                    width: 10,
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 0),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color.fromARGB(205, 146, 228, 143),
                    ),
                    height: 160,
                    width: 160,
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(10, 9, 10, 10),
                          alignment: Alignment.topCenter,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          width: 90,
                          height: 80,
                          child: Image.asset(
                            "assets/img/photo1707854801 (1).png",
                            width: 90,
                            height: 80,
                            fit: BoxFit.fill,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                          height: 1,
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => Pressure()));
                          },
                          child: Text(
                            "Pressure",
                            style: TextStyle(color: Colors.black, fontSize: 25),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
              width: 5,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 0),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color.fromARGB(248, 162, 208, 211),
                    ),
                    height: 160,
                    width: 160,
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(10, 9, 10, 10),
                          alignment: Alignment.topCenter,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          width: 90,
                          height: 80,
                          child: Image.asset(
                            "assets/img/photo1707749887 (6).png",
                            width: 90,
                            height: 80,
                            fit: BoxFit.fill,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                          height: 2,
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => Diabetes()));
                          },
                          child: Text(
                            "Diabetes",
                            style: TextStyle(color: Colors.black, fontSize: 25),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 2,
                    width: 10,
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 0),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color.fromARGB(194, 255, 174, 252),
                    ),
                    height: 160,
                    width: 160,
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(10, 9, 10, 10),
                          alignment: Alignment.topCenter,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          width: 90,
                          height: 80,
                          child: Image.asset(
                            "assets/img/photo1707749887 (5).png",
                            width: 90,
                            height: 80,
                            fit: BoxFit.fill,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                          height: 2,
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            "Exercises",
                            style: TextStyle(color: Colors.black, fontSize: 25),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 5,
              width: 10,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 5, 2, 37),
                    alignment: Alignment.topLeft,
                    width: 50,
                    height: 50,
                    child: Image.asset(
                      "assets/img/photo1707854808.png",
                      width: 50,
                      height: 50,
                      fit: BoxFit.contain,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(20, 10, 0, 10),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    height: 100,
                    width: 250,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Text(
                          "Track : ",
                          style:
                              TextStyle(color: Color(0xFF0E725B), fontSize: 18),
                        ),
                        SizedBox(
                          height: 1,
                        ),
                        Text(
                          "Track and store all your health data in one place and receive real-time guidance beyond the hospital walls. With predictive analytics, we can identify early medical issues and prevent them with timely treatment",
                          style: TextStyle(
                              fontWeight: FontWeight.w900,
                              color: Color.fromARGB(255, 20, 19, 15),
                              fontSize: 10),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 2,
              width: 10,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                    alignment: Alignment.topLeft,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    height: 100,
                    width: 250,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Text(
                          "Understand:",
                          style:
                              TextStyle(color: Color(0xFF0E725B), fontSize: 18),
                        ),
                        SizedBox(
                          height: 1,
                        ),
                        Text(
                          "Our platform provides personalized care plans, integrated health trackers, and customized education to help patients make informed clinical decisions",
                          style: TextStyle(
                              fontWeight: FontWeight.w900,
                              color: Color.fromARGB(255, 20, 19, 15),
                              fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(5, 10, 0, 37),
                    alignment: Alignment.topLeft,
                    width: 50,
                    height: 50,
                    child: Image.asset(
                      "assets/img/photo1707749887 (2)..png",
                      width: 50,
                      height: 50,
                      fit: BoxFit.contain,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 2,
              width: 10,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(5, 5, 2, 37),
                    alignment: Alignment.topLeft,
                    width: 70,
                    height: 70,
                    child: Image.asset(
                      "assets/img/photo1707854966.png",
                      width: 70,
                      height: 70,
                      fit: BoxFit.contain,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(20, 10, 0, 10),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    height: 100,
                    width: 250,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Text(
                          "Treatment : ",
                          style:
                              TextStyle(color: Color(0xFF0E725B), fontSize: 18),
                        ),
                        SizedBox(
                          height: 1,
                        ),
                        Text(
                          "Effective and personalized treatment based on various health parameters and real-time health data.",
                          style: TextStyle(
                              fontWeight: FontWeight.w900,
                              color: Color.fromARGB(255, 20, 19, 15),
                              fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 2,
              width: 10,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                    alignment: Alignment.topLeft,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    height: 100,
                    width: 250,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Text(
                          "Improve : ",
                          style:
                              TextStyle(color: Color(0xFF0E725B), fontSize: 18),
                        ),
                        SizedBox(
                          height: 1,
                        ),
                        Text(
                          "Proactive, effective and efficient management reduce costs, hospital readmissions and improve outcomes",
                          style: TextStyle(
                              fontWeight: FontWeight.w900,
                              color: Color.fromARGB(255, 20, 19, 15),
                              fontSize: 10),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(5, 10, 0, 42),
                    alignment: Alignment.topLeft,
                    width: 50,
                    height: 50,
                    child: Image.asset(
                      "assets/img/photo1707854801.png",
                      width: 50,
                      height: 50,
                      fit: BoxFit.contain,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 2,
              width: 10,
            ),
          ],
        ),
      ),
    );
  }
}

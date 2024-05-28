import 'dart:convert';
import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:user_app/Classes/language.dart';
import 'package:user_app/Classes/language_constants.dart';
import 'package:user_app/main.dart';
import 'package:user_app/module/exercise-screen.dart';
import 'package:user_app/pages/Diabetes.dart';
import 'package:user_app/pages/Notifications.dart';
import 'package:user_app/pages/Pressure.dart';
import 'package:user_app/pages/Walking.dart';
import 'package:user_app/pages/hist.dart';
import 'package:user_app/pages/login.dart';
import 'package:user_app/pages/medicine.dart';
import 'package:user_app/pages/pages_chat/home_chat_bot.dart';
import 'package:user_app/pages/profile.dart';
import 'package:user_app/pages/water.dart';
import 'package:http/http.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

@override
class _HomeState extends State<Home> {
  TooltipBehavior? _tooltipBehavior;
  List<ChartData>? chartData;

  @override
  void initState() {
    _tooltipBehavior = TooltipBehavior(enable: true);
    chartData = <ChartData>[
      ChartData('ML ', 800, const Color.fromARGB(255, 158, 202, 237), 'ML'),
      ChartData(
          'Mins ', 7200, const Color.fromARGB(219, 255, 138, 194), 'Mins'),
      ChartData(
          'Steps ', 10500, const Color.fromARGB(217, 72, 203, 140), 'Steps'),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //   final List<ChartData> chartData = <ChartData>[
    //   ChartData('ML',700 , Color.fromARGB(219, 255, 138, 194)),
    //   ChartData('Mins', 1000,  Color.fromARGB(255, 158, 202, 237)),
    // ChartData('Steps', 1000, Color.fromARGB(217, 72, 203, 140)),
    // ];
    return Scaffold(
      backgroundColor: const Color(0xffF2F7FD),
      floatingActionButton: MaterialButton(
        onPressed: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const Home_chat_bot()));
        },
        child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
            ),
            child: Image.asset("assets/img/robot.png")),
      ),
      appBar: AppBar(
        elevation: 2,
        backgroundColor: const Color(0xffFFFFFF),
        actions: <Widget>[
          DropdownButton<Language>(
            underline: const SizedBox(),
            icon: const Icon(
              Icons.language,
              size: 40,
              color: Color(0xFF0E725B),
            ),
            onChanged: (Language? language) async {
              if (language != null) {
                Locale _locale = await setLocale(language.languageCode);
                MyApp.setLocale(context, _locale);
              }
            },
            items: Language.languageList()
                .map<DropdownMenuItem<Language>>(
                  (e) => DropdownMenuItem<Language>(
                    value: e,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Text(
                          e.flag,
                          style: const TextStyle(
                            fontSize: 30,
                            color: Color(0xFF0E725B),
                          ),
                        ),
                        Text(e.name)
                      ],
                    ),
                  ),
                )
                .toList(),
          ),
          IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const Notifications()));
              },
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
              itemBuilder: (context) => [
                    PopupMenuItem(
                      value: translation(context).profile,
                      child: MaterialButton(
                          child: Row(children: [
                            const Icon(
                              Icons.person,
                              color: Color(0xff0C8A7D),
                              size: 33,
                            ),
                            Text(translation(context).profile,
                                style: const TextStyle(
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
                        value: translation(context).logout,
                        child: MaterialButton(
                            child: Row(children: [
                              const Icon(
                                Icons.logout,
                                color: Color(0xff0C8A7D),
                                size: 33,
                              ),
                              Text(translation(context).logout,
                                  style: const TextStyle(
                                      color: Color(0xff000000),
                                      fontSize: 22,
                                      fontWeight: FontWeight.normal)),
                            ]),
                            onPressed: () {
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
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
            const SizedBox(
              height: 24,
            ),
            MaterialButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const ListTile(
                trailing: Icon(
                  Icons.menu_open,
                  color: Color(0xFF0E725B),
                  size: 35,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            MaterialButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const Hist()));
              },
              child: ListTile(
                trailing: const Icon(
                  Icons.sticky_note_2_sharp,
                  color: Color(0xFF0E725B),
                  size: 30,
                ),
                title: Text(translation(context).history,
                    style: const TextStyle(
                        fontSize: 30, color: Color(0xFF0E725B))),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            MaterialButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return Expanded(
                        child: AlertDialog(
                          content: Container(
                            width: MediaQuery.of(context).size.width,
                            height: 400,
                            child: Column(children: [
                              Container(
                                alignment: Alignment.centerRight,
                                child: IconButton(
                                    icon: const Icon(Icons.clear),
                                    color: const Color(0xff0C8A7D),
                                    iconSize: 30,
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    }),
                              ),
                              Center(
                                child: Text(translation(context).contact,
                                    style: const TextStyle(
                                        color: Color(0xff0C8A7D),
                                        fontSize: 29)),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              Container(
                                  alignment: Alignment.centerLeft,
                                  child: Wrap(children: [
                                    TextButton.icon(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.location_on,
                                        color: Color(0xff0C8A7D),
                                        size: 40,
                                      ),
                                      label: const Text(
                                        " Street .. Building 54",
                                        style: TextStyle(
                                            color: Color(0xff0C8A7D),
                                            fontSize: 25),
                                      ),
                                    ),
                                  ])),
                              Container(
                                alignment: Alignment.centerLeft,
                                child: TextButton.icon(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.email,
                                    color: Color(0xff0C8A7D),
                                    size: 30,
                                  ),
                                  label: const Text(
                                    " Mail@gmail.com",
                                    style: TextStyle(
                                        color: Color(0xff0C8A7D),
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              Container(
                                alignment: Alignment.centerLeft,
                                child: TextButton.icon(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.phone,
                                    color: Color(0xff0C8A7D),
                                    size: 30,
                                  ),
                                  label: const Text(
                                    " +36 60 876 543",
                                    style: TextStyle(
                                        color: Color(0xff0C8A7D),
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              Container(
                                alignment: Alignment.centerLeft,
                                child: TextButton.icon(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.alarm,
                                    color: Color(0xff0C8A7D),
                                    size: 40,
                                  ),
                                  label: Container(
                                    child: const Column(
                                      children: [
                                        Text(" Sat:9am to 4pm ",
                                            style: TextStyle(
                                                color: Color(0xff0C8A7D),
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold)),
                                        Text(" Sun:8am to 4pm",
                                            style: TextStyle(
                                                color: Color(0xff0C8A7D),
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold))
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            ]),
                          ),
                        ),
                      );
                    });
              },
              child: ListTile(
                trailing: const Icon(
                  Icons.phone,
                  color: Color(0xFF0E725B),
                  size: 30,
                ),
                title: Text(translation(context).contact,
                    style: const TextStyle(
                        fontSize: 30, color: Color(0xFF0E725B))),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: Text(
                (DateFormat.yMMMMd().format(DateTime.now())),
                style: const TextStyle(color: Color(0xff0C8A7D), fontSize: 30),
              ),
            ),

            EasyDateTimeLine(
              initialDate: DateTime.now(),
              onDateChange: (selectedDate) {
                //`selectedDate` the new date selected.
              },
              activeColor: const Color.fromARGB(255, 236, 235, 235),
              headerProps: const EasyHeaderProps(
                monthStyle: TextStyle(color: Color(0xff0C8A7D), fontSize: 20),
                showSelectedDate: false,
              ),
              dayProps: const EasyDayProps(
                todayHighlightStyle: TodayHighlightStyle.withBackground,
                height: 60,
                width: 60,
                dayStructure: DayStructure.dayNumDayStr,
                inactiveDayStrStyle: TextStyle(color: Colors.white),
                inactiveBorderRadius: 20,
                inactiveDayStyle: DayStyle(
                  borderRadius: 44,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(150)),
                      color: Color(0xff0C8A7D)),
                  dayNumStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                  ),
                ),
                activeDayStyle: DayStyle(
                  // decoration: BoxDecoration(border:Border.symmetric()),
                  dayNumStyle: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
            ),

            const SizedBox(
              height: 10,
            ),
            SingleChildScrollView(
              child: Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color.fromARGB(217, 72, 203, 140)),
                                width: 60,
                                height: 50,
                                child: Image.asset(
                                    "assets/img/Water Glass2.png",
                                    width: 40,
                                    height: 40,
                                    fit: BoxFit.contain),
                              ),
                              Container(
                                child: TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    translation(context).steps,
                                    style: const TextStyle(
                                      fontSize: 20,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              Container(
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color.fromARGB(219, 255, 138, 194)),
                                width: 60,
                                height: 50,
                                child: Image.asset("assets/img/Time Span2.png",
                                    width: 60, height: 50, fit: BoxFit.contain),
                              ),
                              Container(
                                child: TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    translation(context).mins,
                                    style: const TextStyle(
                                      fontSize: 20,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              Container(
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color.fromARGB(255, 158, 202, 237)),
                                width: 60,
                                height: 50,
                                child: Image.asset(
                                    "assets/img/Water Glass2.png",
                                    width: 50,
                                    height: 50,
                                    fit: BoxFit.contain),
                              ),
                              Container(
                                child: TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    translation(context).ml,
                                    style: const TextStyle(
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
                    ),
                    Expanded(
                        child: Container(
                            child: SfCircularChart(
                                key: GlobalKey(),
                                legend: const Legend(
                                    toggleSeriesVisibility: false,
                                    isVisible: false,
                                    iconHeight: 20,
                                    iconWidth: 20,
                                    overflowMode: LegendItemOverflowMode.wrap),
                                series: <CircularSeries<ChartData, String>>[
                          RadialBarSeries<ChartData, String>(
                            maximumValue: 1000,
                            radius: '100%',
                            gap: '3%',
                            dataSource: chartData,
                            cornerStyle: CornerStyle.bothCurve,
                            xValueMapper: (ChartData data, _) => data.x,
                            yValueMapper: (ChartData data, _) => data.y,
                            pointColorMapper: (ChartData data, _) => data.Color,
                            dataLabelMapper: (ChartData data, _) => data.text,
                            dataLabelSettings:
                                const DataLabelSettings(isVisible: false),
                          )
                        ]))),
                  ],
                ),
              ),
            ),
            // workouts
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: MaterialButton(
                child: Card(
                    color: const Color(0xffFFFFFF),
                    child: Expanded(
                      child: Row(children: [
                        Image.asset(
                          "assets/img/stopwatch (2).png",
                          width: 50,
                          height: 50,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          translation(context).time,
                          style: const TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      ]),
                    )),
                onPressed: () {},
              ),
            ),

            ////////////////////

            const SizedBox(
              height: 10,
              width: 10,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(right: 0),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color.fromARGB(255, 158, 202, 237),
                      ),
                      height: 160,
                      width: 160,
                      child: Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.fromLTRB(10, 9, 10, 10),
                            alignment: Alignment.topCenter,
                            decoration:
                                const BoxDecoration(shape: BoxShape.circle),
                            width: 90,
                            height: 80,
                            child: Image.asset(
                              "assets/img/Ellipse 9.png",
                              width: 90,
                              height: 80,
                              fit: BoxFit.fill,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const Water()));
                            },
                            child: Text(
                              translation(context).water,
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 25),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 2,
                      width: 10,
                    ),
                    Container(
                      margin: const EdgeInsets.only(right: 0),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color.fromARGB(197, 252, 177, 177),
                      ),
                      height: 160,
                      width: 160,
                      child: Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.fromLTRB(10, 9, 10, 10),
                            alignment: Alignment.topCenter,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle, color: Colors.white),
                            width: 90,
                            height: 80,
                            child: Image.asset(
                              "assets/img/Ellipse 10.png",
                              width: 90,
                              height: 80,
                              fit: BoxFit.fill,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                            height: 1,
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const Walking()));
                            },
                            child: Text(
                              translation(context).walking,
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 25),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
              width: 5,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 0),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: const Color.fromARGB(204, 244, 209, 144),
                    ),
                    height: 160,
                    width: 160,
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.fromLTRB(10, 9, 10, 10),
                          alignment: Alignment.topCenter,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          width: 90,
                          height: 80,
                          child: Image.asset(
                            "assets/img/Ellipse 11.png",
                            width: 90,
                            height: 80,
                            fit: BoxFit.fill,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                          height: 1,
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const Medicine()));
                          },
                          child: Text(
                            translation(context).medicine,
                            style: const TextStyle(
                                color: Colors.black, fontSize: 25),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 2,
                    width: 10,
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 0),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: const Color.fromARGB(205, 146, 228, 143),
                    ),
                    height: 160,
                    width: 160,
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.fromLTRB(10, 9, 10, 10),
                          alignment: Alignment.topCenter,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          width: 90,
                          height: 80,
                          child: Image.asset(
                            "assets/img/Ellipse 12.png",
                            width: 90,
                            height: 80,
                            fit: BoxFit.fill,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                          height: 1,
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const Pressure()));
                          },
                          child: Text(
                            translation(context).pressure,
                            style: const TextStyle(
                                color: Colors.black, fontSize: 25),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
              width: 5,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 0),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: const Color.fromARGB(248, 162, 208, 211),
                    ),
                    height: 160,
                    width: 160,
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.fromLTRB(10, 9, 10, 10),
                          alignment: Alignment.topCenter,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          width: 90,
                          height: 80,
                          child: Image.asset(
                            "assets/img/Ellipse 13.png",
                            width: 90,
                            height: 80,
                            fit: BoxFit.fill,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                          height: 2,
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const Diabetes()));
                          },
                          child: Text(
                            translation(context).diabetes,
                            style: const TextStyle(
                                color: Colors.black, fontSize: 25),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 2,
                    width: 10,
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 0),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: const Color.fromARGB(194, 255, 174, 252),
                    ),
                    height: 160,
                    width: 160,
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.fromLTRB(10, 9, 10, 10),
                          alignment: Alignment.topCenter,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          width: 90,
                          height: 80,
                          child: Image.asset(
                            "assets/img/Ellipse 14.png",
                            width: 90,
                            height: 80,
                            fit: BoxFit.fill,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                          height: 2,
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const ExerciseScreen()));
                          },
                          child: Text(
                            translation(context).exercises,
                            style: const TextStyle(
                                color: Colors.black, fontSize: 25),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
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
                    margin: const EdgeInsets.fromLTRB(0, 5, 2, 37),
                    alignment: Alignment.topLeft,
                    width: 70,
                    height: 90,
                    child: Image.asset(
                      "assets/img/photo1707854808.png",
                      width: 50,
                      height: 50,
                      fit: BoxFit.contain,
                    ),
                  ),
                  const SizedBox(
                    width: 9,
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(20, 10, 0, 10),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    height: 140,
                    width: 260,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          translation(context).track,
                          style: const TextStyle(
                              color: Color(0xFF0E725B), fontSize: 18),
                        ),
                        const SizedBox(
                          height: 1,
                        ),
                        Text(
                          translation(context).tr,
                          style: const TextStyle(
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
            const SizedBox(
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
                    margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
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
                      children: [
                        Text(
                          translation(context).understand,
                          style: const TextStyle(
                              color: Color(0xFF0E725B), fontSize: 18),
                        ),
                        const SizedBox(
                          height: 1,
                        ),
                        Text(
                          translation(context).under,
                          style: const TextStyle(
                              fontWeight: FontWeight.w900,
                              color: Color.fromARGB(255, 20, 19, 15),
                              fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(5, 10, 0, 37),
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
            const SizedBox(
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
                    margin: const EdgeInsets.fromLTRB(5, 5, 2, 37),
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
                    margin: const EdgeInsets.fromLTRB(20, 10, 0, 10),
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
                      children: [
                        Text(
                          translation(context).treatment,
                          style: const TextStyle(
                              color: Color(0xFF0E725B), fontSize: 18),
                        ),
                        const SizedBox(
                          height: 1,
                        ),
                        Text(
                          translation(context).treat,
                          style: const TextStyle(
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
            const SizedBox(
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
                    margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
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
                      children: [
                        Text(
                          translation(context).improve,
                          style: const TextStyle(
                              color: Color(0xFF0E725B), fontSize: 18),
                        ),
                        const SizedBox(
                          height: 1,
                        ),
                        Text(
                          translation(context).imp,
                          style: const TextStyle(
                              fontWeight: FontWeight.w900,
                              color: Color.fromARGB(255, 20, 19, 15),
                              fontSize: 10),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(5, 10, 0, 42),
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
            const SizedBox(
              height: 2,
              width: 10,
            ),
          ],
        ),
      ),
    );
  }
}

class ChartData {
  ChartData(this.x, this.y, this.Color, this.text);
  final String x;
  final double y;
  // ignore: non_constant_identifier_names, prefer_typing_uninitialized_variables
  final Color;
  final String text;
}

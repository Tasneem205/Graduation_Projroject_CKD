import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:user_app/Classes/language_constants.dart';

class Medicine extends StatefulWidget {
  const Medicine({Key? key}) : super(key: key);
  @override
  State<Medicine> createState() => _Medicine();
}

class _Medicine extends State<Medicine> {
  List<MedicineTime> Times1 = [
    MedicineTime(title: "today", subtitle: "07:00 am")
  ];
  List<MedicineTime> Times2 = [
    MedicineTime(title: "", subtitle: "10:00 pm")
  ];
  List<MedicineTime> Times3 = [
    MedicineTime(title: "Monday", subtitle: "09:00 am")
  ];
  List MList1 = [
    ["images/Pills.png", "Omega", false],
    ["images/Pills (1).png", "Vitamin", false],
  ];
  List MList2 = [
    ["images/Pills (2).png", "Aspirin", false],
    ["images/Pills (1).png", "Vitamin D", false],
  ];
  List MList3 = [
    ["images/Pills (3).png", "Omega", false],
    ["images/Pills (1).png", "Vitamin C", false]
  ];

  //Checked was tapped
  void checkBoxChanged1(bool? value, int index) {
    setState(() {
      MList1[index][2] = !MList1[index][2];
    });
  }

  void checkBoxChanged2(bool? value, int index) {
    setState(() {
      MList2[index][2] = !MList2[index][2];
    });
  }

  void checkBoxChanged3(bool? value, int index) {
    setState(() {
      MList3[index][2] = !MList3[index][2];
    });
  }

  saveNewTask() {
    setState(() {
      MList3.add([nameController.text, false]);
      nameController.clear();
    });
    Navigator.of(context).pop();
  }

  //delete task
  deleteTask1(int index) {
    setState(() {
      MList1.removeAt(index);
      if (MList1.isEmpty) {
        Times1.removeAt(index);
      }
    });
  }

  deleteTask2(int index) {
    setState(() {
      MList2.removeAt(index);
      if (MList2.isEmpty) {
        Times2.removeAt(index);
      }
    });
  }

  deleteTask3(int index) {
    setState(() {
      MList3.removeAt(index);
      if (MList3.isEmpty) {
        Times3.removeAt(index);
      }
    });
  }

  bool status = false;

  TextEditingController nameController = TextEditingController();
  TextEditingController dosageController = TextEditingController();
  TextEditingController timeController = TextEditingController();

  DateTime _dateTime = DateTime.now();

  void showTimePicker(BuildContext context) {
    showCupertinoDialog(
      context: context,
      builder: (context) {
        return Expanded(
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: AlertDialog(
              backgroundColor: const Color(0xffF1F6FC),
              content: SizedBox(
                height: 200,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                          child: SizedBox(
                        width: 400,
                        child: CupertinoDatePicker(
                            initialDateTime: _dateTime,
                            mode: CupertinoDatePickerMode.time,
                            use24hFormat: false,
                            onDateTimeChanged: (dateTime) {
                              setState(() {
                                _dateTime = dateTime;
                              });
                            }),
                      )),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.clear),
                            iconSize: 27,
                            color: const Color(0xff0C8A7D),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                          IconButton(
                            icon: const Icon(Icons.done),
                            iconSize: 27,
                            color: const Color(0xff0C8A7D),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          )
                        ],
                      )
                    ]),
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(translation(context).medicine,
              style: const TextStyle(
                  color: Color(0xff0C8A7D),
                  fontSize: 24,
                  fontWeight: FontWeight.normal,
                  letterSpacing: -0.45),
              textAlign: TextAlign.start),
          actions: [
            MaterialButton(
                child: Image.asset("images/Plus.png"),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                            backgroundColor: const Color(0xffF1F6FC),
                            content: Container(
                              height: 200,
                              child: Expanded(
                                child: Column(children: [
                                  Container(
                                    alignment: Alignment.centerLeft,
                                    padding: const EdgeInsets.only(left: 5),
                                    margin: const EdgeInsets.only(bottom: 3),
                                    child: Text(translation(context).name,
                                        style: const TextStyle(
                                            color: Color(0xff0C8A7D),
                                            fontSize: 15,
                                            fontWeight: FontWeight.normal,
                                            letterSpacing: -0.45)),
                                  ),
                                  Container(
                                    height: 33,
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                        color: const Color(0xffC3EAEB),
                                        borderRadius:
                                            BorderRadius.circular(14)),
                                    padding: const EdgeInsets.only(left: 2),
                                    child: Form(
                                      child: TextFormField(
                                          controller: nameController,
                                          cursorColor: const Color(0xff0C8A7D),
                                          decoration: const InputDecoration(
                                            border: OutlineInputBorder(),
                                            focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Color(0xff0C8A7D)),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(14))),
                                            enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Color(0xff0C8A7D)),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(14))),
                                          )),
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.centerLeft,
                                    padding: const EdgeInsets.only(left: 5),
                                    margin: const EdgeInsets.only(bottom: 3),
                                    child: Text(translation(context).dosage,
                                        style: const TextStyle(
                                            color: Color(0xff0C8A7D),
                                            fontSize: 15,
                                            fontWeight: FontWeight.normal,
                                            letterSpacing: -0.45)),
                                  ),
                                  Container(
                                    height: 33,
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                        color: const Color(0xffC3EAEB),
                                        borderRadius:
                                            BorderRadius.circular(14)),
                                    padding: const EdgeInsets.only(left: 2),
                                    child: Form(
                                      child: TextFormField(
                                          controller: dosageController,
                                          cursorColor: const Color(0xff0C8A7D),
                                          decoration: const InputDecoration(
                                            border: OutlineInputBorder(),
                                            focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Color(0xff0C8A7D)),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(14))),
                                            enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Color(0xff0C8A7D)),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(14))),
                                          )),
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.centerLeft,
                                    padding: const EdgeInsets.only(left: 5),
                                    margin: const EdgeInsets.only(bottom: 3),
                                    child: Text(translation(context).clock,
                                        style: const TextStyle(
                                            color: Color(0xff0C8A7D),
                                            fontSize: 15,
                                            fontWeight: FontWeight.normal,
                                            letterSpacing: -0.45)),
                                  ),
                                  Container(
                                    height: 33,
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                        color: const Color(0xffC3EAEB),
                                        borderRadius:
                                            BorderRadius.circular(14)),
                                    padding: const EdgeInsets.only(left: 2),
                                    child: Form(
                                      child: TextFormField(
                                          controller: timeController,
                                          cursorColor: const Color(0xff0C8A7D),
                                          decoration: const InputDecoration(
                                            border: OutlineInputBorder(),
                                            focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Color(0xff0C8A7D)),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(14))),
                                            enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Color(0xff0C8A7D)),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(14))),
                                          ),
                                          onTap: () {
                                            showTimePicker(context);
                                          }),
                                    ),
                                  ),
                                ]),
                              ),
                            ),
                            actions: [
                              Expanded(
                                child: Row(children: [
                                  MaterialButton(
                                      color: const Color(0xff0C8A7D),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Text(translation(context).add,
                                          style: const TextStyle(
                                              color: Color(0xffFFFFFF),
                                              fontSize: 20,
                                              fontWeight: FontWeight.normal,
                                              letterSpacing: -0.45)),
                                      onPressed: () {}),
                                  const Spacer(),
                                  Switch(
                                    activeColor: const Color(0xff0C8A7D),
                                    activeTrackColor: const Color(0xffB0E3DC),
                                    inactiveThumbColor: const Color(0xffD9D9D9),
                                    inactiveTrackColor: const Color(0xffB0E3DC),
                                    value: status,
                                    onChanged: (value) {
                                      setState(() {
                                        status = value;
                                      });
                                    },
                                  ),
                                  /*Switch(
                                      activeColor: const Color(0xff0C8A7D),
                                      activeTrackColor: const Color.fromARGB(
                                          255, 38, 171, 158),
                                      inactiveThumbColor:
                                          const Color(0xffD9D9D9), //الراس بس
                                      inactiveTrackColor:
                                          const Color(0xffB0E3DC), //بالجسم
                                      value: status,
                                      onChanged: (value) {
                                        setState(() {
                                          status = value;
                                        });
                                      }),*/
                                  const Icon(
                                    Icons.notifications_active,
                                    color: Color(0xff0C8A7D),
                                  )
                                ]),
                              ),
                            ]);
                      });
                }),
          ],
          elevation: 0.0,
          iconTheme: const IconThemeData(color: Color(0xff0C8A7D), size: 28)),
      body: SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              ...Times1.map((item) => ListTile(
                    title: Text(item.title,
                        style: const TextStyle(
                            color: Color(0xff0C8A7D),
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            letterSpacing: -0.45)),
                    subtitle: Text(item.subtitle,
                        style: const TextStyle(
                            color: Color(0xff000000),
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                            letterSpacing: -0.45)),
                  )),
              /*Container(
                padding: EdgeInsets.only(left: 13),
                child: Text(translation(context).today,
                    style: const TextStyle(
                        color: Color(0xff0C8A7D),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        letterSpacing: -0.45)),
              ),
              Container(
                padding: EdgeInsets.only(left: 12, bottom: 10),
                child: Text(translation(context).am,
                    style: const TextStyle(
                        color: Color(0xff000000),
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                        letterSpacing: -0.45),
                    textAlign: TextAlign.start),
              ),*/

              Column(children: [
                ListView.builder(
                    itemCount: MList1.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return MedicineList(
                        img: MList1[index][0],
                        medicineName: MList1[index][1],
                        taskCompleted: MList1[index][2],
                        onChanged: (val) => checkBoxChanged1(val, index),
                        deleteFunction: (context) => deleteTask1(index),
                      );
                    }),
              ]),
              ...Times2.map((item) => ListTile(
                    title: Text(item.title,
                        style: const TextStyle(
                            color: Color(0xff0C8A7D),
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            letterSpacing: -0.45)),
                    subtitle: Text(item.subtitle,
                        style: const TextStyle(
                            color: Color(0xff000000),
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                            letterSpacing: -0.45)),
                  )),
              /*Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(left: 10),
                child: Text(translation(context).pm,
                    style: const TextStyle(
                        color: Color(0xff000000),
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                        letterSpacing: -0.45)),
              ),*/
              Column(children: [
                ListView.builder(
                    itemCount: MList2.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      return MedicineList(
                        img: MList2[index][0],
                        medicineName: MList2[index][1],
                        taskCompleted: MList2[index][2],
                        onChanged: (val) => checkBoxChanged2(val, index),
                        deleteFunction: (context) => deleteTask2(index),
                      );
                    }),
              ]),

              ...Times3.map((item) => ListTile(
                    title: Text(item.title,
                        style: const TextStyle(
                            color: Color(0xff0C8A7D),
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            letterSpacing: -0.45)),
                    subtitle: Text(item.subtitle,
                        style: const TextStyle(
                            color: Color(0xff000000),
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                            letterSpacing: -0.45)),
                  )),

              /*Container(
                child: ListTile(
                  title: Text(translation(context).monday,
                      style: const TextStyle(
                          color: Color(0xff0C8A7D),
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          letterSpacing: -0.45)),
                  subtitle: Text(translation(context).am9,
                      style: const TextStyle(
                          color: Color(0xff000000),
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                          letterSpacing: -0.45),
                      textAlign: TextAlign.start),
                ),
              ),*/
              Column(children: [
                ListView.builder(
                    itemCount: MList3.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      return MedicineList(
                        img: MList3[index][0],
                        medicineName: MList3[index][1],
                        taskCompleted: MList3[index][2],
                        onChanged: (val) => checkBoxChanged3(val, index),
                        deleteFunction: (context) => deleteTask3(index),
                      );
                    }),
              ]),

              //const SizedBox(height: 10),
            ]),
      ),
    );
  }
}

class MedicineTime {
  const MedicineTime({required this.title, required this.subtitle});

  final String title, subtitle;

  /*@override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title,
          style: const TextStyle(
              color: Color(0xff0C8A7D),
              fontSize: 20,
              fontWeight: FontWeight.bold,
              letterSpacing: -0.45)),
      subtitle: Text(subtitle,
          style: const TextStyle(
              color: Color(0xff000000),
              fontSize: 16,
              fontWeight: FontWeight.normal,
              letterSpacing: -0.45)),
    );
  }*/
}

class MedicineList extends StatelessWidget {
  var img;
  final String medicineName;
  final bool taskCompleted;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteFunction;

  MedicineList(
      {super.key,
      required this.medicineName,
      required this.taskCompleted,
      required this.onChanged,
      required this.img,
      required this.deleteFunction});

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(motion: StretchMotion(), children: [
        SlidableAction(
          onPressed: deleteFunction,
          icon: Icons.delete,
          backgroundColor: Colors.red.shade300,
          borderRadius: BorderRadius.circular(20),
        )
      ]),
      child: Container(
        decoration: BoxDecoration(
            color: const Color(0xffB0E3DC),
            borderRadius: BorderRadius.circular(20)),
        padding: const EdgeInsets.only(top: 5, bottom: 5, right: 3, left: 5),
        margin: const EdgeInsets.only(left: 5, right: 5, bottom: 4),
        child: ListTile(
          leading: Image.asset(img, width: 59, height: 59),
          title: Text(medicineName,
              style: TextStyle(
                  color: Color(0xff000000),
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  decoration: taskCompleted
                      ? TextDecoration.lineThrough
                      : TextDecoration.none)),
          trailing: Checkbox(
            activeColor: const Color(0xff72CEBF),
            shape:
                const CircleBorder(side: BorderSide(style: BorderStyle.none)),
            value: taskCompleted,
            onChanged: onChanged,
          ),
        ),
      ),
    );
  }
}

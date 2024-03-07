import 'dart:async';
import 'dart:ffi';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:flutter/cupertino.dart';

class Medicine extends StatefulWidget {
  const Medicine({Key? key}) : super(key: key);
  @override
  State<Medicine> createState() => _Medicine();
}

class _Medicine extends State<Medicine> {
  bool omega1 = false;
  bool vitamin = false;
  bool aspirin = false;
  bool vitaminD = false;
  bool omega2 = false;
  bool vitaminC = false;
  bool status = true;

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
                            icon: Icon(Icons.clear),
                            iconSize: 27,
                            color: Color(0xff0C8A7D),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.done),
                            iconSize: 27,
                            color: Color(0xff0C8A7D),
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
            title: const Text("Medicine",
                style: TextStyle(
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
                                      child: const Text("Name",
                                          style: TextStyle(
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
                                            cursorColor:
                                                const Color(0xff0C8A7D),
                                            decoration: const InputDecoration(
                                              border: OutlineInputBorder(),
                                              focusedBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Color(0xff0C8A7D)),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(14))),
                                              enabledBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Color(0xff0C8A7D)),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(14))),
                                            )),
                                      ),
                                    ),
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      padding: const EdgeInsets.only(left: 5),
                                      margin: const EdgeInsets.only(bottom: 3),
                                      child: const Text("Dosage",
                                          style: TextStyle(
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
                                            cursorColor:
                                                const Color(0xff0C8A7D),
                                            decoration: const InputDecoration(
                                              border: OutlineInputBorder(),
                                              focusedBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Color(0xff0C8A7D)),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(14))),
                                              enabledBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Color(0xff0C8A7D)),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(14))),
                                            )),
                                      ),
                                    ),
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      padding: const EdgeInsets.only(left: 5),
                                      margin: const EdgeInsets.only(bottom: 3),
                                      child: const Text("Time",
                                          style: TextStyle(
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
                                            cursorColor:
                                                const Color(0xff0C8A7D),
                                            decoration: const InputDecoration(
                                              border: OutlineInputBorder(),
                                              focusedBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Color(0xff0C8A7D)),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(14))),
                                              enabledBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Color(0xff0C8A7D)),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(14))),
                                            ),
                                            onTap: () {
                                              showTimePicker(context);}),
                                      ),
                                    ),
                                  ]),
                                ),
                              ),
                              actions: [
                                Expanded(
                                  child: Row(children: [
                                    MaterialButton(
                                        color: Color(0xff0C8A7D),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: const Text("ADD",
                                            style: TextStyle(
                                                color: Color(0xffFFFFFF),
                                                fontSize: 20,
                                                fontWeight: FontWeight.normal,
                                                letterSpacing: -0.45)),
                                        onPressed: () {}),
                                    const Spacer(),
                                    Switch(
                                        activeColor: const Color(0xff0C8A7D),
                                        activeTrackColor:
                                            Color.fromARGB(255, 38, 171, 158),
                                        inactiveThumbColor:
                                            Color(0xffD9D9D9), //الراس بس
                                        inactiveTrackColor:
                                            Color(0xffB0E3DC), //بالجسم
                                        value: status,
                                        onChanged: (value) {
                                          setState(() {
                                            status = value;
                                          });
                                        }),
                                    Icon(
                                      Icons.notifications_active,
                                      color: Color(0xff0C8A7D),
                                    )
                                  ]),
                                ),
                              ]);
                        });
                  }),
            ],
            elevation: 0.0),
        body: Expanded(
          child: SingleChildScrollView(
            child: Column(children: [
              const ListTile(
                title: Text("Today",
                    style: TextStyle(
                        color: Color(0xff0C8A7D),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        letterSpacing: -0.45)),
                subtitle: Text("07:00 am",
                    style: TextStyle(
                        color: Color(0xff000000),
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                        letterSpacing: -0.45),
                    textAlign: TextAlign.start),
              ),
              Container(
                decoration: BoxDecoration(
                    color: const Color(0xffB0E3DC),
                    borderRadius: BorderRadius.circular(20)),
                padding:
                    const EdgeInsets.only(top: 5, bottom: 5, right: 3, left: 5),
                margin: const EdgeInsets.only(left: 5, right: 5, bottom: 4),
                child: ListTile(
                  leading:
                      Image.asset("images/Pills.png", width: 59, height: 59),
                  title: const Text("Omega",
                      style: TextStyle(
                          color: Color(0xff000000),
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                  trailing: Checkbox(
                      activeColor: const Color(0xff72CEBF),
                      shape: const CircleBorder(
                          side: BorderSide(style: BorderStyle.none)),
                      value: omega1,
                      onChanged: (val) {
                        setState(() {
                          omega1 = val!;
                        });
                      }),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    color: const Color(0xffB0E3DC),
                    borderRadius: BorderRadius.circular(20)),
                padding:
                    const EdgeInsets.only(top: 5, bottom: 5, right: 3, left: 5),
                margin: const EdgeInsets.only(left: 5, right: 5, bottom: 20),
                child: ListTile(
                  leading: Image.asset("images/Pills (1).png",
                      width: 59, height: 59),
                  title: const Text("Vitamin",
                      style: TextStyle(
                          color: Color(0xff000000),
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                  trailing: Checkbox(
                      activeColor: const Color(0xff72CEBF),
                      shape: const CircleBorder(
                          side: BorderSide(style: BorderStyle.none)),
                      value: vitamin,
                      onChanged: (val) {
                        setState(() {
                          vitamin = val!;
                        });
                      }),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(left: 10),
                child: const Text("10:00 PM",
                    style: TextStyle(
                        color: Color(0xff000000),
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                        letterSpacing: -0.45)),
              ),
              Container(
                decoration: BoxDecoration(
                    color: const Color(0xffB0E3DC),
                    borderRadius: BorderRadius.circular(20)),
                padding:
                    const EdgeInsets.only(top: 5, bottom: 5, right: 3, left: 5),
                margin: const EdgeInsets.only(left: 5, right: 5, bottom: 4),
                child: ListTile(
                  leading: Image.asset("images/Pills (2).png",
                      width: 59, height: 59),
                  title: const Text("Aspirin",
                      style: TextStyle(
                          color: Color(0xff000000),
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                  trailing: Checkbox(
                      activeColor: const Color(0xff72CEBF),
                      shape: const CircleBorder(
                          side: BorderSide(style: BorderStyle.none)),
                      value: aspirin,
                      onChanged: (val) {
                        setState(() {
                          aspirin = val!;
                        });
                      }),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    color: const Color(0xffB0E3DC),
                    borderRadius: BorderRadius.circular(20)),
                padding:
                    const EdgeInsets.only(top: 5, bottom: 5, right: 3, left: 5),
                margin: const EdgeInsets.only(left: 5, right: 5, bottom: 8),
                child: ListTile(
                  leading: Image.asset("images/Pills (1).png",
                      width: 59, height: 59),
                  title: const Text("Vitamin D",
                      style: TextStyle(
                          color: Color(0xff000000),
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                  trailing: Checkbox(
                      activeColor: const Color(0xff72CEBF),
                      shape: const CircleBorder(
                          side: BorderSide(style: BorderStyle.none)),
                      value: vitaminD,
                      onChanged: (val) {
                        setState(() {
                          vitaminD = val!;
                        });
                      }),
                ),
              ),
              const ListTile(
                title: Text("Monday",
                    style: TextStyle(
                        color: Color(0xff0C8A7D),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        letterSpacing: -0.45)),
                subtitle: Text("09:00 am",
                    style: TextStyle(
                        color: Color(0xff000000),
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                        letterSpacing: -0.45),
                    textAlign: TextAlign.start),
              ),
              Container(
                decoration: BoxDecoration(
                    color: const Color(0xffB0E3DC),
                    borderRadius: BorderRadius.circular(20)),
                padding:
                    const EdgeInsets.only(top: 5, bottom: 5, right: 3, left: 5),
                margin: const EdgeInsets.only(left: 5, right: 5, bottom: 4),
                child: ListTile(
                  leading: Image.asset("images/Pills (3).png",
                      width: 59, height: 59),
                  title: const Text("Omega",
                      style: TextStyle(
                          color: Color(0xff000000),
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                  trailing: Checkbox(
                      activeColor: const Color(0xff72CEBF),
                      shape: const CircleBorder(
                          side: BorderSide(style: BorderStyle.none)),
                      value: omega2,
                      onChanged: (val) {
                        setState(() {
                          omega2 = val!;
                        });
                      }),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    color: const Color(0xffB0E3DC),
                    borderRadius: BorderRadius.circular(20)),
                padding:
                    const EdgeInsets.only(top: 5, bottom: 5, right: 3, left: 5),
                margin: const EdgeInsets.only(left: 5, right: 5, bottom: 10),
                child: ListTile(
                  leading: Image.asset("images/Pills (1).png",
                      width: 59, height: 59),
                  title: const Text(" Vitamin C",
                      style: TextStyle(
                          color: Color(0xff000000),
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                  trailing: Checkbox(
                      activeColor: const Color(0xff72CEBF),
                      shape: const CircleBorder(
                          side: BorderSide(style: BorderStyle.none)),
                      value: vitaminC,
                      onChanged: (val) {
                        setState(() {
                          vitaminC = val!;
                        });
                      }),
                ),
              )
            ]),
          ),
        ));
  }
}

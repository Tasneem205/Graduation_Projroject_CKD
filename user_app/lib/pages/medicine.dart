import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:user_app/Classes/language_constants.dart';

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
                                      }),
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
      body: ListView(
        children: 
        [
          //MedicineList(), MedicineList(), MedicineList()
        ],
      ),
      /*body: Expanded(
          child: SingleChildScrollView(
            child: Column(children: [
               ListTile(
                title: Text(translation(context).today,
                    style: const TextStyle(
                        color: Color(0xff0C8A7D),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        letterSpacing: -0.45)),
                subtitle: Text(translation(context).am,
                    style: const TextStyle(
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
                  title: Text(translation(context).omega,
                      style: const TextStyle(
                          color: Color(0xff000000),
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                  trailing:Checkbox(
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
                  title: Text(translation(context).vitamin,
                      style: const TextStyle(
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
                child: Text(translation(context).pm,
                    style: const TextStyle(
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
                  title: Text(translation(context).aspirin,
                      style: const TextStyle(
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
                  title: Text(translation(context).vitamind,
                      style: const TextStyle(
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
               ListTile(
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
                  title: Text(translation(context).omega,
                      style: const TextStyle(
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
                  title: Text(translation(context).vitaminc,
                      style: const TextStyle(
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
        )*/
    );
  }
}

/*class MedicineList extends StatelessWidget {
  final String medicineName;
  final bool taskCompleted;
  Function(bool?)? onChanged;

   MedicineList({
    super.key, 
    required this.medicineName, 
    required this.taskCompleted,
    required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: const Color(0xffB0E3DC),
          borderRadius: BorderRadius.circular(20)),
      padding: const EdgeInsets.only(top: 5, bottom: 5, right: 3, left: 5),
      margin: const EdgeInsets.only(left: 5, right: 5, bottom: 4),
      child: ListTile(
        leading: Image.asset("images/Pills.png", width: 59, height: 59),
        title: Text(medicineName,
            style: const TextStyle(
                color: Color(0xff000000),
                fontSize: 20,
                fontWeight: FontWeight.bold)),
        trailing: Checkbox(
            activeColor: const Color(0xff72CEBF),
            shape:
                const CircleBorder(side: BorderSide(style: BorderStyle.none)),
            value: omega1,
            onChanged: (val) {
              setState(() {
                omega1 = val!;
              });
            }),
      ),
    );
  }
}*/

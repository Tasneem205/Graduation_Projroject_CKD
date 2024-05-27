import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:image_picker/image_picker.dart';
import 'package:user_app/Classes/language_constants.dart';

class Medicine extends StatefulWidget {
  const Medicine({Key? key}) : super(key: key);

  @override
  State<Medicine> createState() => _Medicine();
}

class _Medicine extends State<Medicine> {
  TextEditingController MedicineNameController = TextEditingController();
  bool status = true;
  List<MedicineTime> medicineTimes = [
    const MedicineTime(title: "Mon, Wed, Fri", subtitle: "09:00 AM"),
    const MedicineTime(title: "Tue, Thu, Sat", subtitle: "10:00 PM"),
    const MedicineTime(title: "Mon", subtitle: "10:00 PM"),
  ];
  List<List<dynamic>> medicineLists = [
    [
      [const AssetImage('images/Pills.png'), "Omega", false],
      [const AssetImage('images/Pills (1).png'), "Vitamin", false],
    ],
    [
      [const AssetImage('images/Pills (2).png'), "Aspirin", false],
      [const AssetImage('images/Pills (1).png'), "Vitamin D", false],
    ],
    [
      [const AssetImage('images/Pills (3).png'), "Omega", false],
      [const AssetImage('images/Pills (1).png'), "Vitamin C", false],
    ],
  ];

  // Function to create a new medicine entry
  Future<void> _createNewMedicineEntry() async {
    String? medicineName;
    Image? medicineImage;
    TimeOfDay? selectedTime;
    List<String> selectedDays = [];

    await showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(builder: (context, setState) {
          return AlertDialog(
            content: Expanded(
              child: Container(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Text field for medicine name
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Medicine Name',
                          labelStyle:
                              TextStyle(color: Color(0xff0C8A7D), fontSize: 16),
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Color(0xff0C8A7D))),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Color(0xff0C8A7D))),
                        ),
                        cursorColor: const Color(0xff0C8A7D),
                        controller: MedicineNameController,
                        onChanged: (value) {
                          medicineName = value;
                        },
                      ),
                      // Image picker
                      medicineImage == null
                          ? SizedBox(
                              height: 48,
                              width: double.infinity,
                              child: TextButton(
                                onPressed: () async {
                                  final pickedFile = await ImagePicker()
                                      .pickImage(source: ImageSource.gallery);
                                  if (pickedFile != null) {
                                    setState(() {
                                      medicineImage =
                                          Image.file(File(pickedFile.path));
                                    });
                                  }
                                },
                                child: const Text('Select Image',
                                    style: TextStyle(
                                        color: Color(0xff0C8A7D),
                                        fontSize: 16)),
                              ),
                            )
                          : SizedBox(
                              height: 59, width: 59, child: medicineImage!),
                      // Time picker
                      Row(
                        children: [
                          const Text('Time:',
                              style: TextStyle(
                                  color: Color(0xff000000), fontSize: 16)),
                          TextButton(
                            onPressed: () async {
                              selectedTime = await showTimePicker(
                                context: context,
                                initialTime: TimeOfDay.now(),
                                confirmText: "Ok",
                                cancelText: "Cancel",
                              );
                              setState(() {});
                            },
                            child: Text(
                                selectedTime != null
                                    ? selectedTime!.format(context)
                                    : 'Select Time',
                                style: const TextStyle(
                                    color: Color(0xff0C8A7D), fontSize: 16)),
                          ),
                        ],
                      ),

                      // Day selection checkboxes
                      Column(
                        children: [
                          const Text('Days:',
                              style: TextStyle(
                                  color: Color(0xff000000), fontSize: 16)),
                          const SizedBox(height: 8.0),
                          SizedBox(
                            height: 100,
                            child: ListView(
                              scrollDirection:
                                  Axis.horizontal, // For horizontal scrolling
                              children: [
                                ...daysOfWeek
                                    .map((day) => SizedBox(
                                          width: 130,
                                          child: CheckboxListTile(
                                            title: Text(day,
                                                style: const TextStyle(
                                                    color: Color(0xff0C8A7D),
                                                    fontSize: 16)),
                                            activeColor:
                                                const Color(0xff0C8A7D),
                                            value: selectedDays.contains(day),
                                            onChanged: (value) {
                                              setState(() {
                                                if (value!) {
                                                  selectedDays.add(day);
                                                } else {
                                                  selectedDays.remove(day);
                                                }
                                              });
                                            },
                                          ),
                                        ))
                                    .toList(),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Row(children: [
                        MaterialButton(
                            color: const Color(0xff0C8A7D),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            child: Text(translation(context).add,
                                style: const TextStyle(
                                    color: Color(0xffFFFFFF),
                                    fontSize: 20,
                                    fontWeight: FontWeight.normal,
                                    letterSpacing: -0.45)),
                            onPressed: () {
                              if (medicineName != null &&
                                  medicineName!.isNotEmpty &&
                                  selectedTime != null &&
                                  selectedDays.isNotEmpty) {
                                _addMedicineEntry(
                                    medicineName!,
                                    medicineImage != null
                                        ? medicineImage!.image
                                        : const AssetImage('images/Pills.png'),
                                    selectedTime!,
                                    selectedDays);

                                Navigator.of(context).pop();
                              }
                            }),
                        Spacer(),
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
                        const Icon(
                          Icons.notifications_active,
                          color: Color(0xff0C8A7D),
                        )
                      ])
                    ],
                  ),
                ),
              ),
            ),
          );
        });
      },
    ).then((_) {
      setState(() {});
    });
  }

  void _addMedicineEntry(
      String name, ImageProvider image, TimeOfDay time, List<String> days) {
    // Create a new medicine list for the new time and days combination
    setState(() {
      medicineLists.add([
        [image, name, false]
      ]);
      medicineTimes.add(
          MedicineTime(title: days.join(', '), subtitle: time.format(context)));
    });
  }

  //Checked was tapped
  void checkBoxChanged(bool? value, int listIndex, int itemIndex) {
    setState(() {
      medicineLists[listIndex][itemIndex][2] =
          !medicineLists[listIndex][itemIndex][2];
    });
  }

  //delete task
  deleteTask(int listIndex, int itemIndex) {
    setState(() {
      medicineLists[listIndex].removeAt(itemIndex);
      if (medicineLists[listIndex].isEmpty) {
        medicineTimes.removeAt(listIndex);
        medicineLists.removeAt(listIndex);
      }
    });
  }

  final List<String> daysOfWeek = [
    'Mon',
    'Tue',
    'Wed',
    'Thu',
    'Fri',
    'Sat',
    'Sun'
  ];
  bool isSelectedAm = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          translation(context).medicine,
          style: const TextStyle(
            color: Color(0xff0C8A7D),
            fontSize: 24,
            fontWeight: FontWeight.normal,
            letterSpacing: -0.45,
          ),
          textAlign: TextAlign.start,
        ),
        actions: [
          IconButton(
            icon: Image.asset("images/Plus.png"),
            onPressed: () {
              _createNewMedicineEntry();
            },
          ),
        ],
        elevation: 0.0,
        iconTheme: const IconThemeData(color: Color(0xff0C8A7D), size: 28),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            ...List.generate(medicineTimes.length, (listIndex) {
              final medicineTime = medicineTimes[listIndex];
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    title: Text(
                      medicineTime.title,
                      style: const TextStyle(
                        color: Color(0xff0C8A7D),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        letterSpacing: -0.45,
                      ),
                    ),
                    subtitle: Text(
                      medicineTime.subtitle,
                      style: const TextStyle(
                        color: Color(0xff000000),
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                        letterSpacing: -0.45,
                      ),
                    ),
                  ),
                  ListView.builder(
                    itemCount: medicineLists[listIndex].length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, itemIndex) {
                      return MedicineList(
                        img: medicineLists[listIndex][itemIndex][0],
                        medicineName: medicineLists[listIndex][itemIndex][1],
                        taskCompleted: medicineLists[listIndex][itemIndex][2],
                        onChanged: (val) =>
                            checkBoxChanged(val, listIndex, itemIndex),
                        deleteFunction: (context) =>
                            deleteTask(listIndex, itemIndex),
                      );
                    },
                  ),
                ],
              );
            }),
          ],
        ),
      ),
    );
  }
}

class MedicineTime {
  const MedicineTime({required this.title, required this.subtitle});

  final String title, subtitle;
}

class MedicineList extends StatelessWidget {
  final ImageProvider img;
  final String medicineName;
  final bool taskCompleted;
  final Function(bool?)? onChanged;
  final Function(BuildContext)? deleteFunction;

  MedicineList({
    super.key,
    required this.medicineName,
    required this.taskCompleted,
    required this.onChanged,
    required this.img,
    required this.deleteFunction,
  });

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(
        motion: const StretchMotion(),
        children: [
          SlidableAction(
            onPressed: deleteFunction,
            icon: Icons.delete,
            backgroundColor: Colors.red.shade300,
            borderRadius: BorderRadius.circular(20),
          )
        ],
      ),
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xffB0E3DC),
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.only(top: 5, bottom: 5, right: 3, left: 5),
        margin: const EdgeInsets.only(left: 5, right: 5, bottom: 4),
        child: ListTile(
          leading: Image(
            image: img,
            width: 59,
            height: 59,
          ),
          title: Text(
            medicineName,
            style: TextStyle(
              color: const Color(0xff000000),
              fontSize: 20,
              fontWeight: FontWeight.bold,
              decoration: taskCompleted
                  ? TextDecoration.lineThrough
                  : TextDecoration.none,
            ),
          ),
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

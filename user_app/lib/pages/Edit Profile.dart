import 'dart:io' as io;
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:user_app/Classes/language_constants.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});
  @override
  State<EditProfile> createState() => _EditProfile();
}

class _EditProfile extends State<EditProfile> {
  Uint8List? _image;
  io.File? selectedImage;
  late String path;
  String? FirstName;
  String? LastName;
  String? phone;
  String? password;
  String? height;
  String? weight;
  final TextEditingController firstnameController = TextEditingController();
  final TextEditingController lastnameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController heightController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  GlobalKey<FormState> formstate1 = GlobalKey();
  GlobalKey<FormState> formstate2 = GlobalKey();
  GlobalKey<FormState> formstate3 = GlobalKey();
  GlobalKey<FormState> formstate4 = GlobalKey();
  GlobalKey<FormState> formstate5 = GlobalKey();
  GlobalKey<FormState> formstate6 = GlobalKey();

  @override
  void initState() {
    super.initState();
  }

  Widget bottomSheet() {
    return Container(
      height: 200,
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(10),
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        Text(translation(context).profile,
            style: const TextStyle(
                color: Color(0xff000000),
                fontSize: 24,
                fontWeight: FontWeight.normal)),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          MaterialButton(
            child: Column(children: [
              const Icon(
                Icons.camera_alt,
                size: 50,
                color: Color(0xff0C8A7D),
              ),
              Text(translation(context).camera)
            ]),
            onPressed: () {
              _pickImageFromCamera();
            },
          ),
          MaterialButton(
            child: Column(children: [
              const Icon(Icons.image, size: 50, color: Color(0xff0C8A7D)),
              Text(translation(context).gallery)
            ]),
            onPressed: () {
              _pickImageFromGallery();
            },
          ),
        ]),
      ]),
    );
  }

//Gallery
  Future _pickImageFromGallery() async {
    final returnImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (returnImage == null) return;
    setState(() {
      selectedImage = io.File(returnImage.path);
      _image = io.File(returnImage.path).readAsBytesSync();
    });
    Navigator.of(context).pop();
  }

  //Camera
  Future _pickImageFromCamera() async {
    final returnImage =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (returnImage == null) return;
    setState(() {
      selectedImage = io.File(returnImage.path);
      _image = io.File(returnImage.path).readAsBytesSync();
    });
    Navigator.of(context).pop();
  }

  void Saveimage(path) async {
    SharedPreferences saveimage = await SharedPreferences.getInstance();
    saveimage.setString(translation(context).path, path);
  }

  Future<void> LoadImage() async {
    SharedPreferences saveimage = await SharedPreferences.getInstance();
    setState(() {
      _image = saveimage.getString(translation(context).path) as Uint8List?;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF1F6FC),
      appBar: AppBar(
        backgroundColor: const Color(0xffF1F6FC),
        title: Text(translation(context).editpro,
            style: const TextStyle(
                color: Color(0xff0C8A7D),
                fontSize: 24,
                fontWeight: FontWeight.normal)),
        elevation: 0.0,
        iconTheme: const IconThemeData(color: Color(0xff0C8A7D), size: 27),
      ),
      body: Expanded(
        child: Center(
            child: ListView(
                padding: const EdgeInsets.only(
                    top: 10, bottom: 10, right: 30, left: 30),
                children: [
              Column(children: [
                // Profile image
                _image != null
                    ? CircleAvatar(
                        radius: 60, backgroundImage: MemoryImage(_image!))
                    : const CircleAvatar(
                        radius: 60,
                        backgroundColor: Color(0xffF1F6FC),
                        backgroundImage: AssetImage("images/profile.png")),
                // Change photo button
                Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  child: TextButton(
                      child: Text(translation(context).photo,
                          style: const TextStyle(
                              color: Color(0xff000000),
                              fontSize: 24,
                              fontWeight: FontWeight.normal)),
                      onPressed: () {
                        showModalBottomSheet(
                            backgroundColor: const Color(0xffF1F6FC),
                            context: context,
                            builder: ((builder) => bottomSheet()));
                      }),
                ),
                // FirstName input field
                Container(
                  padding: const EdgeInsets.all(10),
                  child: Form(
                    key: formstate1,
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return translation(context).required;
                        }
                        return null;
                      },
                      onSaved: (Val) {
                        FirstName = Val;
                      },
                      controller: firstnameController,
                      keyboardType: TextInputType.text,
                      cursorColor: const Color(0xff0C8A7D),
                      decoration: InputDecoration(
                        labelText: translation(context).fname,
                        labelStyle: const TextStyle(
                            color: Color(0xff0C8A7D),
                            fontSize: 18,
                            fontWeight: FontWeight.normal),
                        border: const OutlineInputBorder(),
                        focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xff0C8A7D)),
                            borderRadius:
                                BorderRadius.all(Radius.circular(14))),
                        enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xff0C8A7D)),
                            borderRadius:
                                BorderRadius.all(Radius.circular(14))),
                      ),
                    ),
                  ),
                ),
                // LastName input field
                Container(
                  padding: const EdgeInsets.all(10),
                  child: Form(
                    key: formstate2,
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return translation(context).required;
                        }
                        return null;
                      },
                      onSaved: (Val) {
                        LastName = Val;
                      },
                      controller: lastnameController,
                      keyboardType: TextInputType.text,
                      cursorColor: const Color(0xff0C8A7D),
                      decoration: InputDecoration(
                        labelText: translation(context).lname,
                        labelStyle: const TextStyle(
                            color: Color(0xff0C8A7D),
                            fontSize: 18,
                            fontWeight: FontWeight.normal),
                        border: const OutlineInputBorder(),
                        focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xff0C8A7D)),
                            borderRadius:
                                BorderRadius.all(Radius.circular(14))),
                        enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xff0C8A7D)),
                            borderRadius:
                                BorderRadius.all(Radius.circular(14))),
                      ),
                    ),
                  ),
                ),
                // phone input field
                Container(
                  padding: const EdgeInsets.all(10),
                  child: Form(
                    key: formstate3,
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return translation(context).required;
                        }
                        return null;
                      },
                      onSaved: (Val) {
                        phone = Val;
                      },
                      controller: phoneController,
                      keyboardType: TextInputType.phone,
                      cursorColor: const Color(0xff0C8A7D),
                      decoration: InputDecoration(
                        labelText: translation(context).ph,
                        labelStyle: const TextStyle(
                            color: Color(0xff0C8A7D),
                            fontSize: 18,
                            fontWeight: FontWeight.normal),
                        border: const OutlineInputBorder(),
                        focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xff0C8A7D)),
                            borderRadius:
                                BorderRadius.all(Radius.circular(14))),
                        enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xff0C8A7D)),
                            borderRadius:
                                BorderRadius.all(Radius.circular(14))),
                      ),
                    ),
                  ),
                ),
                // password input field
                Container(
                  padding: const EdgeInsets.all(10),
                  child: Form(
                    key: formstate4,
                    child: TextFormField(
                      
                      validator: (value) {
                        if (value!.isEmpty) {
                          return translation(context).required;
                        }
                        return null;
                      },
                      onSaved: (Val) {
                        password = Val;
                      },
                      controller: passwordController,
                      cursorColor: const Color(0xff0C8A7D),
                      decoration: InputDecoration(
                        labelText: translation(context).pass,
                        labelStyle: const TextStyle(
                            color: Color(0xff0C8A7D),
                            fontSize: 18,
                            fontWeight: FontWeight.normal),
                        border: const OutlineInputBorder(),
                        focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xff0C8A7D)),
                            borderRadius:
                                BorderRadius.all(Radius.circular(14))),
                        enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xff0C8A7D)),
                            borderRadius:
                                BorderRadius.all(Radius.circular(14))),
                      ),
                    ),
                  ),
                ),
                // height input field
                Container(
                  padding: const EdgeInsets.all(10),
                  child: Form(
                    key: formstate5,
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return translation(context).required;
                        }
                        return null;
                      },
                      onSaved: (Val) {
                        height = Val;
                      },
                      controller: heightController,
                      keyboardType: TextInputType.number,
                      cursorColor: const Color(0xff0C8A7D),
                      decoration: InputDecoration(
                        labelText: translation(context).hight,
                        labelStyle: const TextStyle(
                            color: Color(0xff0C8A7D),
                            fontSize: 18,
                            fontWeight: FontWeight.normal),
                        border: const OutlineInputBorder(),
                        focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xff0C8A7D)),
                            borderRadius:
                                BorderRadius.all(Radius.circular(14))),
                        enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xff0C8A7D)),
                            borderRadius:
                                BorderRadius.all(Radius.circular(14))),
                      ),
                    ),
                  ),
                ),
                // weight input field
                Container(
                  padding: const EdgeInsets.all(10),
                  child: Form(
                    key: formstate6,
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return translation(context).required;
                        }
                        return null;
                      },
                      onSaved: (Val) {
                        weight = Val;
                      },
                      controller: weightController,
                      keyboardType: TextInputType.number,
                      cursorColor: const Color(0xff0C8A7D),
                      decoration: InputDecoration(
                        labelText: translation(context).weight,
                        labelStyle: const TextStyle(
                            color: Color(0xff0C8A7D),
                            fontSize: 18,
                            fontWeight: FontWeight.normal),
                        border: const OutlineInputBorder(),
                        focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xff0C8A7D)),
                            borderRadius:
                                BorderRadius.all(Radius.circular(14))),
                        enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xff0C8A7D)),
                            borderRadius:
                                BorderRadius.all(Radius.circular(14))),
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                  Container(
                    //alignment: Alignment.center,
                    child: MaterialButton(
                      color: const Color(0xff0C8A7D),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: Text(
                        translation(context).save,
                        style: const TextStyle(
                            color: Color(0xffFFFFFF),
                            fontSize: 24,
                            fontWeight: FontWeight.normal),
                        textAlign: TextAlign.center,
                      ),
                      onPressed: () {
                        Saveimage(_image);
                        if (formstate1.currentState!.validate() &&
                            formstate2.currentState!.validate() &&
                            formstate3.currentState!.validate() &&
                            formstate4.currentState!.validate() &&
                            formstate5.currentState!.validate() &&
                            formstate6.currentState!.validate()) {
                          formstate1.currentState!.save();
                          formstate2.currentState!.save();
                          formstate3.currentState!.save();
                          formstate4.currentState!.save();
                          formstate5.currentState!.save();
                          formstate6.currentState!.save();
                        }
                      },
                    ),
                  ),
                  Container(
                    //alignment: Alignment.center,
                    child: MaterialButton(
                      color: const Color(0xff0C8A7D),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: Text(
                        translation(context).cancel,
                        style: const TextStyle(
                            color: Color(0xffFFFFFF),
                            fontSize: 24,
                            fontWeight: FontWeight.normal),
                        textAlign: TextAlign.center,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ])
              ])
            ])),
      ),
    );
  }
}

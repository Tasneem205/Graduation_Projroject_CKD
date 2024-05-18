import 'package:flutter/material.dart';
import 'package:user_app/Classes/language_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:user_app/pages/home.dart';

class Login extends StatefulWidget {
  const Login({super.key});
  @override
  State<Login> createState() => _Login();
}

class _Login extends State<Login> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formstate1 = GlobalKey();
  GlobalKey<FormState> formstate2 = GlobalKey();

  saveprefs() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString("name", nameController.text);
    sharedPreferences.setString("password", passwordController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFFFFF),
      body: Expanded(
        child: ListView(
          children: [
            Image.asset(
              'images/One.jpg',
            ),
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: Text(
                  translation(context).sign,
                  style: const TextStyle(
                      color: Color.fromRGBO(12, 138, 125, 1),
                      fontWeight: FontWeight.w500,
                      fontSize: 35),
                )),
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: Text(
                  translation(context).hello,
                  style: const TextStyle(
                      color: Color.fromRGBO(12, 138, 125, 1), fontSize: 20),
                )),
            Container(
              padding: const EdgeInsets.all(10),
              child: Form(
                key: formstate1,
                child: TextFormField(
                  /*validator: (value) {
                    if (value!.isEmpty) {
                      return translation(context).required;
                    }
                  },*/
                  cursorColor: const Color(0xff0C8A7D),
                  keyboardType: TextInputType.name,
                  controller: nameController,
                  decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff0C8A7D)),
                          borderRadius: BorderRadius.all(Radius.circular(14))),
                      enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff0C8A7D)),
                          borderRadius: BorderRadius.all(Radius.circular(14))),
                      hintText: translation(context).namehint,
                      hintStyle: const TextStyle(
                          color: Color(0xff67B6AE),
                          fontSize: 12,
                          fontWeight: FontWeight.w200),
                      labelText: translation(context).namehint,
                      labelStyle:
                          const TextStyle(color: Color(0xff0C8A7D), fontSize: 18)),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: Form(
                key: formstate2,
                child: TextFormField(
                  /*validator: (value) {
                    if (value!.isEmpty) {
                      return translation(context).required;
                    }
                  },*/
                  cursorColor: const Color(0xff0C8A7D),
                  obscureText: true,
                  controller: passwordController,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xff0C8A7D)),
                        borderRadius: BorderRadius.all(Radius.circular(14))),
                    enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xff0C8A7D)),
                        borderRadius: BorderRadius.all(Radius.circular(14))),
                    hintText: translation(context).pass,
                    hintStyle: const TextStyle(
                        color: Color(0xff67B6AE),
                        fontSize: 12,
                        fontWeight: FontWeight.w200),
                    labelText: translation(context).pass,
                    labelStyle:
                        const TextStyle(color: Color(0xff0C8A7D), fontSize: 18),
                  ),
                ),
              ),
            ),
            Container(
                height: 50,
                padding: const EdgeInsets.fromLTRB(120, 10, 120, 0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff0C8A7D),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  onPressed: () async {
                    /*if (formstate1.currentState!.validate()) {
                      print(translation(context).valid);
                    } else {
                      print(translation(context).notvalid);
                    }
                    if (formstate2.currentState!.validate()) {
                      print(translation(context).valid);
                    } else {
                      print(translation(context).notvalid);
                    }

                    await saveprefs();

                    if (formstate1.currentState!.validate() &
                        formstate2.currentState!.validate()) {*/
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) => const Home()));
                    //}
                    print(nameController.text);
                    print(passwordController.text);
                  },
                  child: Text(translation(context).login,
                      style: const TextStyle(color: Color(0xffFFFFFF), fontSize: 24)),
                )),
            Expanded(
              child: Image.asset(
                'images/Two.jpg',
                height: 300,
                fit: BoxFit.fill,
              ),
            ),
          ],
        ),
      ),
    );
  }
}


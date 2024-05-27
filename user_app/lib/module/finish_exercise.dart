import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:user_app/Classes/language_constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            // appBar: AppBar(title: const Text("App")),
            body: Container(
                child: Stack(children: [
          // blur image

          ClipRRect(
            child: ImageFiltered(
              imageFilter: ImageFilter.blur(sigmaX: 10, sigmaY: 5),
              child: Image.asset(
                "images/istockphoto-1266230326-612x612.jpg",
                fit: BoxFit.fill,
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.center,
              ),
            ),
          ),
          Center(
              child: Container(
            margin: const EdgeInsets.all(100),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  translation(context).rock,
                  style: const TextStyle(
                      color: Color.fromRGBO(12, 138, 125, 1),
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("images/Quick Mode On.png"),
                      const SharedColorText(
                        text: '10',
                      ),
                      SharedColorText(
                        text: translation(context).exercise,
                      )
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    children: [
                      Image.asset("images/Fire.png"),
                      const SharedColorText(
                        text: '49',
                      ),
                      SharedColorText(
                        text: translation(context).calries,
                      )
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    children: [
                      Image.asset("images/Time.png"),
                      const SharedColorText(
                        text: '05:00',
                      ),
                      SharedColorText(
                        text: translation(context).minutes,
                      )
                    ],
                  ),
                ),
                Text(
                  translation(context).done,
                  style: const TextStyle(
                      color: Color.fromRGBO(12, 138, 125, 0.54), fontSize: 20),
                )
              ],
            ),
          ))
        ]))));
  }
}

class SharedColorText extends StatelessWidget {
  final String text;
  final double fontSize;
  const SharedColorText({
    super.key,
    required this.text,
    this.fontSize = 16,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: const Color.fromARGB(255, 255, 255, 255),
          fontSize: fontSize,
          fontWeight: FontWeight.bold),
    );
  }
}

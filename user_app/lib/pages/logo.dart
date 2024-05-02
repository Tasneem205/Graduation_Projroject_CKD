import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:user_app/Classes/language_constants.dart';
import 'package:user_app/pages/login.dart';


class Logo extends StatefulWidget {
  const Logo({super.key});

  @override
  State<Logo> createState() => _Logo();
}

class _Logo extends State<Logo> with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (_) => const Login(),
        ));
    });
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: Expanded(
            child: Stack(children: [
              Container(color: const Color(0xff0C8A7D)),
              Positioned(
                left: 102,
                top: 610,
                child: Text(translation(context).logo,
                style: const TextStyle(
                  color: Color(0xffffffff),
                  fontWeight: FontWeight.bold,
                  fontSize: 26)),),
              Positioned(
                child: Container(
                  width: double.infinity,
                  height: 550,
                  decoration: const BoxDecoration(
                    color: Color(0xffffffff),
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Image.asset(
                      "images/happy kidney day.jpg",
                      alignment: Alignment.center ),
                  ),
                  )
        ]),
        ),
        ),
        );
  }
}



import 'package:flutter/material.dart';
import 'package:user_app/Classes/language_constants.dart';
import 'package:user_app/pages/Edit%20Profile.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});
  @override
  State<Profile> createState() => _Profile();
}

class _Profile extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF2F7FD),
      appBar: AppBar(
        backgroundColor: Color(0xffF2F7FD),
          title: Text(translation(context).profile,
              style: const TextStyle(
                  color: Color(0xff0C8A7D),
                  fontSize: 24,
                  fontWeight: FontWeight.normal),
              textAlign: TextAlign.start),
          actions: [
            TextButton(
              child: Text(translation(context).edit,
                  style: const TextStyle(
                      color: Color(0xffEE7666),
                      fontSize: 22,
                      fontWeight: FontWeight.normal)),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const EditProfile()));
              },
            ),
          ],
          elevation: 0.0,
          iconTheme: const IconThemeData(color: Color(0xff0C8A7D), size: 27)),
      body: SingleChildScrollView(
        child: Column(children: [
          ListTile(
            leading: Container(child: Image.asset("images/profile.png")),
            title: Text(translation(context).namehint,
                style: const TextStyle(
                    color: Color(0xff0C8A7D),
                    fontSize: 22,
                    fontWeight: FontWeight.normal)),
            subtitle: const Text("18/04/1996 - 28 years old",
                style: TextStyle(
                    color: Color(0xff000000),
                    fontSize: 12,
                    fontWeight: FontWeight.normal)),
          ),
          Card(
            color: Colors.white,
            child: Column(children: [
              ProfileInfo(
                  leadingtitle: translation(context).pass,
                  trailingtitle: "2000900"),
              ProfileInfo(
                  leadingtitle: translation(context).gen,
                  trailingtitle: translation(context).female),
              ProfileInfo(
                  leadingtitle: translation(context).ph,
                  trailingtitle: "+2011195252"),
              ProfileInfo(
                  leadingtitle: translation(context).phh,
                  trailingtitle: "+2011195002"),
              ProfileInfo(
                  leadingtitle: translation(context).email,
                  trailingtitle: "username@gmail.con"),
              ProfileInfo(
                  leadingtitle: translation(context).bloodgroup,
                  trailingtitle: "A+"),
              ProfileInfo(
                  leadingtitle: translation(context).hight,
                  trailingtitle: "169"),
              ProfileInfo(
                  leadingtitle: translation(context).weight,
                  trailingtitle: "65"),
            ]),
          ),
          Container(
              decoration: BoxDecoration(
                  color: const Color(0xffFDDDE5),
                  borderRadius: BorderRadius.circular(20)),
              margin: const EdgeInsets.all(10),
              child: Tile(
                  img: "images/heart.png",
                  title: translation(context).heartrate,
                  subtitle: "72 bpm")),
          Container(
              decoration: BoxDecoration(
                  color: const Color(0xffDBEBF9),
                  borderRadius: BorderRadius.circular(20)),
              margin: const EdgeInsets.all(10),
              child: Tile(
                img: "images/Tonometer.png",
                title: translation(context).blood,
                subtitle: "120/60",
              )),
          Container(
              decoration: BoxDecoration(
                  color: const Color(0xffFEE7E1),
                  borderRadius: BorderRadius.circular(20)),
              margin: const EdgeInsets.all(10),
              child: Tile(
                  img: "images/Glucometer.png",
                  title: translation(context).diabetes,
                  subtitle: "113")),
        ]),
      ),
    );
  }
}

class ProfileInfo extends StatelessWidget {
  const ProfileInfo(
      {super.key, required this.leadingtitle, required this.trailingtitle});

  final String leadingtitle, trailingtitle;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(leadingtitle,
          style: const TextStyle(
              color: Color(0xff0C8A7D),
              fontSize: 18,
              fontWeight: FontWeight.normal)),
      trailing: Text(trailingtitle,
          style: const TextStyle(
              color: Color(0xff000000),
              fontSize: 18,
              fontWeight: FontWeight.normal)),
    );
  }
}

class Tile extends StatelessWidget {
  const Tile(
      {super.key,
      required this.title,
      required this.img,
      required this.subtitle});

  final String title, img, subtitle;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(img),
      title: Text(title,
          style: const TextStyle(
              color: Color(0xff000000),
              fontSize: 20,
              fontWeight: FontWeight.bold)),
      subtitle: Text(subtitle,
          style: const TextStyle(
              color: Color(0xff000000),
              fontSize: 20,
              fontWeight: FontWeight.normal)),
    );
  }
}

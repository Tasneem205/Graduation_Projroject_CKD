import 'package:flutter/material.dart';
import 'package:user_app/Classes/language_constants.dart';
import 'package:user_app/pages/Walking.dart';

class Notifications extends StatefulWidget {
  const Notifications({super.key});

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Expanded(
        child: Scaffold(
          appBar: AppBar(
              title: Center(
                child: Text(translation(context).notification,
                    style: const TextStyle(
                        color: Color(0xff0C8A7D),
                        fontSize: 33,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.start),
              ),
              bottom: TabBar(
                  indicatorColor: const Color(0xFF0E725B),
                  splashBorderRadius: BorderRadius.circular(40),
                  tabAlignment: TabAlignment.center,
                  dividerHeight: BorderSide.strokeAlignOutside,
                  dividerColor: const Color.fromARGB(65, 204, 204, 204),
                  unselectedLabelStyle: const TextStyle(
                    color: Color.fromARGB(65, 204, 204, 204),
                  ),
                  tabs: [
                    Tab(
                      child: Text(
                        translation(context).allnotification,
                        style: const TextStyle(
                          color: Color(0xff0C8A7D),
                          fontSize: 24,
                        ),
                      ),
                    ),
                    Tab(
                      child: Text(
                        translation(context).unread,
                        style: const TextStyle(
                          color: Color(0xff0C8A7D),
                          fontSize: 24,
                        ),
                      ),
                    ),
                  ]),
              elevation: 0.0,
              iconTheme:
                  const IconThemeData(color: Color(0xff0C8A7D), size: 27)),
          body: TabBarView(
            children: [
              SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Text(translation(context).today,
                        style: const TextStyle(
                          color: Color(0xFF0E725B),
                          fontSize: 24,
                        )),
                    const SizedBox(
                      height: 10,
                    ),
                    const NotificationList(),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 10, bottom: 10),
                      child: Text(translation(context).yesterday,
                          style: const TextStyle(
                            color: Color(0xFF0E725B),
                            fontSize: 24,
                          )),
                    ),
                    const NotificationList(),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 10),
                      child: Text(
                        translation(context).past,
                        style: const TextStyle(
                          color: Color(0xFF0E725B),
                          fontSize: 24,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const NotificationList(),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
              SingleChildScrollView(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        translation(context).today,
                        style: const TextStyle(
                          color: Color(0xFF0E725B),
                          fontSize: 24,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const NotificationList(),
                      const SizedBox(
                        height: 10,
                      ),
                    ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NotificationList extends StatelessWidget {
  const NotificationList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 3,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: MaterialButton(
                onPressed: () {},
                child: ContainerCard(
                  containerWidget: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          "assets/img/Group 73.png",
                          width: 50,
                          height: 50,
                        ),
                      ]),
                ),
              ));
        });
  }
}

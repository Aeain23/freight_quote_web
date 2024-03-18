import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:FreightQuote/constants/style.dart';
import 'package:FreightQuote/helpers/responsive.dart';
import 'package:FreightQuote/widgets/correspondence_screen.dart';
import 'package:FreightQuote/widgets/freight_charge_screen.dart';
import 'package:FreightQuote/widgets/login_screen.dart';
import 'package:FreightQuote/widgets/top_nav.dart';
import 'package:panara_dialogs/panara_dialogs.dart';
import 'package:sidebarx/sidebarx.dart';

class DashboardScreen extends StatefulWidget {
  static const routeName = '/dashboardScreen';
  final String username;
  final String password;
  final String email;
  DashboardScreen(
      {required this.username, required this.password, required this.email});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  itemDashboard(String title, Widget iconData, Color background,
          BuildContext context, screen) =>
      GestureDetector(
        onTap: () {
          if (title == 'Correspondence') {
            Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => CorrespondenceScreen(),
            ));
          } else {
            Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => FreightChargeScreen(),
            ));
          }
        },
        child: Container(
          height: screen == true
              ? MediaQuery.of(context).size.height / 4
              : MediaQuery.of(context).size.height / 50,
          width: screen == true
              ? MediaQuery.of(context).size.width / 4
              : MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(screen == true ? 20 : 10),
              boxShadow: [
                BoxShadow(
                    offset: const Offset(0, 5),
                    color: Theme.of(context).primaryColor.withOpacity(.2),
                    spreadRadius: 1,
                    blurRadius: 2)
              ]),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: background,
                    shape: BoxShape.circle,
                  ),
                  child: iconData),
              const SizedBox(height: 20),
              Text(title.toUpperCase(),
                  style: Theme.of(context).textTheme.titleSmall)
            ],
          ),
        ),
      );

  screenSize(context, size) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: PopScope(
          canPop: false,
          onPopInvoked: (bool didPop) async {
            if (didPop) {
              return;
            }
            Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
          },
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              Container(
                color: primaryColor,
                child: Container(
                  height: size == true
                      ? MediaQuery.of(context).size.height
                      : MediaQuery.of(context).size.height,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  child: size == true
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            itemDashboard(
                                'Correspondence',
                                Icon(
                                  CupertinoIcons.chat_bubble_2,
                                  color: Colors.white,
                                  size: 30,
                                ),
                                Colors.brown,
                                context,
                                size),
                            SizedBox(width: 50),
                            itemDashboard(
                                'Freight Charge',
                                // CupertinoIcons.person_2,
                                Image.asset(
                                  'assets/images/delivery-truck.png',
                                  width: 30,
                                  height: 30,
                                ),
                                Colors.indigo,
                                context,
                                size),
                            SizedBox(
                              height: 20,
                            )
                          ],
                        )
                      : GridView.count(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          crossAxisCount: 2,
                          crossAxisSpacing: 20,
                          mainAxisSpacing: 10,
                          children: [
                            itemDashboard(
                                'Correspondence',
                                Icon(
                                  CupertinoIcons.chat_bubble_2,
                                  color: Colors.white,
                                  size: 30,
                                ),
                                Colors.brown,
                                context,
                                size),
                            // itemDashboard('Videos', CupertinoIcons.play_rectangle,
                            //     Colors.deepOrange),
                            // itemDashboard('Analytics', CupertinoIcons.graph_circle,
                            //     Colors.green),
                            itemDashboard(
                                'Freight Charge',
                                // CupertinoIcons.person_2,
                                Image.asset(
                                  'assets/images/delivery-truck.png',
                                  width: 30,
                                  height: 30,
                                ),
                                Colors.indigo,
                                context,
                                size),
                            SizedBox(
                              height: 20,
                            )

                            // itemDashboard('Revenue',
                            //     CupertinoIcons.money_dollar_circle, Colors.indigo),
                            // itemDashboard(
                            //     'Upload', CupertinoIcons.add_circled, Colors.teal),
                            // itemDashboard(
                            //     'About', CupertinoIcons.question_circle, Colors.blue),
                            // itemDashboard(
                            //     'Contact', CupertinoIcons.phone, Colors.pinkAccent),
                          ],
                        ),
                ),
              ),
              const SizedBox(height: 20)
            ],
          ),
        ));
  }

  logout(context) {
    return PanaraConfirmDialog.show(
      context,
      title: "Do you want to log out?",
      margin: EdgeInsets.all(50),
      message: "",
      confirmButtonText: "Yes",
      cancelButtonText: "No",
      imagePath: 'assets/images/logout.png',
      onTapCancel: () {
        Navigator.pop(context);
      },
      onTapConfirm: () {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => LoginScreen()));
      },
      panaraDialogType: PanaraDialogType.normal,
      barrierDismissible: true, // optional parameter (default is true)
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        logout(context);
        return Future.value(false);
      },
      child: Scaffold(
          key: scaffoldKey,
          extendBodyBehindAppBar: false,
          appBar: topNavigationBar(context, scaffoldKey, widget.username),
          drawer: SidebarX(
            controller: SidebarXController(selectedIndex: 0, extended: true),
            items: const [
              SidebarXItem(icon: Icons.home, label: 'Home'),
              SidebarXItem(icon: Icons.search, label: 'Search'),
            ],
          ),
          body: Responsive(
              desktop: screenSize(context, true),
              mobile: screenSize(context, false))),
    );
  }
}

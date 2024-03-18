import 'package:flutter/material.dart';
import 'package:FreightQuote/commons/custom_text.dart';
import 'package:FreightQuote/constants/style.dart';
import 'package:FreightQuote/helpers/reponsiveness.dart';

AppBar topNavigationBar(
        BuildContext context, GlobalKey<ScaffoldState> key, String username) =>
    AppBar(
      leading: !ResponsiveWidget.isSmallScreen(context)
          ? Row(
              children: [
                SizedBox()
                // Padding(
                //   padding: const EdgeInsets.only(left: 16),
                //   child:
                //   Image.asset(
                //     "assets/images/profile.jpeg",
                //     width: 28,
                //   ),
                // ),
              ],
            )
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                    color: active.withOpacity(.5),
                    borderRadius: BorderRadius.circular(30)),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30)),
                  padding: const EdgeInsets.all(2),
                  margin: const EdgeInsets.all(2),
                  child: CircleAvatar(
                    backgroundColor: light,
                    child: Image.asset(
                      'assets/images/logo.png',
                      width: 100,
                    ),
                  ),
                ),
              ),
            ),

      // IconButton(
      //     icon: const Icon(Icons.menu),
      //     onPressed: () {
      //       key.currentState?.openDrawer();
      //     }),
      title: Row(
        children: [
          Visibility(
              visible: !ResponsiveWidget.isSmallScreen(context),
              child: const CustomText(
                text: "DashBoard",
                color: lightGrey,
                size: 20,
                weight: FontWeight.bold,
              )),
          Expanded(child: Container()),
          ResponsiveWidget.isSmallScreen(context)
              ? SizedBox()
              : IconButton(
                  icon: const Icon(
                    Icons.settings,
                    color: dark,
                  ),
                  onPressed: () {}),
          ResponsiveWidget.isSmallScreen(context)
              ? SizedBox()
              : Stack(
                  children: [
                    IconButton(
                        icon: Icon(
                          Icons.notifications,
                          color: dark.withOpacity(.7),
                        ),
                        onPressed: () {}),
                    Positioned(
                      top: 7,
                      right: 7,
                      child: Container(
                        width: 12,
                        height: 12,
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                            color: active,
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(color: light, width: 2)),
                      ),
                    )
                  ],
                ),
          ResponsiveWidget.isSmallScreen(context)
              ? SizedBox()
              : Container(
                  width: 1,
                  height: 22,
                  color: lightGrey,
                ),
          const SizedBox(
            width: 24,
          ),
          CustomText(
            text: username,
            color: Colors.black,
          ),
          const SizedBox(
            width: 16,
          ),
          ResponsiveWidget.isSmallScreen(context)
              ? SizedBox()
              : Container(
                  decoration: BoxDecoration(
                      color: active.withOpacity(.5),
                      borderRadius: BorderRadius.circular(30)),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30)),
                    padding: const EdgeInsets.all(2),
                    margin: const EdgeInsets.all(2),
                    child: const CircleAvatar(
                      backgroundColor: light,
                      child: Icon(
                        Icons.person_outline,
                        color: dark,
                      ),
                    ),
                  ),
                )
        ],
      ),
      iconTheme: const IconThemeData(color: dark),
      elevation: 0,
      backgroundColor: Colors.transparent,
    );

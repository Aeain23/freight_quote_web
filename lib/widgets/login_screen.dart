import 'package:FreightQuote/models/users.dart';
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/services.dart';

import 'package:form_field_validator/form_field_validator.dart';
import 'package:FreightQuote/commons/passwordField.dart';
import 'package:FreightQuote/constants/utilizes.dart';
import 'package:FreightQuote/helpers/responsive.dart';
import 'package:FreightQuote/widgets/dashboard_screen.dart';
import 'package:panara_dialogs/panara_dialogs.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = "/LoginScreen";
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  saveProfile(String email, password, username, phone) async {
    SharedPreferences pre = await SharedPreferences.getInstance();
    final String user = usersToJson(Users(
        email: email, password: password, userName: username, phone: phone));

    await pre.setString('users', user);
    print("comming this one");
  }

  logout(context) {
    return PanaraConfirmDialog.show(
      context,
      title: "Are you Sure?",
      margin: EdgeInsets.all(50),
      message: "Do you want to logout from this app?",
      confirmButtonText: "Yes",
      cancelButtonText: "No",
      imagePath: 'assets/images/logout.png',
      onTapCancel: () {
        Navigator.pop(context);
      },
      onTapConfirm: () {
        SystemNavigator.pop();
      },
      panaraDialogType: PanaraDialogType.normal,
      barrierDismissible: true, // optional parameter (default is true)
    );
  }

  screenSize(String screen, context) {
    return Form(
      key: _formKey,
      child: Container(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: MediaQuery.of(context).size.height / 20,
              ),
              Center(
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      FadeInUp(
                          duration: Duration(milliseconds: 1000),
                          child: Center(
                            child: Image.asset(
                              'assets/images/logo.png',
                              height: 100,
                            ),
                          )),
                      SizedBox(
                        height: 10,
                      ),
                      FadeInUp(
                          duration: Duration(milliseconds: 1300),
                          child: Center(
                            child: Text(
                              "Welcome Freight Quotation",
                              style: TextStyle(
                                  color: Colors.blueAccent, fontSize: 20),
                            ),
                          )),
                      SizedBox(
                        height: 10,
                      )
                    ],
                  ),
                ),
              ),
              Center(
                child: SingleChildScrollView(
                  child: Container(
                    // height: screen == 'deskstop'
                    //     ? MediaQuery.of(context).size.height / 1.6
                    //     : screen == 'tablet'
                    //         ? MediaQuery.of(context).size.height / 1.8
                    //         : MediaQuery.of(context).size.height / 1.9,
                    width: screen == 'deskstop'
                        ? MediaQuery.of(context).size.width / 4
                        : screen == "tablet"
                            ? MediaQuery.of(context).size.width / 3
                            : MediaQuery.of(context).size.width / 1.2,
                    margin: EdgeInsets.all(20),
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30),
                            bottomLeft: Radius.circular(30),
                            bottomRight: Radius.circular(30))),
                    child: Column(
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        FadeInUp(
                            duration: Duration(milliseconds: 1000),
                            child: Text(
                              "Login",
                              style: TextStyle(
                                  color: Colors.blueAccent, fontSize: 30),
                            )),
                        SizedBox(
                          height: 20,
                        ),
                        FadeInUp(
                            duration: Duration(milliseconds: 1400),
                            child: SingleChildScrollView(
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    padding: EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                color: Colors.grey.shade200))),
                                    child: TextFormField(
                                      controller: emailController,
                                      onFieldSubmitted: (value) {
                                        emailController.text = value;
                                      },
                                      validator: MultiValidator([
                                        RequiredValidator(
                                            errorText: 'Enter email address'),
                                        EmailValidator(
                                            errorText:
                                                'Please correct email format'),
                                      ]),
                                      decoration: InputDecoration(
                                          hintText: "Email or Phone number",
                                          hintStyle:
                                              TextStyle(color: Colors.grey),
                                          border: InputBorder.none),
                                    ),
                                  ),
                                  Container(
                                      padding: EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                          border: Border(
                                              bottom: BorderSide(
                                                  color:
                                                      Colors.grey.shade200))),
                                      child: PasswordField(passwordController,
                                          (value) {
                                        passwordController.text = value;
                                      })),
                                ],
                              ),
                            )),
                        SizedBox(
                          height: screen == 'deskstop'
                              ? MediaQuery.of(context).size.height / 25
                              : MediaQuery.of(context).size.height / 20,
                        ),
                        FadeInUp(
                            duration: Duration(milliseconds: 1500),
                            child: Text(
                              "Forgot Password?",
                              style: TextStyle(color: Colors.grey),
                            )),
                        SizedBox(
                          height: screen == 'deskstop'
                              ? MediaQuery.of(context).size.height / 25
                              : MediaQuery.of(context).size.height / 20,
                        ),
                        SizedBox(
                          child: FadeInUp(
                              duration: Duration(milliseconds: 1600),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  // side: BorderSide(color: Colors.yellow, width: 5),
                                  fixedSize: Size(200.0, 20.0),
                                  backgroundColor: Colors.blueAccent,
                                  textStyle: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontStyle: FontStyle.normal),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(50))),
                                ),
                                onPressed: () {
                                  setState(() {
                                    login = true;
                                    saveProfile(
                                        emailController.text,
                                        passwordController.text,
                                        emailController.text.split('@').first,
                                        '');
                                  });
                                  if (_formKey.currentState!.validate()) {
                                    Navigator.of(context)
                                        .pushReplacement(MaterialPageRoute(
                                      builder: (context) => DashboardScreen(
                                        username: emailController.text,
                                        password: passwordController.text,
                                        email: '',
                                      ),
                                    ));
                                  } else {
                                    // emailController.clear();
                                    // passwordController.clear();
                                    print("Not Validated");
                                  }
                                },
                                child: Center(
                                  child: Text(
                                    "Login",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              )),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (bool didPop) async {
        if (didPop) {
          return;
        }
        logout(context);
      },
      child: Scaffold(
        body: Responsive(
            desktop: screenSize('deskstop', context),
            tablet: screenSize('tablet', context),
            mobile: screenSize('mobile', context)),
      ),
    );
  }
}

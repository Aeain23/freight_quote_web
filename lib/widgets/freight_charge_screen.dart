import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:FreightQuote/widgets/dashboard_screen.dart';

class FreightChargeScreen extends StatefulWidget {
  static const routeName = '/freightChargeScreen';
  const FreightChargeScreen({super.key});

  @override
  State<FreightChargeScreen> createState() => _FreightChargeScreenState();
}

class _FreightChargeScreenState extends State<FreightChargeScreen> {
  double _screenWidth = 0;
  double _screenHeight = 0;

  // String pol = "";
  TextEditingController pol = TextEditingController();
  TextEditingController pol2 = TextEditingController();

  TextEditingController pod = TextEditingController();
  TextEditingController pod2 = TextEditingController();

  TextEditingController viaPort = TextEditingController();
  TextEditingController viaPort2 = TextEditingController();

  TextEditingController shippingLine = TextEditingController();
  TextEditingController shippingLine2 = TextEditingController();

  TextEditingController transitTime = TextEditingController();
  TextEditingController transitDay = TextEditingController();

  TextEditingController frequency = TextEditingController();

  TextEditingController note = TextEditingController();
  TextEditingController note2 = TextEditingController();

  TextEditingController origin = TextEditingController();
  TextEditingController origin2 = TextEditingController();

  TextEditingController dest = TextEditingController();
  TextEditingController dest2 = TextEditingController();

  TextEditingController viaSecond = TextEditingController();
  TextEditingController viaSecond2 = TextEditingController();
  TextEditingController viaThird = TextEditingController();
  TextEditingController viaThird2 = TextEditingController();

  TextEditingController detentionFreeDay = TextEditingController();
  TextEditingController demurrageFreeDay = TextEditingController();

  TextEditingController commodity = TextEditingController();
  TextEditingController commodity2 = TextEditingController();

  TextEditingController deliveryType = TextEditingController();
  TextEditingController deliveryType2 = TextEditingController();

  void disposeController() {
    pol.clear();
    pol2.clear();
    pod.clear();
    pod2.clear();
    viaPort.clear();
    viaPort2.clear();
    shippingLine.clear();
    shippingLine2.clear();
    transitTime.clear();
    transitDay.clear();
    frequency.clear();
    note.clear();
    note2.clear();
    origin.clear();
    origin2.clear();
    dest.clear();
    dest2.clear();
    viaSecond.clear();
    viaSecond2.clear();
    viaThird.clear();
    viaThird2.clear();
    detentionFreeDay.clear();
    demurrageFreeDay.clear();
    commodity.clear();
    commodity2.clear();
    deliveryType.clear();
    deliveryType2.clear();
    print("done");
  }

  @override
  void dispose() {
    super.dispose();
    disposeController();
  }

  @override
  Widget build(BuildContext context) {
    _screenWidth = MediaQuery.of(context).size.width;
    _screenHeight = MediaQuery.of(context).size.height;
    return PopScope(
      canPop: false,
      onPopInvoked: (bool didPop) async {
        if (didPop) {
          return;
        }
        Navigator.of(context).pushReplacementNamed(DashboardScreen.routeName);
      },
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: 
          [
            Color.fromRGBO(186, 203, 243, 1),
            Color.fromRGBO(228, 220, 242, 1),
          ])
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            // flexibleSpace: Container(
            //   color: Color.fromARGB(255, 172, 196, 238),
            // ),
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: Color(0xFF936396),
              ),
              onPressed: () {
                Navigator.of(context).pushReplacementNamed(DashboardScreen.routeName);
              },
            ),
            elevation: 0,
            foregroundColor: Colors.white,
            centerTitle: true,
            title: const Text(
              "Freight Charge",
              style: TextStyle(
                color: Color(0xFF936396),
              ),
            ),
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: _screenWidth / 20, vertical: _screenHeight / 30),
                child: Column(
                  children: [
                    DoubleInputBox(
                      title: "Port of Loading",
                      firstRatio: 1,
                      secondRatio: 2,
                      controller: pol,
                      secondController: pol2,
                    ),
                    DoubleInputBox(
                      title: "Port of Discharge",
                      firstRatio: 1,
                      secondRatio: 2,
                      controller: pod,
                      secondController: pod2,
                    ),
                    DoubleInputBox(
                      title: "Via Port",
                      firstRatio: 1,
                      secondRatio: 2,
                      controller: viaPort,
                      secondController: viaPort2,
                    ),
                    DoubleInputBox(title: "Shipping Line", controller: shippingLine, secondController: shippingLine2),
                    DoubleInputBox(
                      title: "Est. Transit Time",
                      secondTitle: "Day(s)",
                      controller: transitTime,
                      secondController: transitDay,
                    ),
                    InputBox(title: "Frequency", controller: frequency),
                    DoubleInputBox(
                      title: "Note",
                      firstRatio: 1,
                      secondRatio: 2,
                      controller: note,
                      secondController: note2,
                    ),
                    DoubleInputBox(
                      title: "Origin",
                      firstRatio: 1,
                      secondRatio: 2,
                      controller: origin,
                      secondController: origin2,
                    ),
                    DoubleInputBox(
                      title: "Dest",
                      firstRatio: 1,
                      secondRatio: 2,
                      controller: dest,
                      secondController: dest2,
                    ),
                    DoubleInputBox(
                      title: "Via 2",
                      firstRatio: 1,
                      secondRatio: 2,
                      controller: viaSecond,
                      secondController: viaSecond2,
                    ),
                    DoubleInputBox(
                      title: "Via 3",
                      firstRatio: 1,
                      secondRatio: 2,
                      controller: viaThird,
                      secondController: viaThird2,
                    ),
                    DoubleInputBox(
                      title: "Detention Free Day",
                      secondTitle: "Demurrage Free Day",
                      controller: detentionFreeDay,
                      secondController: demurrageFreeDay,
                    ),
                    DoubleInputBox(
                      title: "Commodity",
                      firstRatio: 1,
                      secondRatio: 2,
                      controller: commodity,
                      secondController: commodity2,
                    ),
                    DoubleInputBox(
                      title: "Delivery Type",
                      firstRatio: 1,
                      secondRatio: 2,
                      controller: deliveryType,
                      secondController: deliveryType2,
                    ),
        
                    //Save Button
                    Container(
                      child: FadeInUp(
                          duration: Duration(milliseconds: 1600),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              // side: BorderSide(color: Colors.yellow, width: 5),
                              fixedSize: Size(MediaQuery.of(context).size.width, 20.0),
                              backgroundColor: Colors.blueAccent,
                              textStyle: const TextStyle(color: Colors.white, fontSize: 18, fontStyle: FontStyle.normal),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(50))),
                            ),
                            onPressed: () {
                              print(transitTime.text);
                              print(transitDay.text);
                              print(frequency.text);
                              print(note.text);
                              print(note2.text);
                              print(origin.text);
                              print(origin2.text);
                              print(dest.text);
                              print(dest2.text);
                              print(viaSecond.text);
                              print(viaSecond2.text);
                              print(viaThird.text);
                              print(viaThird2.text);
                              print(detentionFreeDay.text);
                              print(demurrageFreeDay.text);
                              print(commodity.text);
                              print(commodity2.text);
                              print(deliveryType.text);
                              print(deliveryType2.text);
                            },
                            child: Center(
                              child: Text(
                                "Save",
                                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                              ),
                            ),
                          )),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class InputBox extends StatelessWidget {
  final String title;
  final TextEditingController? controller;
  const InputBox({super.key, required this.title, this.controller});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: titleStyle,
        ),
        const SizedBox(height: 30),
        TextFormField(
          controller: controller,
          cursorHeight: 20,
          readOnly: false,
          minLines: 1,
          maxLines: 1,
          // maxLines: 6,
          decoration: inputBoxStyle(),
          style: inputTextStyle,
        ),
        const SizedBox(height: 30),
      ],
    );
  }
}

class DoubleInputBox extends StatelessWidget {
  final String title;
  final String? secondTitle;
  final TextEditingController? controller;
  final TextEditingController? secondController;
  final int firstRatio;
  final int secondRatio;
  const DoubleInputBox({
    super.key,
    required this.title,
    this.secondTitle,
    this.controller,
    this.secondController,
    this.firstRatio = 1,
    this.secondRatio = 1,
  });
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              flex: firstRatio,
              child: Text(
                title,
                style: titleStyle,
              ),
            ),
            secondTitle == null
                ? const SizedBox()
                : Expanded(
                    flex: secondRatio,
                    child: Padding(
                      padding: EdgeInsets.only(left: screenWidth * 0.024),
                      child: Text(
                        secondTitle!,
                        style: titleStyle,
                      ),
                    ),
                  ),
          ],
        ),
        const SizedBox(height: 30),
        Row(
          children: [
            Expanded(
              flex: firstRatio,
              child: TextFormField(
                inputFormatters: [],
                controller: controller,
                cursorHeight: 20,
                readOnly: false,
                minLines: 1,
                maxLines: 1,
                // maxLines: 6,
                decoration: inputBoxStyle(),
                style: inputTextStyle,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              flex: secondRatio,
              child: TextFormField(
                controller: secondController,
                cursorHeight: 20,
                readOnly: false,
                minLines: 1,
                maxLines: 1,
                // maxLines: 6,
                decoration: inputBoxStyle(),
                style: inputTextStyle,
              ),
            ),
          ],
        ),
        const SizedBox(height: 30),
      ],
    );
  }
}

InputDecoration inputBoxStyle() {
  return InputDecoration(
    border: InputBorder.none,
    filled: true,
    fillColor: Colors.white,
    contentPadding: const EdgeInsets.only(left: 14.0, bottom: 10.0, top: 10.0),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.blueAccent),
      borderRadius: BorderRadius.circular(15.0),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.white),
      borderRadius: BorderRadius.circular(15.0),
    ),
  );
}

const titleStyle = TextStyle(
  color: Color(0xFF7A8999),
  fontSize: 14,
  fontFamily: 'Inter',
  fontWeight: FontWeight.w700,
  height: 0.10,
);

const inputTextStyle = TextStyle(
  color: Color(0xFF7A8999),
  fontSize: 14,
  fontFamily: 'Inter',
  fontWeight: FontWeight.w500,
  // height: 0.10,
);

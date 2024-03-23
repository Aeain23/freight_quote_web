import 'package:FreightQuote/commons/input_box.dart';
import 'package:FreightQuote/controllers/freight_charge_header_controller.dart';
import 'package:FreightQuote/widgets/freight_charge_screen.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FreightChargeHeaderScreen extends StatefulWidget {
  static const routeName = '/freightChargeHeaderScreen';
  const FreightChargeHeaderScreen({super.key});

  @override
  State<FreightChargeHeaderScreen> createState() => _FreightChargeHeaderScreenState();
}

class _FreightChargeHeaderScreenState extends State<FreightChargeHeaderScreen> {
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

  void updateHeaderData(FreightChargeHeaderController controller) {
    controller.updateData(
      pol: pol.text,
      pol2: pol2.text,
      pod: pod.text,
      pod2: pod2.text,
      viaPort: viaPort.text,
      viaPort2: viaPort2.text,
      shippingLine: shippingLine.text,
      shippingLine2: shippingLine2.text,
      transitTime: transitTime.text,
      transitDay: transitDay.text,
      frequency: frequency.text,
      note: note.text,
      note2: note2.text,
      origin: origin.text,
      origin2: origin2.text,
      dest: dest.text,
      dest2: dest2.text,
      viaSecond: viaSecond2.text,
      viaSecond2: viaSecond2.text,
      viaThird: viaThird.text,
      viaThird2: viaThird2.text,
      detentionFreeDay: detentionFreeDay.text,
      demurrageFreeDay: demurrageFreeDay.text,
      commodity: commodity.text,
      commodity2: commodity2.text,
      deliveryType: deliveryType.text,
      deliveryType2: deliveryType2.text,
    );
  }

  @override
  void dispose() {
    super.dispose();
    disposeController();
  }

  @override
  Widget build(BuildContext context) {
    FreightChargeHeaderController controller = Get.find();
    _screenWidth = MediaQuery.of(context).size.width;
    _screenHeight = MediaQuery.of(context).size.height;
    return PopScope(
      canPop: false,
      onPopInvoked: (bool didPop) async {
        if (didPop) {
          return;
        }
        // Navigator.of(context).pushReplacementNamed(DashboardScreen.routeName);
        updateHeaderData(controller);
        Navigator.of(context).pushReplacementNamed(FreightChargeScreen.routeName);
      },
      child: Scaffold(
        appBar: AppBar(
          flexibleSpace: Container(
            color: Color.fromARGB(255, 172, 196, 238),
          ),
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Color(0xFF936396),
            ),
            onPressed: () {
              // Navigator.of(context).pushReplacementNamed(DashboardScreen.routeName);
              updateHeaderData(controller);
              Navigator.of(context).pushReplacementNamed(FreightChargeScreen.routeName);
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
                            updateHeaderData(controller);

                            Get.back();
                            // print(transitTime.text);
                            // print(transitDay.text);
                            // print(frequency.text);
                            // print(note.text);
                            // print(note2.text);
                            // print(origin.text);
                            // print(origin2.text);
                            // print(dest.text);
                            // print(dest2.text);
                            // print(viaSecond.text);
                            // print(viaSecond2.text);
                            // print(viaThird.text);
                            // print(viaThird2.text);
                            // print(detentionFreeDay.text);
                            // print(demurrageFreeDay.text);
                            // print(commodity.text);
                            // print(commodity2.text);
                            // print(deliveryType.text);
                            // print(deliveryType2.text);
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
    );
  }
}

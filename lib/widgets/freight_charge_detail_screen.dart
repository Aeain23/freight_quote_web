import 'package:FreightQuote/commons/input_box.dart';
import 'package:FreightQuote/controllers/freight_charge_detail_controller.dart';
import 'package:FreightQuote/widgets/freight_charge_screen.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class FreightChargeDetailScreen extends StatefulWidget {
  static const routeName = '/freightChargeDetailScreen';
  const FreightChargeDetailScreen({super.key});

  @override
  State<FreightChargeDetailScreen> createState() => _FreightChargeDetailScreenState();
}

class _FreightChargeDetailScreenState extends State<FreightChargeDetailScreen> {
  double _screenWidth = 0;
  double _screenHeight = 0;

  // String pol = "";
  TextEditingController code = TextEditingController();

  TextEditingController description = TextEditingController();

  TextEditingController qty = TextEditingController();
  TextEditingController cargo = TextEditingController();

  TextEditingController dg = TextEditingController();
  TextEditingController uom = TextEditingController();

  TextEditingController vat = TextEditingController();
  TextEditingController pc = TextEditingController();


  TextEditingController unit = TextEditingController();
  TextEditingController cont = TextEditingController();


  TextEditingController rate = TextEditingController();
  TextEditingController curr = TextEditingController();
  TextEditingController currRate = TextEditingController();

  TextEditingController minQty = TextEditingController();
  TextEditingController minAmt = TextEditingController();
  TextEditingController amt = TextEditingController();

  TextEditingController cost = TextEditingController();
  TextEditingController percentage = TextEditingController();
  TextEditingController rev = TextEditingController();
// const bottomSpace = titleSpace;

  void disposeController() {
    code.clear();
    description.clear();

    qty.clear();
    cargo.clear();

    dg.clear();
    uom.clear();

    vat.clear();
    pc.clear();

    unit.clear();
    cont.clear();

    rate.clear();
    curr.clear();
    currRate.clear();

    minQty.clear();
    minAmt.clear();
    amt.clear();

    cost.clear();
    percentage.clear();
    rev.clear();
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
    final FreightChargeDetailController _controller = Get.find();
    final currId = ModalRoute.of(context)?.settings.arguments as int;
    return PopScope(
      canPop: false,
      onPopInvoked: (bool didPop) async {
        if (didPop) {
          return;
        }
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
              Navigator.of(context).pushReplacementNamed(FreightChargeScreen.routeName);
              // Navigator.of(context).pushReplacementNamed(DashboardScreen.routeName);
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
                  InputBox(
                    title: "Code",
                    controller: code,
                  ),
                  InputBox(
                    title: "Description",
                    controller: description,
                  ),
                  DoubleInputBox(
                    title: "Qty",
                    secondTitle: "Cargo",
                    controller: qty,
                    secondController: cargo,
                  ),
                  DoubleInputBox(
                    title: "DG",
                    secondTitle: "Uom",
                    controller: dg,
                    secondController: uom,
                  ),
                  DoubleInputBox(
                    title: "VAT",
                    secondTitle: "P/C",
                    controller: vat,
                    secondController: pc,
                  ),
                  DoubleInputBox(
                    title: "Unit",
                    secondTitle: "Cont",
                    controller: unit,
                    secondController: cont,
                  ),
      
      
                  TripleInputBox(
                    title: "Rate",
                    secondTitle: "Curr",
                    thirdTitle: "Curr Rate",
                    controller: rate,
                    secondController: curr,
                    thirdController: currRate,
                  ),
      
                  TripleInputBox(
                    title: "Min Qty",
                    secondTitle: "Min Amt",
                    thirdTitle: "Amt",
                    controller: minQty,
                    secondController: minAmt,
                    thirdController: amt,
                  ),
                  TripleInputBox(
                    title: "Cost",
                    secondTitle: "%",
                    thirdTitle: "Rev",
                    controller: cost,
                    secondController: percentage,
                    thirdController: rev,
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
                            _controller.updateData(
                              index: currId,
                              code: code.text,
                              desc: description.text,
                              qty: qty.text,
                              cargo: cargo.text,
                              dg: dg.text,
                              uom: uom.text,
                              vat: vat.text,
                              pc : pc.text,
                              unit: unit.text,
                              cont: cont.text,
                              rate: rate.text,
                              curr: curr.text,
                              currRate: currRate.text,
                              minQty: minQty.text,
                              minAmt: minAmt.text,
                              amt: amt.text,
                              cost: cost.text,
                              percentage: percentage.text,
                              rev: rev.text,
                            );
                            Navigator.of(context).pushReplacementNamed(FreightChargeScreen.routeName);
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





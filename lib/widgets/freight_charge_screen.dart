import 'package:FreightQuote/controllers/freight_charge_header_controller.dart';
import 'package:FreightQuote/controllers/freight_charge_detail_controller.dart';
import 'package:FreightQuote/widgets/freight_charge_detail_screen.dart';
import 'package:FreightQuote/widgets/freight_charge_header_screen.dart';
import 'package:flutter/material.dart';
import 'package:FreightQuote/widgets/dashboard_screen.dart';
import 'package:get/get.dart';

class FreightChargeScreen extends StatefulWidget {
  static const routeName = '/freightHeaderScreen';
  const FreightChargeScreen({super.key});

  @override
  State<FreightChargeScreen> createState() => _FreightChargeScreenState();
}

class _FreightChargeScreenState extends State<FreightChargeScreen> {
  double _screenWidth = 0;

  // String pol = "";

  DateTime currDate = DateTime.now();

  String formatDate(DateTime time) {
    return "${time.day}/${time.month}/${time.year}";
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _screenWidth = MediaQuery.of(context).size.width;
    return PopScope(
      canPop: false,
      onPopInvoked: (bool didPop) async {
        if (didPop) {
          return;
        }
        Navigator.of(context).pushReplacementNamed(DashboardScreen.routeName);
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
              Navigator.of(context).pushReplacementNamed(DashboardScreen.routeName);
            },
          ),
          elevation: 0,
          foregroundColor: Colors.white,
          centerTitle: true,
          actions: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: _screenWidth * 0.03),
              child: GestureDetector(
                onTap: () async {
                  final date = await showDatePicker(context: context, firstDate: DateTime(2015), lastDate: DateTime(2030));
                  setState(() {
                    currDate = date ?? currDate;
                  });
                },
                child: Row(
                  children: [
                    Text(formatDate(currDate), style: headerTitleStyle),
                    const SizedBox(width: 8),
                    Icon(
                      Icons.calendar_today_outlined,
                      color: Color(0xff4e6a94),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: _screenWidth * 0.03,vertical: 8),
              child: Column(
                children: [
                  //header
                  GetBuilder<FreightChargeHeaderController>(builder: (controller) {
                    return Row(
                      children: [
                        Expanded(
                          child: Table(
                            columnWidths: {
                              0: FlexColumnWidth(2),
                              1: FlexColumnWidth(1),
                              2: FlexColumnWidth(1),
                            },
                            children: [
                              headerTableRow("Port of Loading:", controller.data.pol, controller.data.pol2),
                              headerTableRow("Port of Discharge:", controller.data.pod, controller.data.pod2),
                              headerTableRow("Origin:", controller.data.origin, controller.data.origin2),
                              headerTableRow("Dest:", controller.data.dest, controller.data.dest2),
                            ],
                          ),
                        ),

                        //icon
                        IconButton(
                          onPressed: () {
                            Get.to(() => const FreightChargeHeaderScreen());
                          },
                          iconSize: 15,
                          icon: const Icon(Icons.arrow_forward_ios_rounded),
                        ),
                      ],
                      //detail
                    );
                  }),

                  const SizedBox(height: 24),

                  Container(
                    padding: EdgeInsets.symmetric(horizontal: _screenWidth * 0.01),
                    child: GetBuilder<FreightChargeDetailController>(builder: (controller) {
                      return Table(columnWidths: {
                        0: FlexColumnWidth(1),
                        1: FlexColumnWidth(3),
                        2: FlexColumnWidth(1),
                        3: FlexColumnWidth(1),
                        4: FlexColumnWidth(1),
                        5: FlexColumnWidth(1),
                        6: IntrinsicColumnWidth(),
                      }, children: [
                        detailTableRow("Code", "Description", "Qty", "Cargo", "DG", "Uom", header: true,context: context, index: 0),
                        ...List.generate(controller.freightChargeData.length, (index) {
                          return detailTableRow(
                            controller.freightChargeData[index].code,
                            controller.freightChargeData[index].description,
                            controller.freightChargeData[index].qty,
                            controller.freightChargeData[index].cargo,
                            controller.freightChargeData[index].dg,
                            controller.freightChargeData[index].uom,
                            context: context,
                            index: index,

                          );
                          // return detailTableRow("hello", "ro", "cool", "dude", "lorem", "ipsum");
                        }),
                      ]);
                    }),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      width: _screenWidth / 1.8,
                      child: Table(
                        columnWidths: {
                          0: FlexColumnWidth(2),
                          1: FlexColumnWidth(1),
                          2: FlexColumnWidth(1),
                        },
                        children: [
                          headerTableRow("Total Amt", "0.00", "0.00"),
                          headerTableRow("Profit/Margin", "0.00", "0.00"),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

TableRow headerTableRow(String? first, String? second, String? third) {
  return TableRow(
    children: [
      centeredTableCell(
        center: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 2.5),
          child: Text(
            (first == null || first.isEmpty) ? "-": first,
            style: titleStyle.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
      ),
      centeredTableCell(child: Text((second == null || second.isEmpty) ? "-" : second, style: titleStyle)),
      centeredTableCell(child: Text((third == null || third.isEmpty) ? "-" : third, style: titleStyle))
    ],
  );
}

TableCell centeredTableCell({required Widget child, bool center = true}) {
  return TableCell(
    verticalAlignment: TableCellVerticalAlignment.middle,
    child: center ? Center(child: child) : child,
  );
}

TableRow detailTableRow(
  String? first,
  String? second,
  String? third,
  String? fourth,
  String? fifth,
  String? sixth, {
  bool header = false,
  required BuildContext context,
  required int index,
}) {
  return TableRow(
    decoration: BoxDecoration(
      border: Border(bottom: BorderSide(width: 1.5, color: Color(0xff8f9cb0))),
    ),
    children: [
      centeredTableCell(child: Text(first ?? "", style: header ? headerTitleStyle : titleStyle)),
      centeredTableCell(child: Text(second ?? "", style: header ? headerTitleStyle : titleStyle),center: false),
      centeredTableCell(child: Text(third ?? "", style: header ? headerTitleStyle : titleStyle)),
      centeredTableCell(child: Text(fourth ?? "", style: header ? headerTitleStyle : titleStyle)),
      centeredTableCell(child: Text(fifth ?? "", style: header ? headerTitleStyle : titleStyle)),
      centeredTableCell(child: Text(sixth ?? "", style: header ? headerTitleStyle : titleStyle)),
      centeredTableCell(
        child: header
            ? const SizedBox(height: 40)
            : IconButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, FreightChargeDetailScreen.routeName, arguments: index);
                },
                iconSize: 15,
                icon: const Icon(Icons.arrow_forward_ios_rounded),
              ),
      ),
    ],
  );
}

const titleStyle = TextStyle(
  color: Color.fromARGB(255, 93, 101, 133),
  fontSize: 13.8,
  fontFamily: 'Inter',
);
const headerTitleStyle = TextStyle(
  color: Color.fromARGB(255, 93, 101, 133),
  fontSize: 13.8,
  fontWeight: FontWeight.w500,
  fontFamily: 'Inter',
);

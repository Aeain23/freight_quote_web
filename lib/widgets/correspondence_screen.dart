import 'dart:async';
import 'package:FreightQuote/constants/utilizes.dart';
import 'package:FreightQuote/helpers/reponsiveness.dart';
import 'package:FreightQuote/widgets/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:expandable/expandable.dart';
import 'package:animate_do/animate_do.dart';

class CorrespondenceScreen extends StatefulWidget {
  static const routeName = '/correspondenceScreen';
  const CorrespondenceScreen({super.key});

  @override
  State<CorrespondenceScreen> createState() => _CorrespondenceScreenState();
}

class _CorrespondenceScreenState extends State<CorrespondenceScreen> {
  final TextEditingController quotationNoController = TextEditingController();
  final TextEditingController quotationTypeController = TextEditingController();
  final TextEditingController validDateController = TextEditingController();
  final TextEditingController validDateAndQuotationDateController =
      TextEditingController();
  final TextEditingController quotationTitleController =
      TextEditingController();
  final TextEditingController quotationDateController = TextEditingController();
  final TextEditingController customerCodeController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController telephoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController salesmainCodeController = TextEditingController();
  final TextEditingController referenceNoController = TextEditingController();
  final TextEditingController effectiveDateController = TextEditingController();
  final TextEditingController expireDateController = TextEditingController();
  DateTime selectedDate = DateTime.now();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  ExpandableController expandableProfileController =
      ExpandableController(initialExpanded: true);
  ExpandableController expandableAddressController = ExpandableController();

  textField(String title, TextEditingController controller, bool date) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20.0, top: 20, right: 20.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Text(
                  title,
                  style: TextStyle(
                    color: Color(0xFF7A8999),
                    fontSize: 14,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w700,
                    height: 0.10,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(
                  top: 2.0, left: 20.0, right: 20.0, bottom: 2.0),
              child: TextField(
                controller: controller,
                cursorHeight: 20,
                readOnly: date,
                minLines: 1,
                maxLines: 6,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  suffixIcon: date == true
                      ? IconButton(
                          icon: Icon(Icons.calendar_today),
                          tooltip: 'Tap to open date picker',
                          onPressed: () {
                            _selectDate(context, controller);
                          },
                        )
                      : SizedBox(),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: const EdgeInsets.only(
                      left: 14.0, bottom: 10.0, top: 10.0),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blueAccent),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
                style: TextStyle(
                  color: Color(0xFF7A8999),
                  fontSize: 14,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500,
                  // height: 0.10,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    quotationNoController.dispose();
    quotationTitleController.dispose();
    quotationTypeController.dispose();
    quotationDateController.dispose();
    validDateController.dispose();
    validDateAndQuotationDateController.dispose();
    customerCodeController.dispose();
    addressController.dispose();
    telephoneController.dispose();
    emailController.dispose();
    salesmainCodeController.dispose();
    referenceNoController.dispose();
    effectiveDateController.dispose();
    expireDateController.dispose();
    expandableProfileController.dispose();
    expandableAddressController.dispose();

    super.dispose();
  }

  Future<Null> _selectDate(
      BuildContext context, TextEditingController dateController) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        initialDatePickerMode: DatePickerMode.day,
        firstDate: DateTime(2015),
        lastDate: DateTime(2101));
    if (picked != null)
      setState(() {
        selectedDate = picked;
        String testT = selectedDate.toString();
        DateTime userStartDate = DateTime.parse(testT);
        dateController.text = formattedDateString(userStartDate);
      });
  }

  @override
  Widget build(BuildContext context) {
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
            leading: ResponsiveWidget.isSmallScreen(context)
                ? IconButton(
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Color(0xFF936396),
                    ),
                    onPressed: () {
                      Navigator.of(context)
                          .pushReplacementNamed(DashboardScreen.routeName);
                    },
                  )
                : SizedBox(),
            elevation: 0,
            foregroundColor: Colors.white,
            centerTitle: true,
            title: const Text(
              "Correspondence",
              style: TextStyle(
                color: Color(0xFF936396),
              ),
            ),
          ),
          body: ResponsiveWidget(
            largeScreen: SingleChildScrollView(
              child: Center(
                child: Container(
                  width: MediaQuery.of(context).size.width / 2,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.blueAccent, width: 2),
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Form(
                        key: _formkey,
                        child: GridView.count(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          crossAxisCount: 2,
                          crossAxisSpacing: 20,
                          mainAxisSpacing: 10,
                          children: [
                            //quote No
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ExpansionTile(
                                title: Text('Quotation'),
                                maintainState: true,
                                backgroundColor: Colors.red,
                                collapsedBackgroundColor: Colors.yellow,
                                shape: const RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
                                collapsedShape: const RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(50))),
                                children: [
                                  textField('Quotation No.',
                                      quotationNoController, false),
                                  textField('Quotation Date',
                                      quotationDateController, true),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      textField(
                                          'Validity Date',
                                          validDateAndQuotationDateController,
                                          false),
                                      SizedBox(width: 30),
                                      textField('', validDateController, true),
                                    ],
                                  ),
                                  textField('Quotation Type',
                                      quotationTypeController, false),
                                  textField('Quote Title',
                                      quotationTitleController, false),
                                ],
                              ),
                            ),

                            textField(
                                'Quotation No.', quotationNoController, false),
                            textField('Quotation Date', quotationDateController,
                                true),
                            textField(
                                'Validity Date', validDateController, true),
                            textField('Quotation Type', quotationTypeController,
                                false),
                            textField(
                                'Quote Title', quotationTitleController, false),
                            textField(
                                'Customer Code', customerCodeController, false),
                            textField('Address', addressController, false),
                            textField('Tel', telephoneController, false),
                            textField('Email', emailController, false),
                            textField(
                                'SalesmanCode', salesmainCodeController, false),
                            textField(
                                'Reference No.', referenceNoController, false),
                            textField('Effective Date', effectiveDateController,
                                true),
                            textField(
                                'Expiry Date', expireDateController, true),
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
                                      if (_formkey.currentState!.validate()) {
                                        Navigator.of(context)
                                            .pushReplacement(MaterialPageRoute(
                                          builder: (context) => DashboardScreen(
                                            username: emailController.text,
                                            password: '',
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
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            smallScreen: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Form(
                    child: Wrap(
                      key: _formkey,
                      runSpacing: 2,
                      clipBehavior: Clip.none,
                      children: [
                        // title
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20.0, top: 20, right: 20.0, bottom: 20.0),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: Text(
                              'Quotation Form',
                              style: TextStyle(
                                color: Color(0xFF7A8999),
                                fontSize: 20,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w700,
                                height: 0.10,
                              ),
                            ),
                          ),
                        ),
                        // Quotation Information
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20.0, right: 20.0, bottom: 5, top: 5),
                          child: SizedBox(
                            child: ExpansionTile(
                              title: Text('Quotation',
                                  style: TextStyle(
                                    color: Colors.blueGrey,
                                    fontSize: 16,
                                  )),
                              maintainState: true,
                              dense: true,
                              backgroundColor: Colors.white38,
                              collapsedBackgroundColor: Colors.white,
                              shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15))),
                              collapsedShape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15))),
                              children: [
                                textField('Quotation No.',
                                    quotationNoController, false),
                                textField('Quotation Date',
                                    quotationDateController, true),
                                textField(
                                    'Validity Date', validDateController, true),
                                textField('Quotation Type',
                                    quotationTypeController, false),
                                textField('Quote Title',
                                    quotationTitleController, false),
                                SizedBox(
                                  height: 20,
                                )
                              ],
                            ),
                          ),
                        ),

                        // textField(
                        //     'Quotation No.', quotationNoController, false),
                        // textField(
                        //     'Quotation Date', quotationDateController, true),
                        // textField('Validity Date', validDateController, true),
                        // textField(
                        //     'Quotation Type', quotationTypeController, false),
                        // textField(
                        //     'Quote Title', quotationTitleController, false),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20.0, right: 20.0, bottom: 5, top: 10),
                          child: ExpansionTile(
                            title: Text('Customers',
                                style: TextStyle(
                                  color: Colors.blueGrey,
                                  fontSize: 16,
                                )),
                            maintainState: true,
                            dense: true,
                            backgroundColor: Colors.white38,
                            collapsedBackgroundColor: Colors.white,
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15))),
                            collapsedShape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15))),
                            children: [
                              textField('Customer Code', customerCodeController,
                                  false),
                              textField('Address', addressController, false),
                              textField('Tel', telephoneController, false),
                              textField('Email', emailController, false),
                              SizedBox(
                                height: 20,
                              )
                            ],
                          ),
                        ),

                        textField(
                            'SalesmanCode', salesmainCodeController, false),
                        textField(
                            'Reference No.', referenceNoController, false),
                        textField(
                            'Effective Date', effectiveDateController, true),
                        textField('Expiry Date', expireDateController, true),
                        Container(
                          padding:
                              EdgeInsets.only(top: 40, left: 20, right: 20),
                          child: FadeInUp(
                              duration: Duration(milliseconds: 1600),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  // side: BorderSide(color: Colors.yellow, width: 5),
                                  fixedSize: Size(
                                      MediaQuery.of(context).size.width, 20.0),
                                  backgroundColor: Colors.blueAccent,
                                  textStyle: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontStyle: FontStyle.normal),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(50))),
                                ),
                                onPressed: () {},
                                child: Center(
                                  child: Text(
                                    "Save",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              )),
                        ),

                        // Row(
                        //   children: [
                        //     ElevatedButton(
                        //       child: Text('Extra Info'),
                        //       onPressed: () {},
                        //     ),
                        //     SizedBox(width: 30),
                        //     ElevatedButton(
                        //       child: Text('Dimension'),
                        //       onPressed: () {},
                        //     ),
                        //   ],
                        // )

                        // Container(
                        //   child: SingleChildScrollView(
                        //     child: Row(
                        //       mainAxisSize: MainAxisSize.min,
                        //       mainAxisAlignment: MainAxisAlignment.start,
                        //       crossAxisAlignment: CrossAxisAlignment.center,
                        //       children: [
                        //         Padding(
                        //           padding: const EdgeInsets.only(left: 8.0),
                        //           child: SizedBox(
                        //             width: MediaQuery.of(context).size.width / 4,
                        //             child: Text(
                        //               'Quotation No.',
                        //               style: TextStyle(
                        //                 color: Color(0xFF7A8999),
                        //                 fontSize: 14,
                        //                 fontFamily: 'Inter',
                        //                 fontWeight: FontWeight.w700,
                        //                 height: 0.10,
                        //               ),
                        //             ),
                        //           ),
                        //         ),
                        //         const SizedBox(height: 8),
                        //         Expanded(
                        //           child: Container(
                        //             width: MediaQuery.of(context).size.width / 2,
                        //             margin: EdgeInsets.all(10),
                        //             padding: const EdgeInsets.only(
                        //               top: 12,
                        //               left: 12,
                        //               right: 15,
                        //               bottom: 12,
                        //             ),
                        //             clipBehavior: Clip.antiAlias,
                        //             decoration: ShapeDecoration(
                        //               color: Colors.white,
                        //               shape: RoundedRectangleBorder(
                        //                   borderRadius: BorderRadius.circular(8)),
                        //               shadows: [
                        //                 BoxShadow(
                        //                   color: Color(0x149D9B9B),
                        //                   blurRadius: 4,
                        //                   offset: Offset(0, 4),
                        //                   spreadRadius: 0,
                        //                 )
                        //               ],
                        //             ),
                        //             child: Container(
                        //               width: MediaQuery.of(context).size.width / 2,
                        //               height: 20,
                        //               child: TextField(
                        //                   controller: quotationNoController,
                        //                   style: TextStyle(
                        //                     color: Color(0xFF7A8999),
                        //                     fontSize: 14,
                        //                     fontFamily: 'Inter',
                        //                     fontWeight: FontWeight.w500,
                        //                     height: 0.10,
                        //                   ),
                        //                   decoration:
                        //                       InputDecoration(enabledBorder: Oul)),
                        //             ),
                        //           ),
                        //         ),
                        //       ],
                        //     ),
                        //   ),
                        // ),
                        // quote date
                        // Container(
                        //   child: Column(
                        //     mainAxisSize: MainAxisSize.min,
                        //     mainAxisAlignment: MainAxisAlignment.start,
                        //     crossAxisAlignment: CrossAxisAlignment.start,
                        //     children: [
                        //       SizedBox(
                        //         width: 122,
                        //         height: 20,
                        //         child: Text(
                        //           'Quotation Type',
                        //           style: TextStyle(
                        //             color: Color(0xFF7A8999),
                        //             fontSize: 14,
                        //             fontFamily: 'Inter',
                        //             fontWeight: FontWeight.w700,
                        //             height: 0.10,
                        //           ),
                        //         ),
                        //       ),
                        //       const SizedBox(height: 8),
                        //       Expanded(
                        //         child: Container(
                        //           width: double.infinity,
                        //           padding: const EdgeInsets.only(
                        //             top: 12,
                        //             left: 341,
                        //             right: 15,
                        //             bottom: 12,
                        //           ),
                        //           clipBehavior: Clip.antiAlias,
                        //           decoration: ShapeDecoration(
                        //             color: Colors.white,
                        //             shape: RoundedRectangleBorder(
                        //                 borderRadius: BorderRadius.circular(8)),
                        //             shadows: [
                        //               BoxShadow(
                        //                 color: Color(0x149D9B9B),
                        //                 blurRadius: 4,
                        //                 offset: Offset(0, 4),
                        //                 spreadRadius: 0,
                        //               )
                        //             ],
                        //           ),
                        //           child: Row(
                        //             mainAxisSize: MainAxisSize.min,
                        //             mainAxisAlignment: MainAxisAlignment.end,
                        //             crossAxisAlignment: CrossAxisAlignment.center,
                        //             children: [
                        //               Container(
                        //                 width: 24,
                        //                 height: double.infinity,
                        //                 padding: const EdgeInsets.only(
                        //                     top: 3, left: 4, right: 3, bottom: 4),
                        //                 clipBehavior: Clip.antiAlias,
                        //                 decoration: BoxDecoration(),
                        //                 child: Row(
                        //                   mainAxisSize: MainAxisSize.min,
                        //                   mainAxisAlignment: MainAxisAlignment.center,
                        //                   crossAxisAlignment: CrossAxisAlignment.center,
                        //                   children: [
                        //                     Container(
                        //                       width: 17,
                        //                       height: 17,
                        //                       child: Stack(children: []),
                        //                     ),
                        //                   ],
                        //                 ),
                        //               ),
                        //             ],
                        //           ),
                        //         ),
                        //       ),
                        //     ],
                        //   ),
                        // ),
                        // Container(
                        //   child: Column(
                        //     mainAxisSize: MainAxisSize.min,
                        //     mainAxisAlignment: MainAxisAlignment.start,
                        //     crossAxisAlignment: CrossAxisAlignment.start,
                        //     children: [
                        //       SizedBox(
                        //         width: 122,
                        //         height: 20,
                        //         child: Text(
                        //           'Quotation Date',
                        //           style: TextStyle(
                        //             color: Color(0xFF7A8999),
                        //             fontSize: 14,
                        //             fontFamily: 'Inter',
                        //             fontWeight: FontWeight.w700,
                        //             height: 0.10,
                        //           ),
                        //         ),
                        //       ),
                        //       const SizedBox(height: 8),
                        //       Expanded(
                        //         child: Container(
                        //           width: double.infinity,
                        //           padding: const EdgeInsets.only(
                        //             top: 12,
                        //             left: 341,
                        //             right: 15,
                        //             bottom: 12,
                        //           ),
                        //           clipBehavior: Clip.antiAlias,
                        //           decoration: ShapeDecoration(
                        //             color: Colors.white,
                        //             shape: RoundedRectangleBorder(
                        //                 borderRadius: BorderRadius.circular(8)),
                        //             shadows: [
                        //               BoxShadow(
                        //                 color: Color(0x149D9B9B),
                        //                 blurRadius: 4,
                        //                 offset: Offset(0, 4),
                        //                 spreadRadius: 0,
                        //               )
                        //             ],
                        //           ),
                        //           child: Row(
                        //             mainAxisSize: MainAxisSize.min,
                        //             mainAxisAlignment: MainAxisAlignment.end,
                        //             crossAxisAlignment: CrossAxisAlignment.center,
                        //             children: [
                        //               Container(
                        //                 width: 24,
                        //                 height: double.infinity,
                        //                 padding: const EdgeInsets.only(
                        //                     top: 3, left: 4, right: 3, bottom: 4),
                        //                 clipBehavior: Clip.antiAlias,
                        //                 decoration: BoxDecoration(),
                        //                 child: Row(
                        //                   mainAxisSize: MainAxisSize.min,
                        //                   mainAxisAlignment: MainAxisAlignment.center,
                        //                   crossAxisAlignment: CrossAxisAlignment.center,
                        //                   children: [
                        //                     Container(
                        //                       width: 17,
                        //                       height: 17,
                        //                       child: Stack(children: []),
                        //                     ),
                        //                   ],
                        //                 ),
                        //               ),
                        //             ],
                        //           ),
                        //         ),
                        //       ),
                        //     ],
                        //   ),
                        // ),
                        // Container(
                        //   child: Column(
                        //     mainAxisSize: MainAxisSize.min,
                        //     mainAxisAlignment: MainAxisAlignment.start,
                        //     crossAxisAlignment: CrossAxisAlignment.start,
                        //     children: [
                        //       SizedBox(
                        //         width: 122,
                        //         height: 20,
                        //         child: Text(
                        //           'Validity Day',
                        //           style: TextStyle(
                        //             color: Color(0xFF7A8999),
                        //             fontSize: 14,
                        //             fontFamily: 'Inter',
                        //             fontWeight: FontWeight.w700,
                        //             height: 0.10,
                        //           ),
                        //         ),
                        //       ),
                        //       const SizedBox(height: 8),
                        //       Container(
                        //         child: Row(
                        //           mainAxisSize: MainAxisSize.min,
                        //           mainAxisAlignment: MainAxisAlignment.start,
                        //           crossAxisAlignment: CrossAxisAlignment.start,
                        //           children: [
                        //             Container(
                        //               width: 146,
                        //               padding: const EdgeInsets.only(
                        //                 top: 14,
                        //                 left: 12,
                        //                 right: 63,
                        //                 bottom: 14,
                        //               ),
                        //               clipBehavior: Clip.antiAlias,
                        //               decoration: ShapeDecoration(
                        //                 color: Colors.white,
                        //                 shape: RoundedRectangleBorder(
                        //                     borderRadius: BorderRadius.circular(8)),
                        //                 shadows: [
                        //                   BoxShadow(
                        //                     color: Color(0x149D9B9B),
                        //                     blurRadius: 4,
                        //                     offset: Offset(0, 4),
                        //                     spreadRadius: 0,
                        //                   )
                        //                 ],
                        //               ),
                        //               child: Row(
                        //                 mainAxisSize: MainAxisSize.min,
                        //                 mainAxisAlignment: MainAxisAlignment.start,
                        //                 crossAxisAlignment: CrossAxisAlignment.center,
                        //                 children: [
                        //                   SizedBox(
                        //                     width: 71,
                        //                     child: Text(
                        //                       '30',
                        //                       style: TextStyle(
                        //                         color: Color(0xFF7A8999),
                        //                         fontSize: 14,
                        //                         fontFamily: 'Inter',
                        //                         fontWeight: FontWeight.w500,
                        //                         height: 0.10,
                        //                       ),
                        //                     ),
                        //                   ),
                        //                 ],
                        //               ),
                        //             ),
                        //             const SizedBox(width: 8),
                        //             Container(
                        //               height: 48,
                        //               padding: const EdgeInsets.all(12),
                        //               clipBehavior: Clip.antiAlias,
                        //               decoration: ShapeDecoration(
                        //                 color: Colors.white,
                        //                 shape: RoundedRectangleBorder(
                        //                     borderRadius: BorderRadius.circular(8)),
                        //                 shadows: [
                        //                   BoxShadow(
                        //                     color: Color(0x149D9B9B),
                        //                     blurRadius: 4,
                        //                     offset: Offset(0, 4),
                        //                     spreadRadius: 0,
                        //                   )
                        //                 ],
                        //               ),
                        //               child: Row(
                        //                 mainAxisSize: MainAxisSize.min,
                        //                 mainAxisAlignment: MainAxisAlignment.center,
                        //                 crossAxisAlignment: CrossAxisAlignment.center,
                        //                 children: [
                        //                   SizedBox(
                        //                     width: 111,
                        //                     child: Text(
                        //                       '14 - Oct - 2023',
                        //                       style: TextStyle(
                        //                         color: Color(0xFF7A8999),
                        //                         fontSize: 14,
                        //                         fontFamily: 'Inter',
                        //                         fontWeight: FontWeight.w400,
                        //                         height: 0.10,
                        //                       ),
                        //                     ),
                        //                   ),
                        //                   const SizedBox(width: 67),
                        //                   Container(
                        //                     width: 24,
                        //                     height: 24,
                        //                     padding: const EdgeInsets.all(3),
                        //                     clipBehavior: Clip.antiAlias,
                        //                     decoration: BoxDecoration(),
                        //                     child: Row(
                        //                       mainAxisSize: MainAxisSize.min,
                        //                       mainAxisAlignment: MainAxisAlignment.center,
                        //                       crossAxisAlignment:
                        //                           CrossAxisAlignment.center,
                        //                       children: [
                        //                         Container(
                        //                           width: 18,
                        //                           height: 18,
                        //                           child: Stack(
                        //                             children: [
                        //                               Positioned(
                        //                                 left: 0,
                        //                                 top: 0,
                        //                                 child: Container(
                        //                                   width: 18,
                        //                                   height: 18,
                        //                                   child: Stack(children: []),
                        //                                 ),
                        //                               ),
                        //                             ],
                        //                           ),
                        //                         ),
                        //                       ],
                        //                     ),
                        //                   ),
                        //                 ],
                        //               ),
                        //             ),
                        //           ],
                        //         ),
                        //       ),
                        //     ],
                        //   ),
                        // ),
                        // Container(
                        //   child: Column(
                        //     mainAxisSize: MainAxisSize.min,
                        //     mainAxisAlignment: MainAxisAlignment.start,
                        //     crossAxisAlignment: CrossAxisAlignment.start,
                        //     children: [
                        //       SizedBox(
                        //         width: 122,
                        //         height: 20,
                        //         child: Text(
                        //           'Reference No.',
                        //           style: TextStyle(
                        //             color: Color(0xFF7A8999),
                        //             fontSize: 14,
                        //             fontFamily: 'Inter',
                        //             fontWeight: FontWeight.w700,
                        //             height: 0.10,
                        //           ),
                        //         ),
                        //       ),
                        //       const SizedBox(height: 8),
                        //       Container(
                        //         width: 380,
                        //         height: 48,
                        //         clipBehavior: Clip.antiAlias,
                        //         decoration: ShapeDecoration(
                        //           color: Colors.white,
                        //           shape: RoundedRectangleBorder(
                        //               borderRadius: BorderRadius.circular(8)),
                        //           shadows: [
                        //             BoxShadow(
                        //               color: Color(0x149D9B9B),
                        //               blurRadius: 4,
                        //               offset: Offset(0, 4),
                        //               spreadRadius: 0,
                        //             )
                        //           ],
                        //         ),
                        //       ),
                        //     ],
                        //   ),
                        // ),
                        // Container(
                        //   child: Column(
                        //     mainAxisSize: MainAxisSize.min,
                        //     mainAxisAlignment: MainAxisAlignment.start,
                        //     crossAxisAlignment: CrossAxisAlignment.start,
                        //     children: [
                        //       SizedBox(
                        //         width: 122,
                        //         height: 20,
                        //         child: Text(
                        //           'Quote Title',
                        //           style: TextStyle(
                        //             color: Color(0xFF7A8999),
                        //             fontSize: 14,
                        //             fontFamily: 'Inter',
                        //             fontWeight: FontWeight.w700,
                        //             height: 0.10,
                        //           ),
                        //         ),
                        //       ),
                        //       const SizedBox(height: 8),
                        //       Container(
                        //         width: 380,
                        //         height: 48,
                        //         clipBehavior: Clip.antiAlias,
                        //         decoration: ShapeDecoration(
                        //           color: Colors.white,
                        //           shape: RoundedRectangleBorder(
                        //               borderRadius: BorderRadius.circular(8)),
                        //           shadows: [
                        //             BoxShadow(
                        //               color: Color(0x149D9B9B),
                        //               blurRadius: 4,
                        //               offset: Offset(0, 4),
                        //               spreadRadius: 0,
                        //             )
                        //           ],
                        //         ),
                        //       ),
                        //     ],
                        //   ),
                        // ),
                        // Container(
                        //   child: Column(
                        //     mainAxisSize: MainAxisSize.min,
                        //     mainAxisAlignment: MainAxisAlignment.start,
                        //     crossAxisAlignment: CrossAxisAlignment.start,
                        //     children: [
                        //       SizedBox(
                        //         width: 122,
                        //         height: 20,
                        //         child: Text(
                        //           'Tel',
                        //           style: TextStyle(
                        //             color: Color(0xFF7A8999),
                        //             fontSize: 14,
                        //             fontFamily: 'Inter',
                        //             fontWeight: FontWeight.w700,
                        //             height: 0.10,
                        //           ),
                        //         ),
                        //       ),
                        //       const SizedBox(height: 8),
                        //       Expanded(
                        //         child: Container(
                        //           width: double.infinity,
                        //           padding: const EdgeInsets.only(
                        //             top: 14,
                        //             left: 12,
                        //             right: 297,
                        //             bottom: 14,
                        //           ),
                        //           clipBehavior: Clip.antiAlias,
                        //           decoration: ShapeDecoration(
                        //             color: Colors.white,
                        //             shape: RoundedRectangleBorder(
                        //                 borderRadius: BorderRadius.circular(8)),
                        //             shadows: [
                        //               BoxShadow(
                        //                 color: Color(0x149D9B9B),
                        //                 blurRadius: 4,
                        //                 offset: Offset(0, 4),
                        //                 spreadRadius: 0,
                        //               )
                        //             ],
                        //           ),
                        //           child: Row(
                        //             mainAxisSize: MainAxisSize.min,
                        //             mainAxisAlignment: MainAxisAlignment.start,
                        //             crossAxisAlignment: CrossAxisAlignment.center,
                        //             children: [
                        //               SizedBox(
                        //                 width: 71,
                        //                 child: Text(
                        //                   '123456',
                        //                   style: TextStyle(
                        //                     color: Color(0xFF7A8999),
                        //                     fontSize: 14,
                        //                     fontFamily: 'Inter',
                        //                     fontWeight: FontWeight.w500,
                        //                     height: 0.10,
                        //                   ),
                        //                 ),
                        //               ),
                        //             ],
                        //           ),
                        //         ),
                        //       ),
                        //     ],
                        //   ),
                        // ),
                        // Container(
                        //   child: Column(
                        //     mainAxisSize: MainAxisSize.min,
                        //     mainAxisAlignment: MainAxisAlignment.start,
                        //     crossAxisAlignment: CrossAxisAlignment.start,
                        //     children: [
                        //       SizedBox(
                        //         width: 122,
                        //         height: 20,
                        //         child: Text(
                        //           'Email',
                        //           style: TextStyle(
                        //             color: Color(0xFF7A8999),
                        //             fontSize: 14,
                        //             fontFamily: 'Inter',
                        //             fontWeight: FontWeight.w700,
                        //             height: 0.10,
                        //           ),
                        //         ),
                        //       ),
                        //       const SizedBox(height: 8),
                        //       Expanded(
                        //         child: Container(
                        //           width: double.infinity,
                        //           padding: const EdgeInsets.only(
                        //             top: 14,
                        //             left: 12,
                        //             right: 255,
                        //             bottom: 14,
                        //           ),
                        //           clipBehavior: Clip.antiAlias,
                        //           decoration: ShapeDecoration(
                        //             color: Colors.white,
                        //             shape: RoundedRectangleBorder(
                        //                 borderRadius: BorderRadius.circular(8)),
                        //             shadows: [
                        //               BoxShadow(
                        //                 color: Color(0x149D9B9B),
                        //                 blurRadius: 4,
                        //                 offset: Offset(0, 4),
                        //                 spreadRadius: 0,
                        //               )
                        //             ],
                        //           ),
                        //           child: Row(
                        //             mainAxisSize: MainAxisSize.min,
                        //             mainAxisAlignment: MainAxisAlignment.start,
                        //             crossAxisAlignment: CrossAxisAlignment.center,
                        //             children: [
                        //               SizedBox(
                        //                 width: 113,
                        //                 child: Text(
                        //                   'user@gmail.com',
                        //                   style: TextStyle(
                        //                     color: Color(0xFF7A8999),
                        //                     fontSize: 14,
                        //                     fontFamily: 'Inter',
                        //                     fontWeight: FontWeight.w500,
                        //                     height: 0.10,
                        //                   ),
                        //                 ),
                        //               ),
                        //             ],
                        //           ),
                        //         ),
                        //       ),
                        //     ],
                        //   ),
                        // ),
                        // Container(
                        //   height: 76,
                        //   child: Column(
                        //     mainAxisSize: MainAxisSize.min,
                        //     mainAxisAlignment: MainAxisAlignment.start,
                        //     crossAxisAlignment: CrossAxisAlignment.start,
                        //     children: [
                        //       SizedBox(
                        //         width: 122,
                        //         height: 20,
                        //         child: Text(
                        //           'Effective Date',
                        //           style: TextStyle(
                        //             color: Color(0xFF7A8999),
                        //             fontSize: 14,
                        //             fontFamily: 'Inter',
                        //             fontWeight: FontWeight.w700,
                        //             height: 0.10,
                        //           ),
                        //         ),
                        //       ),
                        //       const SizedBox(height: 8),
                        //       Expanded(
                        //         child: Container(
                        //           width: double.infinity,
                        //           padding: const EdgeInsets.only(
                        //             top: 12,
                        //             left: 146,
                        //             right: 12,
                        //             bottom: 12,
                        //           ),
                        //           clipBehavior: Clip.antiAlias,
                        //           decoration: ShapeDecoration(
                        //             color: Colors.white,
                        //             shape: RoundedRectangleBorder(
                        //                 borderRadius: BorderRadius.circular(8)),
                        //             shadows: [
                        //               BoxShadow(
                        //                 color: Color(0x149D9B9B),
                        //                 blurRadius: 4,
                        //                 offset: Offset(0, 4),
                        //                 spreadRadius: 0,
                        //               )
                        //             ],
                        //           ),
                        //           child: Row(
                        //             mainAxisSize: MainAxisSize.min,
                        //             mainAxisAlignment: MainAxisAlignment.end,
                        //             crossAxisAlignment: CrossAxisAlignment.center,
                        //             children: [
                        //               Container(
                        //                 width: 24,
                        //                 height: double.infinity,
                        //                 padding: const EdgeInsets.all(3),
                        //                 clipBehavior: Clip.antiAlias,
                        //                 decoration: BoxDecoration(),
                        //                 child: Row(
                        //                   mainAxisSize: MainAxisSize.min,
                        //                   mainAxisAlignment: MainAxisAlignment.center,
                        //                   crossAxisAlignment: CrossAxisAlignment.center,
                        //                   children: [
                        //                     Container(
                        //                       width: 18,
                        //                       height: 18,
                        //                       child: Stack(
                        //                         children: [
                        //                           Positioned(
                        //                             left: 0,
                        //                             top: 0,
                        //                             child: Container(
                        //                               width: 18,
                        //                               height: 18,
                        //                               child: Stack(children: []),
                        //                             ),
                        //                           ),
                        //                         ],
                        //                       ),
                        //                     ),
                        //                   ],
                        //                 ),
                        //               ),
                        //             ],
                        //           ),
                        //         ),
                        //       ),
                        //     ],
                        //   ),
                        // ),
                        // Container(
                        //   height: 76,
                        //   child: Column(
                        //     mainAxisSize: MainAxisSize.min,
                        //     mainAxisAlignment: MainAxisAlignment.start,
                        //     crossAxisAlignment: CrossAxisAlignment.start,
                        //     children: [
                        //       SizedBox(
                        //         width: 122,
                        //         height: 20,
                        //         child: Text(
                        //           'Expiry Date',
                        //           style: TextStyle(
                        //             color: Color(0xFF7A8999),
                        //             fontSize: 14,
                        //             fontFamily: 'Inter',
                        //             fontWeight: FontWeight.w700,
                        //             height: 0.10,
                        //           ),
                        //         ),
                        //       ),
                        //       const SizedBox(height: 8),
                        //       Expanded(
                        //         child: Container(
                        //           width: double.infinity,
                        //           padding: const EdgeInsets.only(
                        //             top: 12,
                        //             left: 146,
                        //             right: 12,
                        //             bottom: 12,
                        //           ),
                        //           clipBehavior: Clip.antiAlias,
                        //           decoration: ShapeDecoration(
                        //             color: Colors.white,
                        //             shape: RoundedRectangleBorder(
                        //                 borderRadius: BorderRadius.circular(8)),
                        //             shadows: [
                        //               BoxShadow(
                        //                 color: Color(0x149D9B9B),
                        //                 blurRadius: 4,
                        //                 offset: Offset(0, 4),
                        //                 spreadRadius: 0,
                        //               )
                        //             ],
                        //           ),
                        //           child: Row(
                        //             mainAxisSize: MainAxisSize.min,
                        //             mainAxisAlignment: MainAxisAlignment.end,
                        //             crossAxisAlignment: CrossAxisAlignment.center,
                        //             children: [
                        //               Container(
                        //                 width: 24,
                        //                 height: double.infinity,
                        //                 padding: const EdgeInsets.all(3),
                        //                 clipBehavior: Clip.antiAlias,
                        //                 decoration: BoxDecoration(),
                        //                 child: Row(
                        //                   mainAxisSize: MainAxisSize.min,
                        //                   mainAxisAlignment: MainAxisAlignment.center,
                        //                   crossAxisAlignment: CrossAxisAlignment.center,
                        //                   children: [
                        //                     Container(
                        //                       width: 18,
                        //                       height: 18,
                        //                       child: Stack(
                        //                         children: [
                        //                           Positioned(
                        //                             left: 0,
                        //                             top: 0,
                        //                             child: Container(
                        //                               width: 18,
                        //                               height: 18,
                        //                               child: Stack(children: []),
                        //                             ),
                        //                           ),
                        //                         ],
                        //                       ),
                        //                     ),
                        //                   ],
                        //                 ),
                        //               ),
                        //             ],
                        //           ),
                        //         ),
                        //       ),
                        //     ],
                        //   ),
                        // ),
                        // Container(
                        //   child: Column(
                        //     mainAxisSize: MainAxisSize.min,
                        //     mainAxisAlignment: MainAxisAlignment.start,
                        //     crossAxisAlignment: CrossAxisAlignment.start,
                        //     children: [
                        //       SizedBox(
                        //         width: 122,
                        //         height: 20,
                        //         child: Text(
                        //           'Address',
                        //           style: TextStyle(
                        //             color: Color(0xFF7A8999),
                        //             fontSize: 14,
                        //             fontFamily: 'Inter',
                        //             fontWeight: FontWeight.w700,
                        //             height: 0.10,
                        //           ),
                        //         ),
                        //       ),
                        //       const SizedBox(height: 8),
                        //       Expanded(
                        //         child: Container(
                        //           width: double.infinity,
                        //           padding: const EdgeInsets.only(
                        //             top: 14,
                        //             left: 12,
                        //             right: 25,
                        //             bottom: 36,
                        //           ),
                        //           clipBehavior: Clip.antiAlias,
                        //           decoration: ShapeDecoration(
                        //             color: Colors.white,
                        //             shape: RoundedRectangleBorder(
                        //                 borderRadius: BorderRadius.circular(8)),
                        //             shadows: [
                        //               BoxShadow(
                        //                 color: Color(0x149D9B9B),
                        //                 blurRadius: 4,
                        //                 offset: Offset(0, 4),
                        //                 spreadRadius: 0,
                        //               )
                        //             ],
                        //           ),
                        //           child: Row(
                        //             mainAxisSize: MainAxisSize.min,
                        //             mainAxisAlignment: MainAxisAlignment.start,
                        //             crossAxisAlignment: CrossAxisAlignment.center,
                        //             children: [
                        //               SizedBox(
                        //                 width: 343,
                        //                 child: Text(
                        //                   '522/ 188-9, SOI SAP THANEE, ASOKE-DINDAENG ROAD, DINDAENG, BANGKOK 10400',
                        //                   style: TextStyle(
                        //                     color: Color(0xFF7A8999),
                        //                     fontSize: 14,
                        //                     fontFamily: 'Inter',
                        //                     fontWeight: FontWeight.w400,
                        //                     height: 0.10,
                        //                   ),
                        //                 ),
                        //               ),
                        //             ],
                        //           ),
                        //         ),
                        //       ),
                        //     ],
                        //   ),
                        // ),
                        // Container(
                        //   child: Column(
                        //     mainAxisSize: MainAxisSize.min,
                        //     mainAxisAlignment: MainAxisAlignment.start,
                        //     crossAxisAlignment: CrossAxisAlignment.start,
                        //     children: [
                        //       SizedBox(
                        //         width: 122,
                        //         height: 20,
                        //         child: Text(
                        //           'Customer Code',
                        //           style: TextStyle(
                        //             color: Color(0xFF7A8999),
                        //             fontSize: 14,
                        //             fontFamily: 'Inter',
                        //             fontWeight: FontWeight.w700,
                        //             height: 0.10,
                        //           ),
                        //         ),
                        //       ),
                        //       const SizedBox(height: 8),
                        //       Container(
                        //         child: Row(
                        //           mainAxisSize: MainAxisSize.min,
                        //           mainAxisAlignment: MainAxisAlignment.start,
                        //           crossAxisAlignment: CrossAxisAlignment.start,
                        //           children: [
                        //             Container(
                        //               width: 100,
                        //               padding: const EdgeInsets.only(
                        //                 top: 14,
                        //                 left: 12,
                        //                 right: 17,
                        //                 bottom: 14,
                        //               ),
                        //               clipBehavior: Clip.antiAlias,
                        //               decoration: ShapeDecoration(
                        //                 color: Colors.white,
                        //                 shape: RoundedRectangleBorder(
                        //                     borderRadius: BorderRadius.circular(8)),
                        //                 shadows: [
                        //                   BoxShadow(
                        //                     color: Color(0x149D9B9B),
                        //                     blurRadius: 4,
                        //                     offset: Offset(0, 4),
                        //                     spreadRadius: 0,
                        //                   )
                        //                 ],
                        //               ),
                        //               child: Row(
                        //                 mainAxisSize: MainAxisSize.min,
                        //                 mainAxisAlignment: MainAxisAlignment.start,
                        //                 crossAxisAlignment: CrossAxisAlignment.center,
                        //                 children: [
                        //                   SizedBox(
                        //                     width: 71,
                        //                     child: Text(
                        //                       'CARGO11',
                        //                       style: TextStyle(
                        //                         color: Color(0xFF7A8999),
                        //                         fontSize: 14,
                        //                         fontFamily: 'Inter',
                        //                         fontWeight: FontWeight.w500,
                        //                         height: 0.10,
                        //                       ),
                        //                     ),
                        //                   ),
                        //                 ],
                        //               ),
                        //             ),
                        //             const SizedBox(width: 8),
                        //             Container(
                        //               width: 272,
                        //               height: 48,
                        //               padding: const EdgeInsets.symmetric(
                        //                   horizontal: 12, vertical: 14),
                        //               clipBehavior: Clip.antiAlias,
                        //               decoration: ShapeDecoration(
                        //                 color: Colors.white,
                        //                 shape: RoundedRectangleBorder(
                        //                     borderRadius: BorderRadius.circular(8)),
                        //                 shadows: [
                        //                   BoxShadow(
                        //                     color: Color(0x149D9B9B),
                        //                     blurRadius: 4,
                        //                     offset: Offset(0, 4),
                        //                     spreadRadius: 0,
                        //                   )
                        //                 ],
                        //               ),
                        //               child: Row(
                        //                 mainAxisSize: MainAxisSize.min,
                        //                 mainAxisAlignment: MainAxisAlignment.center,
                        //                 crossAxisAlignment: CrossAxisAlignment.center,
                        //                 children: [
                        //                   SizedBox(
                        //                     width: 248,
                        //                     child: Text(
                        //                       'CARGO EXPRESS INTERNATIONAL...',
                        //                       style: TextStyle(
                        //                         color: Color(0xFF7A8999),
                        //                         fontSize: 14,
                        //                         fontFamily: 'Inter',
                        //                         fontWeight: FontWeight.w400,
                        //                         height: 0.10,
                        //                       ),
                        //                     ),
                        //                   ),
                        //                 ],
                        //               ),
                        //             ),
                        //           ],
                        //         ),
                        //       ),
                        //     ],
                        //   ),
                        // ),
                        // Container(
                        //   child: Column(
                        //     mainAxisSize: MainAxisSize.min,
                        //     mainAxisAlignment: MainAxisAlignment.start,
                        //     crossAxisAlignment: CrossAxisAlignment.start,
                        //     children: [
                        //       SizedBox(
                        //         width: 122,
                        //         height: 20,
                        //         child: Text(
                        //           'Salesman Code',
                        //           style: TextStyle(
                        //             color: Color(0xFF7A8999),
                        //             fontSize: 14,
                        //             fontFamily: 'Inter',
                        //             fontWeight: FontWeight.w700,
                        //             height: 0.10,
                        //           ),
                        //         ),
                        //       ),
                        //       const SizedBox(height: 8),
                        //       Container(
                        //         child: Row(
                        //           mainAxisSize: MainAxisSize.min,
                        //           mainAxisAlignment: MainAxisAlignment.start,
                        //           crossAxisAlignment: CrossAxisAlignment.start,
                        //           children: [
                        //             Container(
                        //               width: 100,
                        //               padding: const EdgeInsets.only(
                        //                 top: 14,
                        //                 left: 12,
                        //                 right: 17,
                        //                 bottom: 14,
                        //               ),
                        //               clipBehavior: Clip.antiAlias,
                        //               decoration: ShapeDecoration(
                        //                 color: Colors.white,
                        //                 shape: RoundedRectangleBorder(
                        //                     borderRadius: BorderRadius.circular(8)),
                        //                 shadows: [
                        //                   BoxShadow(
                        //                     color: Color(0x149D9B9B),
                        //                     blurRadius: 4,
                        //                     offset: Offset(0, 4),
                        //                     spreadRadius: 0,
                        //                   )
                        //                 ],
                        //               ),
                        //               child: Row(
                        //                 mainAxisSize: MainAxisSize.min,
                        //                 mainAxisAlignment: MainAxisAlignment.start,
                        //                 crossAxisAlignment: CrossAxisAlignment.center,
                        //                 children: [
                        //                   SizedBox(
                        //                     width: 71,
                        //                     child: Text(
                        //                       'TWL',
                        //                       style: TextStyle(
                        //                         color: Color(0xFF7A8999),
                        //                         fontSize: 14,
                        //                         fontFamily: 'Inter',
                        //                         fontWeight: FontWeight.w500,
                        //                         height: 0.10,
                        //                       ),
                        //                     ),
                        //                   ),
                        //                 ],
                        //               ),
                        //             ),
                        //             const SizedBox(width: 8),
                        //             Container(
                        //               width: 272,
                        //               height: 48,
                        //               padding: const EdgeInsets.symmetric(
                        //                   horizontal: 12, vertical: 14),
                        //               clipBehavior: Clip.antiAlias,
                        //               decoration: ShapeDecoration(
                        //                 color: Colors.white,
                        //                 shape: RoundedRectangleBorder(
                        //                     borderRadius: BorderRadius.circular(8)),
                        //                 shadows: [
                        //                   BoxShadow(
                        //                     color: Color(0x149D9B9B),
                        //                     blurRadius: 4,
                        //                     offset: Offset(0, 4),
                        //                     spreadRadius: 0,
                        //                   )
                        //                 ],
                        //               ),
                        //               child: Row(
                        //                 mainAxisSize: MainAxisSize.min,
                        //                 mainAxisAlignment: MainAxisAlignment.center,
                        //                 crossAxisAlignment: CrossAxisAlignment.center,
                        //                 children: [
                        //                   SizedBox(
                        //                     width: 248,
                        //                     child: Text(
                        //                       'WIN LATT',
                        //                       style: TextStyle(
                        //                         color: Color(0xFF7A8999),
                        //                         fontSize: 14,
                        //                         fontFamily: 'Inter',
                        //                         fontWeight: FontWeight.w400,
                        //                         height: 0.10,
                        //                       ),
                        //                     ),
                        //                   ),
                        //                 ],
                        //               ),
                        //             ),
                        //           ],
                        //         ),
                        //       ),
                        //     ],
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}

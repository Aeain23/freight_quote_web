import 'package:flutter/material.dart';
import 'package:FreightQuote/widgets/dashboard_screen.dart';

class FreightChargeScreen extends StatefulWidget {
  static const routeName = '/freightChargeScreen';
  const FreightChargeScreen({super.key});

  @override
  State<FreightChargeScreen> createState() => _FreightChargeScreenState();
}

class _FreightChargeScreenState extends State<FreightChargeScreen> {
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
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: Color(0xFF936396),
              ),
              onPressed: () {
                Navigator.of(context)
                    .pushReplacementNamed(DashboardScreen.routeName);
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
          body: Text("Freight Charge")),
    );
  }
}

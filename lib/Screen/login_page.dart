import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:welding_system/Screen/home_page.dart';
import 'package:welding_system/Widgets/AppBars.dart';
import 'package:welding_system/Widgets/Colors.dart';
import 'package:welding_system/Widgets/data_sync.dart';
import 'package:welding_system/Widgets/homescreen.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool preProtect = false;
  final DataUpdate dataUpdate = new DataUpdate();

  // TextEditingController idcontroller = TextEditingController();
  // TextEditingController passwordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(30),
          child: Column(
            children: [
              SizedBox(height: 100),
              Align(
                child: Text("WELDING SYSTEM",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.indigo)),
              ),
              SizedBox(height: 100),
              Align(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.6,
                  height: MediaQuery.of(context).size.width * 0.13,
                  child: Container(
                    child: TextButton(
                      style: ButtonStyle(
                          foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                          backgroundColor: MaterialStateProperty.all<Color>(
                              ColorSelect.TheamColor),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(25.0),
                                      side: BorderSide(
                                          color: ColorSelect.TheamColor)))),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => HomeScreen()));
                      },
                      child:
                          Text("Verify WiFi", style: TextStyle(fontSize: 14)),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 50),
              Align(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.6,
                  height: MediaQuery.of(context).size.width * 0.13,
                  child: Container(
                    child: TextButton(
                      style: ButtonStyle(
                          foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                          backgroundColor: MaterialStateProperty.all<Color>(
                              ColorSelect.TheamColor),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(25.0),
                                      side: BorderSide(
                                          color: ColorSelect.TheamColor)))),
                      onPressed: () {
                        Future.delayed(Duration.zero, () async {
                          dataUpdate.channelConnect().then(
                                (value) => print(value),
                              ); //connect to WebSocket wth NodeMCU
                        });
                      },
                      child: Text("Connect Hardware",
                          style: TextStyle(fontSize: 14)),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

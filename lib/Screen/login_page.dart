import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:welding_system/Screen/home_page.dart';
import 'package:welding_system/Widgets/AppBars.dart';
import 'package:welding_system/Widgets/Colors.dart';
import 'package:welding_system/Widgets/homescreen.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:web_socket_channel/status.dart' as status;

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool preProtect = false;
  late WebSocketChannel channel;
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
              // Text("SSID"),
              // SizedBox(height: 10),
              // TextField(
              //   controller: idcontroller,
              // ),
              // SizedBox(height: 20),
              // Text("Password"),
              // SizedBox(height: 10),
              // TextField(
              //   controller: passwordcontroller,
              //
              // ),
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
                      child: Text("Verify WiFi",style: TextStyle(fontSize: 14)),
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
                        Future.delayed(Duration.zero,() async {
                          channelConnect(); //connect to WebSocket wth NodeMCU
                        });

                      },
                      child: Text("Connect Hardware",style: TextStyle(fontSize: 14)),
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
  channelConnect() async {
    final wsUrl = Uri.parse("ws://192.168.0.1:81");
    channel = WebSocketChannel.connect(wsUrl);

    channel.stream.listen((message) {
      final response = jsonDecode(message);

      String body = response['data']['message'];


      if(body== "connected"){
        channel.sink.add('home');
        print(">>>>>>>>>>>>>>>>"+message);

        /*  Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => HomeScreen()));*/

      }else if(body == "homeData"){
        print(">>>>>>>>>>>>>>>>"+message);
        final response = jsonDecode(message);
        final value = response['data']['value'];
        String laserValue= value['DutyCycle'].toString();
        print(">>>>>>>>>>>>>>>>"+laserValue);

      }

      // channel.sink.add('received!');
      //channel.sink.close(status.goingAway);
    });
  }
}

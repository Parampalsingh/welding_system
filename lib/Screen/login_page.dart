import 'package:flutter/material.dart';
import 'package:welding_system/Screen/home_page.dart';
import 'package:welding_system/Widgets/AppBars.dart';
import 'package:welding_system/Widgets/homescreen.dart';

class LoginPage extends StatefulWidget {

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool preProtect = false;
  TextEditingController idcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 100),
              Text("SSID"),
              SizedBox(height: 10),
              TextField(
                controller: idcontroller,
              ),
              SizedBox(height: 20),
              Text("Password"),
              SizedBox(height: 10),
              TextField(
                controller: passwordcontroller,

              ),
              SizedBox(height: 40),
              Align(
                child: SizedBox(
                  width: 150,
                  height: 50,
                  child: Container(
                    child: TextButton(
                      style: ButtonStyle(
                          foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                          backgroundColor: MaterialStateProperty.all<Color>(Colors.yellow),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25.0),
                                  side: BorderSide(color: Colors.yellow)
                              )
                          )

                      ),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomeScreen()));

                      },
                      child: Text("Login"),
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
import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:welding_system/Widgets/AppBars.dart';
import 'package:welding_system/Widgets/Colors.dart';
import 'package:welding_system/util/constants.dart';

class LaserParameterPage extends StatefulWidget {
  @override
  State<LaserParameterPage> createState() => _LaserParameterPageState();
}

class _LaserParameterPageState extends State<LaserParameterPage> {
  bool preProtect = false;
  bool autoShutter = false;
  bool foodProtect = false;
  bool weldingMode = false;
  bool showAlert = false;



  TextEditingController _LaserPowercontroller = TextEditingController();


  @override
  void initState() {
    super.initState();
    _LaserPowercontroller = new TextEditingController(text: '1500');
  }

  showAlertDialog(BuildContext context) {
    // set up the button
    Widget okButton = TextButton(
      child: Text("OK"),
      onPressed: () {},
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("My title"),
      content: Text("This is my message."),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBars(),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(30),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(pe_protect,
                      style: TextStyle(
                          color: ColorSelect.TheamColor, fontSize: 20)),
                  CupertinoSwitch(
                    value: preProtect,
                    onChanged: (value) {
                      setState(() {
                        if (showAlert == true) {
                          preProtect = value;
                        } else {
                          _showTextInputDialog(context);
                          showAlert = true;
                        }
                      });
                    },
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(auto_shutter,
                      style: TextStyle(
                          color: ColorSelect.TheamColor, fontSize: 20)),
                  CupertinoSwitch(
                    value: autoShutter,
                    onChanged: (value) {
                      setState(() {
                        autoShutter = value;
                      });
                    },
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(foot_protect,
                      style: TextStyle(
                          color: ColorSelect.TheamColor, fontSize: 20)),
                  CupertinoSwitch(
                    value: foodProtect,
                    onChanged: (value) {
                      setState(() {
                        if (showAlert == true) {
                          foodProtect = value;
                        } else {
                          _showTextInputDialog(context);
                          showAlert = true;
                        }
                      });
                    },
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(welding_mode,
                      style: TextStyle(
                          color: ColorSelect.TheamColor, fontSize: 20)),
                  CupertinoSwitch(
                    value: weldingMode,
                    onChanged: (value) {
                      setState(() {
                        weldingMode = value;
                      });
                    },
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(laser_power,
                      style: TextStyle(
                          color: ColorSelect.TheamColor, fontSize: 20)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 50.0,
                        child: new TextField(
                          style:TextStyle(color: ColorSelect.black, fontSize: 18),
                          controller: _LaserPowercontroller,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration.collapsed(
                            hintText: "",

                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      Text("W",
                          style: TextStyle(color: ColorSelect.black, fontSize: 18)),
                    ],
                  ),


                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(laser_vol_range,
                      style: TextStyle(
                          color: ColorSelect.TheamColor, fontSize: 20)),
                  Text("V",
                      style: TextStyle(color: ColorSelect.black, fontSize: 18)),
                ],
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(point_ontime,
                      style: TextStyle(
                          color: ColorSelect.TheamColor, fontSize: 20)),
                  Text("100 MS",
                      style: TextStyle(color: ColorSelect.black, fontSize: 18)),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(point_offtime,
                      style: TextStyle(
                          color: ColorSelect.TheamColor, fontSize: 20)),
                  Text("100 MS",
                      style: TextStyle(color: ColorSelect.black, fontSize: 18)),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(on_gasDelay,
                      style: TextStyle(
                          color: ColorSelect.TheamColor, fontSize: 20)),
                  Text("0 mS",
                      style: TextStyle(color: ColorSelect.black, fontSize: 18)),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(off_gasDelay,
                      style: TextStyle(
                          color: ColorSelect.TheamColor, fontSize: 20)),
                  Text("200 MS",
                      style: TextStyle(color: ColorSelect.black, fontSize: 18)),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  final _textFieldController = TextEditingController();

  // Initially password is obscure
  bool _obscureText = false;

  late String _password;

  // Toggles the password show status
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  Future<String?> _showTextInputDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Control Password'),
            content: TextFormField(
              keyboardType: TextInputType.text,
              controller: _textFieldController,
              obscureText: _obscureText, //This will obscure text dynamically
              decoration: InputDecoration(
                hintText: 'Enter your password',
                // Here is key idea
                // suffixIcon: IconButton(
                //   icon: Icon(
                //     // Based on passwordVisible state choose the icon
                //     _obscureText ? Icons.visibility : Icons.visibility_off,
                //     color: Theme.of(context).primaryColorDark,
                //   ),
                //   onPressed: _toggle,
                // ),
              ),
            ),
            actions: <Widget>[
              ElevatedButton(
                child: const Text("Submit"),
                onPressed: () => Navigator.pop(context),
              ),
              ElevatedButton(
                child: const Text('Cancel'),
                onPressed: () =>
                    Navigator.pop(context, _textFieldController.text),
              ),
            ],
          );
        });
  }
}

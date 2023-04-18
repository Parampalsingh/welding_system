import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:welding_system/Widgets/AppBars.dart';
import 'package:welding_system/Widgets/Colors.dart';
import 'package:welding_system/util/constants.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool preProtect = false;
  bool redlightswitch = false;
  bool blowswitch = false;
  bool swingswitch = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBars(),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(30),
          child: Column(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 120,
                      height: 50,
                      child: TextButton(
                        style: ButtonStyle(
                          foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                          backgroundColor: MaterialStateProperty.all<Color>(ColorSelect.TheamColor)
                        ),
                        onPressed: () {

                        },
                        child: Text(technique),
                      ),
                    ),
                    Text("5",
                        style: TextStyle(color: ColorSelect.black, fontSize: 18)),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(laser_cur,
                      style: TextStyle(
                          color: ColorSelect.TheamColor, fontSize: 20)),
                  Text("1200 W",
                      style: TextStyle(color: ColorSelect.black, fontSize: 18)),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(laser_pwr,
                      style: TextStyle(
                          color: ColorSelect.TheamColor, fontSize: 20)),
                  Text("58.0 %",
                      style: TextStyle(color: ColorSelect.black, fontSize: 18)),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(laser_freq,
                      style: TextStyle(
                          color: ColorSelect.TheamColor, fontSize: 20)),
                  Text("2000 Hz",
                      style: TextStyle(color: ColorSelect.black, fontSize: 18)),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(wobble_speed,
                      style: TextStyle(
                          color: ColorSelect.TheamColor, fontSize: 20)),
                  Text("1000 MM/S",
                      style: TextStyle(color: ColorSelect.black, fontSize: 18)),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(swing_width,
                      style: TextStyle(
                          color: ColorSelect.TheamColor, fontSize: 20)),
                  Text("5.0 MS",
                      style: TextStyle(color: ColorSelect.black, fontSize: 18)),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(shutter_switch,
                      style: TextStyle(
                          color: ColorSelect.TheamColor, fontSize: 20)),
                  CupertinoSwitch(
                    value: preProtect,
                    onChanged: (value) {
                      setState(() {
                        preProtect = value;
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
                  Text(redlight_switch,
                      style: TextStyle(
                          color: ColorSelect.TheamColor, fontSize: 20)),
                  CupertinoSwitch(
                    value: redlightswitch,
                    onChanged: (value) {
                      setState(() {
                        redlightswitch = value;
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
                  Text(blow_switch,
                      style: TextStyle(
                          color: ColorSelect.TheamColor, fontSize: 20)),
                  CupertinoSwitch(
                    value: blowswitch,
                    onChanged: (value) {
                      setState(() {
                        blowswitch = value;
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
                  Text(swing_switch,
                      style: TextStyle(
                          color: ColorSelect.TheamColor, fontSize: 20)),
                  CupertinoSwitch(
                    value: swingswitch,
                    onChanged: (value) {
                      setState(() {
                        swingswitch = value;
                      });
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

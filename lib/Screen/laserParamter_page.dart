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
                  Text(pe_protect,style: TextStyle(color: ColorSelect.TheamColor,fontSize: 20)),
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
                  Text(auto_shutter,style: TextStyle(color: ColorSelect.TheamColor,fontSize: 20)),
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
                  Text(foot_protect,style: TextStyle(color: ColorSelect.TheamColor,fontSize: 20)),
                  CupertinoSwitch(
                    value: foodProtect,
                    onChanged: (value) {
                      setState(() {
                        foodProtect = value;
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
                  Text(welding_mode,style: TextStyle(color: ColorSelect.TheamColor,fontSize: 20)),
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
                  Text(laser_power,style: TextStyle(color: ColorSelect.TheamColor,fontSize: 20)),
                  Text("0 W- 1500 W",style: TextStyle(color: ColorSelect.black,fontSize: 18)),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(laser_vol_range,style: TextStyle(color: ColorSelect.TheamColor,fontSize: 20)),
                  Text("0 V- 10 V",style: TextStyle(color: ColorSelect.black,fontSize: 18)),
                ],
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(point_ontime,style: TextStyle(color: ColorSelect.TheamColor,fontSize: 20)),
                  Text("100 MS",style: TextStyle(color: ColorSelect.black,fontSize: 18)),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(point_offtime,style: TextStyle(color: ColorSelect.TheamColor,fontSize: 20)),
                  Text("100 MS",style: TextStyle(color: ColorSelect.black,fontSize: 18)),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(on_gasDelay,style: TextStyle(color: ColorSelect.TheamColor,fontSize: 20)),
                  Text("0 mS",style: TextStyle(color: ColorSelect.black,fontSize: 18)),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(off_gasDelay,style: TextStyle(color: ColorSelect.TheamColor,fontSize: 20)),
                  Text("200 MS",style: TextStyle(color: ColorSelect.black,fontSize: 18)),
                ],
              )
            ],
          ),

        ),
      ),

    );
  }
}



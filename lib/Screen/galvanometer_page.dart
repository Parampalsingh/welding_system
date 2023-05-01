import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:welding_system/Widgets/AppBars.dart';
import 'package:welding_system/Widgets/Colors.dart';
import 'package:welding_system/util/constants.dart';


class GalvanometerParameter extends StatefulWidget {

  @override
  State<GalvanometerParameter> createState() => _GalvanometerParameterState();
}

class _GalvanometerParameterState extends State<GalvanometerParameter> {
  bool preProtect = false;


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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(galvo_zoom,style: TextStyle(color: ColorSelect.TheamColor,fontSize: 20)),
                  Text("1.0",style: TextStyle(color: ColorSelect.black,fontSize: 18)),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(wooble_speed,style: TextStyle(color: ColorSelect.TheamColor,fontSize: 20)),
                  Text("3000 mm/s",style: TextStyle(color: ColorSelect.black,fontSize: 18)),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(swing_width,style: TextStyle(color: ColorSelect.TheamColor,fontSize: 20)),
                  Text("3.0",style: TextStyle(color: ColorSelect.black,fontSize: 18)),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(swing_switch,style: TextStyle(color: ColorSelect.TheamColor,fontSize: 20)),
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
            ],
          ),

        ),
      ),

    );
  }
}
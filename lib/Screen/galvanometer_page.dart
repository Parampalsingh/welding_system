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

  TextEditingController _zoomGaincontroller = TextEditingController();
  TextEditingController _woobleSpeedcontroller = TextEditingController();
  TextEditingController _swingWidthcontroller = TextEditingController();


  @override
  void initState() {
    super.initState();
    _zoomGaincontroller = new TextEditingController(text: '1.0');
    _woobleSpeedcontroller = new TextEditingController(text: '3000');
    _swingWidthcontroller = new TextEditingController(text: '3.0');

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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(galvo_zoom,style: TextStyle(color: ColorSelect.TheamColor,fontSize: 20)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 50.0,
                        child: new TextField(
                          style:TextStyle(color: ColorSelect.black, fontSize: 18),
                          controller: _zoomGaincontroller,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration.collapsed(
                            hintText: "",
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      // Text("v",
                      //     style: TextStyle(color: ColorSelect.black, fontSize: 18)),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(wooble_speed,style: TextStyle(color: ColorSelect.TheamColor,fontSize: 20)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 50.0,
                        child: new TextField(
                          style:TextStyle(color: ColorSelect.black, fontSize: 18),
                          controller: _woobleSpeedcontroller,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration.collapsed(
                            hintText: "",
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      Text("mm/s",
                          style: TextStyle(color: ColorSelect.black, fontSize: 18)),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(swing_width,style: TextStyle(color: ColorSelect.TheamColor,fontSize: 20)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 50.0,
                        child: new TextField(
                          style:TextStyle(color: ColorSelect.black, fontSize: 18),
                          controller: _swingWidthcontroller,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration.collapsed(
                            hintText: "",
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      // Text("v",
                      //     style: TextStyle(color: ColorSelect.black, fontSize: 18)),
                    ],
                  ),
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
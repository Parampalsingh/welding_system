import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:welding_system/Widgets/AppBars.dart';
import 'package:welding_system/Widgets/Colors.dart';
import 'package:welding_system/util/constants.dart';


class WireFeederPage extends StatefulWidget {

  @override
  State<WireFeederPage> createState() => _WireFeederPageState();
}

class _WireFeederPageState extends State<WireFeederPage> {
  bool wireFeedSwitch = false;
  bool wireDir = false;
  bool returnSwitch = false;


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
                  Text("Wire feed switch",style: TextStyle(color: ColorSelect.TheamColor,fontSize: 20)),
                  CupertinoSwitch(
                    value: wireFeedSwitch,
                    onChanged: (value) {
                      setState(() {
                        wireFeedSwitch = value;
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
                  Text("Wire Dir",style: TextStyle(color: ColorSelect.TheamColor,fontSize: 20)),
                  CupertinoSwitch(
                    value: wireDir,
                    onChanged: (value) {
                      setState(() {
                        wireDir = value;
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
                  Text("Return Switch",style: TextStyle(color: ColorSelect.TheamColor,fontSize: 20)),
                  CupertinoSwitch(
                    value: returnSwitch,
                    onChanged: (value) {
                      setState(() {
                        returnSwitch = value;
                      });
                    },
                  ),
                ],
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Return Time",style: TextStyle(color: ColorSelect.TheamColor,fontSize: 20)),
                  Text("0 MS",style: TextStyle(color: ColorSelect.black,fontSize: 18)),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Wire Speed",style: TextStyle(color: ColorSelect.TheamColor,fontSize: 20)),
                  Text("0 %",style: TextStyle(color: ColorSelect.black,fontSize: 18)),
                ],
              ),
            ],
          ),

        ),
      ),

    );
  }
}
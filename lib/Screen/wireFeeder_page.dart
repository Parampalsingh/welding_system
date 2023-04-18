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
  int? groupValue = 0;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBars(),
      body: Column(
        children: [
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(30),
            child: CupertinoSlidingSegmentedControl<int>(
              backgroundColor: CupertinoColors.systemGrey3,
              thumbColor: Colors.green,
              groupValue: groupValue,
              children: {
                0: buildSegment(wire_home),
                1: buildSegment(wire_parameter),
                2: buildSegment(wire_settings),
              },
              onValueChanged: (value) {
                setState(() {
                  groupValue = value;
                });
              },
            ),
          ),
          SizedBox(height: 20),
          if (groupValue == 0) ...[
            homeSegment()
          ] else if (groupValue == 1) ...[
            parameterSegment()
          ] else if (groupValue == 2) ...[
            settingSegment()
          ]
        ],
      ),
    );
  }
}

Widget buildSegment(String text) {
  return Container(
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        text,
        style: TextStyle(fontSize: 18, color: Colors.white),
      ),
    ),
  );
}

Widget homeSegment() {
  return Container(
      padding: EdgeInsets.fromLTRB(30, 10, 30, 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 120,
                height: 50,
                child: TextButton(
                  style: ButtonStyle(
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                      backgroundColor: MaterialStateProperty.all<Color>(
                          ColorSelect.TheamColor)),
                  onPressed: () {},
                  child: Text(mannul_feeding,
                      style: TextStyle(fontSize: 13, color: Colors.white)),
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                width: 120,
                height: 50,
                child: TextButton(
                  style: ButtonStyle(
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                      backgroundColor: MaterialStateProperty.all<Color>(
                          ColorSelect.TheamColor)),
                  onPressed: () {},
                  child: Text(mannul_rollback,
                      style: TextStyle(fontSize: 13, color: Colors.white)),
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                width: 120,
                height: 50,
                child: TextButton(
                  style: ButtonStyle(
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                      backgroundColor: MaterialStateProperty.all<Color>(
                          ColorSelect.TheamColor)),
                  onPressed: () {},
                  child: Text(english,
                      style: TextStyle(fontSize: 13, color: Colors.white)),
                ),
              ),
            ],
          ),
          SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                feeding_Speed,
                style: TextStyle(fontSize: 18, color: Colors.black),
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                padding: EdgeInsets.all(8),
                alignment: Alignment.center,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      " 55" + " ",
                      style: TextStyle(fontSize: 70, color: Colors.red),
                    ),
                    Text(
                      "mm/s",
                      textAlign: TextAlign.left,
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.yellow),
                      onPressed: () {},
                      child: const Icon(Icons.arrow_upward_outlined,
                          size: 40, color: Colors.black),
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.yellow),
                      onPressed: () {},
                      child: const Icon(Icons.arrow_downward_outlined,
                          size: 40, color: Colors.black),
                    ),
                  )
                ],
              )
            ],
          ),
          SizedBox(height: 40),
          Row(
            children: [
              Row(
                children: [
                  Text(
                    function,
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 18, color: Colors.black),
                  ),
                  SizedBox(width: 10),
                  Container(
                    height: 20,
                    width: 20,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                  ),
                ],
              ),
              Spacer(),
              Row(
                children: [
                  Text(
                    forward,
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 18, color: Colors.black),
                  ),
                  SizedBox(width: 10),
                  Container(
                    height: 20,
                    width: 20,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                  ),
                ],
              ),
              Spacer(),
              Row(
                children: [
                  Text(
                    rollback,
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 18, color: Colors.black),
                  ),
                  SizedBox(width: 10),
                  Container(
                    height: 20,
                    width: 20,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                  ),
                ],
              ),
            ],
          )
        ],
      ));
}

Widget parameterSegment() {
  return SingleChildScrollView(
    child: Container(
      padding: EdgeInsets.fromLTRB(30, 10, 30, 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(feeding_Speed,
                  style: TextStyle(
                      color: ColorSelect.TheamColor, fontSize: 20)),
              Text("55 mm/s",
                  style: TextStyle(color: ColorSelect.black, fontSize: 18)),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(on_delay,
                  style: TextStyle(
                      color: ColorSelect.TheamColor, fontSize: 20)),
              Text("0 ms",
                  style: TextStyle(color: ColorSelect.black, fontSize: 18)),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(rollback_length,
                  style: TextStyle(
                      color: ColorSelect.TheamColor, fontSize: 20)),
              Text("15 mm",
                  style: TextStyle(color: ColorSelect.black, fontSize: 18)),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(wire_compensation_length,
                  style: TextStyle(
                      color: ColorSelect.TheamColor, fontSize: 20)),
              Text("10 mm",
                  style: TextStyle(color: ColorSelect.black, fontSize: 18)),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(manual_feeding_speed,
                  style: TextStyle(
                      color: ColorSelect.TheamColor, fontSize: 20)),
              Text("66 mm/s",
                  style: TextStyle(color: ColorSelect.black, fontSize: 18)),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(auto_rollback_speed,
                  style: TextStyle(
                      color: ColorSelect.TheamColor, fontSize: 20)),
              Text("30 mm/s",
                  style: TextStyle(color: ColorSelect.black, fontSize: 18)),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(feeding_rate,
                  style: TextStyle(
                      color: ColorSelect.TheamColor, fontSize: 20)),
              Text("3500",
                  style: TextStyle(color: ColorSelect.black, fontSize: 18)),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(feeding_off,
                  style: TextStyle(
                      color: ColorSelect.TheamColor, fontSize: 20)),
              Text("300",
                  style: TextStyle(color: ColorSelect.black, fontSize: 18)),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(speed_time,
                  style: TextStyle(
                      color: ColorSelect.TheamColor, fontSize: 20)),
              Text("100 ms",
                  style: TextStyle(color: ColorSelect.black, fontSize: 18)),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(feeding_interval,
                  style: TextStyle(
                      color: ColorSelect.TheamColor, fontSize: 20)),
              Text("100 ms",
                  style: TextStyle(color: ColorSelect.black, fontSize: 18)),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(stop_interval,
                  style: TextStyle(
                      color: ColorSelect.TheamColor, fontSize: 20)),
              Text("200 ms",
                  style: TextStyle(color: ColorSelect.black, fontSize: 18)),
            ],
          ),
          SizedBox(height: 20),
        ],
      ),
    ),
  );
}

Widget settingSegment() {

  bool feedingDirection = false;
  bool feedingMode = false;

  return SingleChildScrollView(
    child: Container(
      padding: EdgeInsets.fromLTRB(30, 10, 30, 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(feeding_direction,
                  style: TextStyle(
                      color: ColorSelect.TheamColor, fontSize: 20)),
              CupertinoSwitch(
                value: feedingDirection,
                onChanged: (value) {
                  feedingDirection = value;
                },
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(feeding_mode,
                  style: TextStyle(
                      color: ColorSelect.TheamColor, fontSize: 20)),
              CupertinoSwitch(
                value: feedingMode,
                onChanged: (value) {
                  feedingMode = value;
                },
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Unit",
                  style: TextStyle(
                      color: ColorSelect.TheamColor, fontSize: 20)),
              SizedBox(
                width: 100,
                height: 40,
                child: TextButton(
                  style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.yellow),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              side: BorderSide(color: Colors.yellow)
                          )
                      )
                  ),
                  onPressed: () {

                  },
                  child: Text("mm"),
                ),
              ),
            ],
          ),
          SizedBox(height: 40),
          SizedBox(
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

                },
                child: Text("Parameter Reset"),
              ),
            ),
          ),

        ],
      ),
    ),
  );
}

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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.all(30),
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
            SizedBox(height: 10),
            if (groupValue == 0) ...[
              homeSegment(context)
            ] else if (groupValue == 1) ...[
              parameterSegment()
            ] else if (groupValue == 2) ...[
              settingSegment()
            ]
          ],
        ),
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
        style: TextStyle(fontSize: 16, color: Colors.white),
      ),
    ),
  );
}

Widget homeSegment(BuildContext context) {
  return Container(
      padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.27,
                child: TextButton(
                  style: ButtonStyle(
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                      backgroundColor: MaterialStateProperty.all<Color>(
                          ColorSelect.TheamColor)),
                  onPressed: () {},
                  child: Text(mannul_feeding,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                      )),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.27,
                child: TextButton(
                  style: ButtonStyle(
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                      backgroundColor: MaterialStateProperty.all<Color>(
                          ColorSelect.TheamColor)),
                  onPressed: () {},
                  child: Text(mannul_rollback,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 12, color: Colors.white)),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.27,
                child: TextButton(
                  style: ButtonStyle(
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                      backgroundColor: MaterialStateProperty.all<Color>(
                          ColorSelect.TheamColor)),
                  onPressed: () {},
                  child: Text(english,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 12, color: Colors.white)),
                ),
              ),
            ],
          ),
          SizedBox(height: MediaQuery.of(context).size.width * 0.07),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                feeding_Speed,
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.045,
                    color: Colors.black),
              ),
              SizedBox(height: MediaQuery.of(context).size.width * 0.045),
              Container(
                decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                alignment: Alignment.center,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      " 55" + " ",
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.16,
                          color: Colors.red),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 6, 6),
                      child: Text(
                        "mm/s",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * 0.05,
                            color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.width * 0.05),
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
                    style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.04, color: Colors.black),
                  ),
                  SizedBox(width: 10),
                  Container(
                    height: MediaQuery.of(context).size.width * 0.04,
                    width: MediaQuery.of(context).size.width * 0.04,
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
                    style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.04, color: Colors.black),
                  ),
                  SizedBox(width: 10),
                  Container(
                    height: MediaQuery.of(context).size.width * 0.04,
                    width: MediaQuery.of(context).size.width * 0.04,
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
                    style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.04, color: Colors.black),
                  ),
                  SizedBox(width: 10),
                  Container(
                    height: MediaQuery.of(context).size.width * 0.04,
                    width: MediaQuery.of(context).size.width * 0.04,
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
  return Padding(
    padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(feeding_Speed,
                style: TextStyle(color: ColorSelect.TheamColor, fontSize: 20)),
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
                style: TextStyle(color: ColorSelect.TheamColor, fontSize: 20)),
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
                style: TextStyle(color: ColorSelect.TheamColor, fontSize: 20)),
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
                style: TextStyle(color: ColorSelect.TheamColor, fontSize: 20)),
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
                style: TextStyle(color: ColorSelect.TheamColor, fontSize: 20)),
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
                style: TextStyle(color: ColorSelect.TheamColor, fontSize: 20)),
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
                style: TextStyle(color: ColorSelect.TheamColor, fontSize: 20)),
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
                style: TextStyle(color: ColorSelect.TheamColor, fontSize: 20)),
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
                style: TextStyle(color: ColorSelect.TheamColor, fontSize: 20)),
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
                style: TextStyle(color: ColorSelect.TheamColor, fontSize: 20)),
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
                style: TextStyle(color: ColorSelect.TheamColor, fontSize: 20)),
            Text("200 ms",
                style: TextStyle(color: ColorSelect.black, fontSize: 18)),
          ],
        ),
        SizedBox(height: 20),
      ],
    ),
  );
}

Widget settingSegment() {
  bool feedingDirection = false;
  bool feedingMode = false;
  return Container(
    padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(feeding_direction,
                style:
                    TextStyle(color: ColorSelect.TheamColor, fontSize: 20)),
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
                style:
                    TextStyle(color: ColorSelect.TheamColor, fontSize: 20)),
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
                style:
                    TextStyle(color: ColorSelect.TheamColor, fontSize: 20)),
            SizedBox(
              width: 100,
              height: 40,
              child: TextButton(
                style: ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.black),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.yellow),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            side: BorderSide(color: Colors.yellow)))),
                onPressed: () {},
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
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.black),
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.yellow),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          side: BorderSide(color: Colors.yellow)))),
              onPressed: () {},
              child: Text("Parameter Reset"),
            ),
          ),
        ),
      ],
    ),
  );
}

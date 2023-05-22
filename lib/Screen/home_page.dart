import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:welding_system/Widgets/AppBars.dart';
import 'package:welding_system/Widgets/Colors.dart';
import 'package:welding_system/Widgets/data_sync.dart';
import 'package:welding_system/util/constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool preProtect = false;
  bool redLightSwitch = false;
  bool blowSwitch = false;
  bool swingSwitch = false;
  int? groupValue = 0;

  final TextEditingController _swingWidthcontroller = TextEditingController();

  final DataUpdate dataUpdate = DataUpdate();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBars(),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.fromLTRB(10, 20, 10, 10),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            elevation: 12,
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(13, 20, 13, 0),
                  alignment: Alignment.center,
                  child: CupertinoSlidingSegmentedControl<int>(
                    backgroundColor: CupertinoColors.systemGrey3,
                    thumbColor: Colors.green,
                    groupValue: groupValue,
                    children: {
                      0: buildSegment(Welding),
                      1: buildSegment(Cutting),
                      2: buildSegment(Cleaning),
                      3: buildSegment(Weld_seamClean),
                    },
                    onValueChanged: (value) {
                      setState(() {
                        groupValue = value;
                      });
                    },
                  ),
                ),
                const SizedBox(height: 10),
                if (groupValue == 0) ...[
                  welding(context)
                ] else if (groupValue == 1) ...[
                  cutting(context)
                ] else if (groupValue == 2) ...[
                  cleaning(context)
                ] else if (groupValue == 3) ...[
                  Weld_seam_Clean(context)
                ],
                Container(
                  margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(laser_powr,
                              style: TextStyle(
                                  color: ColorSelect.TheamColor, fontSize: 16)),
                          Container(
                            padding: const EdgeInsets.fromLTRB(6, 5, 6, 5),
                            decoration: myBoxDecoration(),
                            child: SizedBox(
                              width: 50.0,
                              height: 20.0,
                              child: Container(
                                margin: const EdgeInsets.all(5.0),
                                child: TextField(
                                  style: TextStyle(
                                      color: ColorSelect.black, fontSize: 18),
                                  controller: _swingWidthcontroller,
                                  keyboardType: const TextInputType.numberWithOptions(
                                      signed: true, decimal: true),
                                  decoration: const InputDecoration.collapsed(
                                    hintText: "",
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(laser_freqey,
                              style: TextStyle(
                                  color: ColorSelect.TheamColor, fontSize: 16)),
                          Container(
                            padding: const EdgeInsets.fromLTRB(6, 5, 6, 5),
                            decoration: myBoxDecoration(),
                            child: SizedBox(
                              width: 50.0,
                              height: 20.0,
                              child: Container(
                                margin: const EdgeInsets.all(5.0),
                                child: TextField(
                                  style: TextStyle(
                                      color: ColorSelect.black, fontSize: 18),
                                  controller: _swingWidthcontroller,
                                  keyboardType: const TextInputType.numberWithOptions(
                                      signed: true, decimal: true),
                                  decoration: const InputDecoration.collapsed(
                                    hintText: "",
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(pwm,
                              style: TextStyle(
                                  color: ColorSelect.TheamColor, fontSize: 16)),
                          Container(
                            padding: const EdgeInsets.fromLTRB(6, 5, 6, 5),
                            decoration: myBoxDecoration(),
                            child: SizedBox(
                              width: 50.0,
                              height: 20.0,
                              child: Container(
                                margin: const EdgeInsets.all(5.0),
                                child: TextField(
                                  style: TextStyle(
                                      color: ColorSelect.black, fontSize: 18),
                                  controller: _swingWidthcontroller,
                                  keyboardType: const TextInputType.numberWithOptions(
                                      signed: true, decimal: true),
                                  decoration: const InputDecoration.collapsed(
                                    hintText: "",
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(patran,
                              style: TextStyle(
                                  color: ColorSelect.TheamColor, fontSize: 16)),
                          Container(
                            padding: const EdgeInsets.fromLTRB(6, 5, 6, 5),
                            decoration: myBoxDecoration(),
                            child: SizedBox(
                              width: 50.0,
                              height: 20.0,
                              child: DropdownButton<String>(
                                isExpanded: true,
                                underline: const SizedBox(),
                                items: <String>['..(spot)', '--(line)']
                                    .map((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                                onChanged: (_) {},
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(woble_freq,
                              style: TextStyle(
                                  color: ColorSelect.TheamColor, fontSize: 16)),
                          Container(
                            padding: const EdgeInsets.fromLTRB(6, 5, 6, 5),
                            decoration: myBoxDecoration(),
                            child: SizedBox(
                              width: 50.0,
                              height: 20.0,
                              child: Container(
                                margin: const EdgeInsets.all(5.0),
                                child: TextField(
                                  style: TextStyle(
                                      color: ColorSelect.black, fontSize: 18),
                                  controller: _swingWidthcontroller,
                                  keyboardType: const TextInputType.numberWithOptions(
                                      signed: true, decimal: true),
                                  decoration: const InputDecoration.collapsed(
                                    hintText: "",
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(woble_size,
                              style: TextStyle(
                                  color: ColorSelect.TheamColor, fontSize: 16)),
                          Container(
                            padding: const EdgeInsets.fromLTRB(6, 5, 6, 5),
                            decoration: myBoxDecoration(),
                            child: SizedBox(
                              width: 50.0,
                              height: 20.0,
                              child: Container(
                                margin: const EdgeInsets.all(5.0),
                                child: TextField(
                                  style: TextStyle(
                                      color: ColorSelect.black, fontSize: 18),
                                  controller: _swingWidthcontroller,
                                  keyboardType: const TextInputType.numberWithOptions(
                                      signed: true, decimal: true),
                                  decoration: const InputDecoration.collapsed(
                                    hintText: "",
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(lsr,
                              style: TextStyle(
                                  color: ColorSelect.TheamColor, fontSize: 16)),
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
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(gs_manul,
                              style: TextStyle(
                                  color: ColorSelect.TheamColor, fontSize: 16)),
                          CupertinoSwitch(
                            value: redLightSwitch,
                            onChanged: (value) {
                              setState(() {
                                redLightSwitch = value;
                              });
                            },
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(wire_Fedding,
                              style: TextStyle(
                                  color: ColorSelect.TheamColor, fontSize: 16)),
                          CupertinoSwitch(
                            value: blowSwitch,
                            onChanged: (value) {
                              setState(() {
                                blowSwitch = value;
                              });
                            },
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(scale_weld,
                              style: TextStyle(
                                  color: ColorSelect.TheamColor, fontSize: 16)),
                          CupertinoSwitch(
                            value: swingSwitch,
                            onChanged: (value) {
                              setState(() {
                                swingSwitch = value;
                              });
                            },
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(Safety_lock,
                              style: TextStyle(
                                  color: ColorSelect.TheamColor, fontSize: 16)),
                          CupertinoSwitch(
                            value: swingSwitch,
                            onChanged: (value) {
                              setState(() {
                                swingSwitch = value;
                              });
                            },
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget welding(BuildContext context) {
    return Container(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
        child: const Column(
          children: [],
        ));
  }

  Widget cutting(BuildContext context) {
    return Container(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
        child: const Column(
          children: [],
        ));
  }

  Widget cleaning(BuildContext context) {
    return Container(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
        child: const Column(
          children: [],
        ));
  }

  Widget Weld_seam_Clean(BuildContext context) {
    return Container(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
        child: const Column(
          children: [],
        ));
  }

  Widget buildSegment(String text) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: Text(
        text,
        style: const TextStyle(fontSize: 13, color: Colors.white),
        textAlign: TextAlign.center,
      ),
    );
  }

  BoxDecoration myBoxDecoration() {
    return BoxDecoration(
      border: Border.all(),
      borderRadius: const BorderRadius.all(
        Radius.circular(5.0),
      ),
    );
  }
}

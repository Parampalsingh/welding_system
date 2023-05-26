// ignore_for_file: non_constant_identifier_names

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
  int? groupValue = 0;
  String dropValue = "..(spot)";

  //textField
  final TextEditingController _LaserPowerController = TextEditingController();
  final TextEditingController _LaserFreqController = TextEditingController();
  final TextEditingController _PWFController = TextEditingController();
  final TextEditingController _wobbleFreqController = TextEditingController();
  final TextEditingController _wobbleSizeController = TextEditingController();
  final TextEditingController _meterialNameController = TextEditingController();
  final TextEditingController _CleanWidthController = TextEditingController();

  //switch
  bool laserSwitch = false;
  bool gasManualSwitch = false;
  bool wireFeedingSwitch = false;
  bool scaleWeldSwitch = false;
  bool SaftyLockSwitch = false;

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
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget welding(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 20, 20, 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              label(laser_powr),
              Container(
                padding: const EdgeInsets.fromLTRB(6, 5, 6, 5),
                decoration: myBoxDecoration(),
                child: SizedBox(
                  width: 80.0,
                  child: Container(
                    margin: const EdgeInsets.all(5.0),
                    child: TextField(
                      style: TextStyle(color: ColorSelect.black, fontSize: 14),
                      textAlign: TextAlign.center,
                      controller: _LaserPowerController,
                      keyboardType: const TextInputType.numberWithOptions(
                          signed: true, decimal: true),
                      decoration: const InputDecoration.collapsed(
                        hintText: "300-3000",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              label(laser_freqey),
              Container(
                padding: const EdgeInsets.fromLTRB(6, 5, 6, 5),
                decoration: myBoxDecoration(),
                child: SizedBox(
                  width: 80.0,
                  child: Container(
                    margin: const EdgeInsets.all(5.0),
                    child: TextField(
                      style: TextStyle(color: ColorSelect.black, fontSize: 14),
                      textAlign: TextAlign.center,
                      controller: _LaserFreqController,
                      keyboardType: const TextInputType.numberWithOptions(
                          signed: true, decimal: true),
                      decoration: const InputDecoration.collapsed(
                        hintText: "100-5000",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              label(pwm),
              Container(
                padding: const EdgeInsets.fromLTRB(6, 5, 6, 5),
                decoration: myBoxDecoration(),
                child: SizedBox(
                  width: 80.0,
                  child: Container(
                    margin: const EdgeInsets.all(5.0),
                    child: TextField(
                      style: TextStyle(color: ColorSelect.black, fontSize: 14),
                      textAlign: TextAlign.center,
                      controller: _PWFController,
                      keyboardType: const TextInputType.numberWithOptions(
                          signed: true, decimal: true),
                      decoration: const InputDecoration.collapsed(
                        hintText: "0-100",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              label(patran),
              Container(
                padding: const EdgeInsets.fromLTRB(6, 5, 6, 5),
                decoration: myBoxDecoration(),
                child: SizedBox(
                  width: 80.0,
                  height: 30,
                  child: DropdownButton<String>(
                    isExpanded: true,
                    value: dropValue,
                    dropdownColor: Colors.white,
                    underline: const SizedBox(),
                    items: <String>['..(spot)', '--(line)'].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style:
                              TextStyle(color: ColorSelect.black, fontSize: 14),
                          textAlign: TextAlign.center,
                        ),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        dropValue = value ?? "";
                      });
                    },
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              label(woble_freq),
              Container(
                padding: const EdgeInsets.fromLTRB(6, 5, 6, 5),
                decoration: myBoxDecoration(),
                child: SizedBox(
                  width: 80.0,
                  child: Container(
                    margin: const EdgeInsets.all(5.0),
                    child: TextField(
                      style: TextStyle(color: ColorSelect.black, fontSize: 14),
                      textAlign: TextAlign.center,
                      controller: _wobbleFreqController,
                      keyboardType: const TextInputType.numberWithOptions(
                          signed: true, decimal: true),
                      decoration: const InputDecoration.collapsed(
                        hintText: "0-200",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              label(woble_size),
              Container(
                padding: const EdgeInsets.fromLTRB(6, 5, 6, 5),
                decoration: myBoxDecoration(),
                child: SizedBox(
                  width: 80.0,
                  child: Container(
                    margin: const EdgeInsets.all(5.0),
                    child: TextField(
                      style: TextStyle(color: ColorSelect.black, fontSize: 14),
                      textAlign: TextAlign.center,
                      controller: _wobbleSizeController,
                      keyboardType: const TextInputType.numberWithOptions(
                          signed: true, decimal: true),
                      decoration: const InputDecoration.collapsed(
                        hintText: "1.0-2.14",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              label(lsr),
              CupertinoSwitch(
                value: laserSwitch,
                onChanged: (value) {
                  setState(() {
                    laserSwitch = value;
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
              label(gs_manul),
              CupertinoSwitch(
                value: gasManualSwitch,
                onChanged: (value) {
                  setState(() {
                    gasManualSwitch = value;
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
              label(wire_Fedding),
              CupertinoSwitch(
                value: wireFeedingSwitch,
                onChanged: (value) {
                  setState(() {
                    wireFeedingSwitch = value;
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
              label(scale_weld),
              CupertinoSwitch(
                value: scaleWeldSwitch,
                onChanged: (value) {
                  setState(() {
                    scaleWeldSwitch = value;
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
              label(Safety_lock),
              CupertinoSwitch(
                value: SaftyLockSwitch,
                onChanged: (value) {
                  setState(() {
                    SaftyLockSwitch = value;
                    _showTextInputDialog(context);
                  });
                },
              ),
            ],
          ),
          const SizedBox(height: 20),
          Container(
            alignment: Alignment.centerLeft,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextButton(
                  style: ButtonStyle(
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                      backgroundColor: MaterialStateProperty.all<Color>(
                          ColorSelect.TheamColor)),
                  onPressed: () {},
                  child: const Text(
                    sv_progress,
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(6, 5, 6, 5),
                  decoration: myBoxDecoration(),
                  child: Container(
                    width: 100,
                    margin: const EdgeInsets.all(5.0),
                    child: TextField(
                      style: TextStyle(color: ColorSelect.black, fontSize: 14),
                      controller: _meterialNameController,
                      keyboardType: const TextInputType.numberWithOptions(
                          signed: true, decimal: true),
                      decoration: const InputDecoration.collapsed(
                        hintText: "Material Name",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget cutting(BuildContext context) {

    return Container(
        margin: const EdgeInsets.fromLTRB(20, 20, 20, 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                label(laser_powr),
                Container(
                  padding: const EdgeInsets.fromLTRB(6, 5, 6, 5),
                  decoration: myBoxDecoration(),
                  child: SizedBox(
                    width: 80.0,
                    child: Container(
                      margin: const EdgeInsets.all(5.0),
                      child: TextField(
                        style: TextStyle(color: ColorSelect.black, fontSize: 14),
                        textAlign: TextAlign.center,
                        controller: _LaserPowerController,
                        keyboardType: const TextInputType.numberWithOptions(
                            signed: true, decimal: true),
                        decoration: const InputDecoration.collapsed(
                          hintText: "300-3000",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                label(laser_freqey),
                Container(
                  padding: const EdgeInsets.fromLTRB(6, 5, 6, 5),
                  decoration: myBoxDecoration(),
                  child: SizedBox(
                    width: 80.0,
                    child: Container(
                      margin: const EdgeInsets.all(5.0),
                      child: TextField(
                        style: TextStyle(color: ColorSelect.black, fontSize: 14),
                        textAlign: TextAlign.center,
                        controller: _LaserPowerController,
                        keyboardType: const TextInputType.numberWithOptions(
                            signed: true, decimal: true),
                        decoration: const InputDecoration.collapsed(
                          hintText: "100-5000",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                label(pwm),
                Container(
                  padding: const EdgeInsets.fromLTRB(6, 5, 6, 5),
                  decoration: myBoxDecoration(),
                  child: SizedBox(
                    width: 80.0,
                    child: Container(
                      margin: const EdgeInsets.all(5.0),
                      child: TextField(
                        style: TextStyle(color: ColorSelect.black, fontSize: 14),
                        textAlign: TextAlign.center,
                        controller: _LaserPowerController,
                        keyboardType: const TextInputType.numberWithOptions(
                            signed: true, decimal: true),
                        decoration: const InputDecoration.collapsed(
                          hintText: "0-100",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                label(lsr),
                CupertinoSwitch(
                  value: laserSwitch,
                  onChanged: (value) {
                    setState(() {
                      laserSwitch = value;
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
                label(gs_manul),
                CupertinoSwitch(
                  value: gasManualSwitch,
                  onChanged: (value) {
                    setState(() {
                      gasManualSwitch = value;
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
                label(Safety_lock),
                CupertinoSwitch(
                  value: SaftyLockSwitch,
                  onChanged: (value) {
                    setState(() {
                      SaftyLockSwitch = value;
                      _showTextInputDialog(context);
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 20),
            Container(
              alignment: Alignment.centerLeft,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextButton(
                    style: ButtonStyle(
                        foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                        backgroundColor: MaterialStateProperty.all<Color>(
                            ColorSelect.TheamColor)),
                    onPressed: () {},
                    child: const Text(
                      sv_progress,
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(6, 5, 6, 5),
                    decoration: myBoxDecoration(),
                    child: Container(
                      width: 100,
                      margin: const EdgeInsets.all(5.0),
                      child: TextField(
                        style: TextStyle(color: ColorSelect.black, fontSize: 14),
                        controller: _meterialNameController,
                        keyboardType: const TextInputType.numberWithOptions(
                            signed: true, decimal: true),
                        decoration: const InputDecoration.collapsed(
                          hintText: "Material Name",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

          ],
        ));
  }

  Widget cleaning(BuildContext context) {
    return Container(
        margin: const EdgeInsets.fromLTRB(20, 20, 20, 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                label(laser_powr),
                Container(
                  padding: const EdgeInsets.fromLTRB(6, 5, 6, 5),
                  decoration: myBoxDecoration(),
                  child: SizedBox(
                    width: 80.0,
                    child: Container(
                      margin: const EdgeInsets.all(5.0),
                      child: TextField(
                        style: TextStyle(color: ColorSelect.black, fontSize: 14),
                        textAlign: TextAlign.center,
                        controller: _LaserPowerController,
                        keyboardType: const TextInputType.numberWithOptions(
                            signed: true, decimal: true),
                        decoration: const InputDecoration.collapsed(
                          hintText: "300-3000",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                label(laser_freqey),
                Container(
                  padding: const EdgeInsets.fromLTRB(6, 5, 6, 5),
                  decoration: myBoxDecoration(),
                  child: SizedBox(
                    width: 80.0,
                    child: Container(
                      margin: const EdgeInsets.all(5.0),
                      child: TextField(
                        style: TextStyle(color: ColorSelect.black, fontSize: 14),
                        textAlign: TextAlign.center,
                        controller: _LaserFreqController,
                        keyboardType: const TextInputType.numberWithOptions(
                            signed: true, decimal: true),
                        decoration: const InputDecoration.collapsed(
                          hintText: "100-5000",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                label(pwm),
                Container(
                  padding: const EdgeInsets.fromLTRB(6, 5, 6, 5),
                  decoration: myBoxDecoration(),
                  child: SizedBox(
                    width: 80.0,
                    child: Container(
                      margin: const EdgeInsets.all(5.0),
                      child: TextField(
                        style: TextStyle(color: ColorSelect.black, fontSize: 14),
                        textAlign: TextAlign.center,
                        controller: _PWFController,
                        keyboardType: const TextInputType.numberWithOptions(
                            signed: true, decimal: true),
                        decoration: const InputDecoration.collapsed(
                          hintText: "0-100",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                label(woble_freq),
                Container(
                  padding: const EdgeInsets.fromLTRB(6, 5, 6, 5),
                  decoration: myBoxDecoration(),
                  child: SizedBox(
                    width: 80.0,
                    child: Container(
                      margin: const EdgeInsets.all(5.0),
                      child: TextField(
                        style: TextStyle(color: ColorSelect.black, fontSize: 14),
                        textAlign: TextAlign.center,
                        controller: _wobbleFreqController,
                        keyboardType: const TextInputType.numberWithOptions(
                            signed: true, decimal: true),
                        decoration: const InputDecoration.collapsed(
                          hintText: "0-200",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                label(clean_weidth),
                Container(
                  padding: const EdgeInsets.fromLTRB(6, 5, 6, 5),
                  decoration: myBoxDecoration(),
                  child: SizedBox(
                    width: 80.0,
                    child: Container(
                      margin: const EdgeInsets.all(5.0),
                      child: TextField(
                        style: TextStyle(color: ColorSelect.black, fontSize: 14),
                        textAlign: TextAlign.center,
                        controller: _CleanWidthController,
                        keyboardType: const TextInputType.numberWithOptions(
                            signed: true, decimal: true),
                        decoration: const InputDecoration.collapsed(
                          hintText: "20-80",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                label(lsr),
                CupertinoSwitch(
                  value: laserSwitch,
                  onChanged: (value) {
                    setState(() {
                      laserSwitch = value;
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
                label(gs_manul),
                CupertinoSwitch(
                  value: gasManualSwitch,
                  onChanged: (value) {
                    setState(() {
                      gasManualSwitch = value;
                    });
                  },
                ),
              ],
            ),
          ],
        ));
  }

  Widget Weld_seam_Clean(BuildContext context) {
    return Container(
        margin: const EdgeInsets.fromLTRB(20, 20, 20, 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                label(laser_powr),
                Container(
                  padding: const EdgeInsets.fromLTRB(6, 5, 6, 5),
                  decoration: myBoxDecoration(),
                  child: SizedBox(
                    width: 80.0,
                    child: Container(
                      margin: const EdgeInsets.all(5.0),
                      child: TextField(
                        style: TextStyle(color: ColorSelect.black, fontSize: 14),
                        textAlign: TextAlign.center,
                        controller: _LaserPowerController,
                        keyboardType: const TextInputType.numberWithOptions(
                            signed: true, decimal: true),
                        decoration: const InputDecoration.collapsed(
                          hintText: "300-3000",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                label(laser_freqey),
                Container(
                  padding: const EdgeInsets.fromLTRB(6, 5, 6, 5),
                  decoration: myBoxDecoration(),
                  child: SizedBox(
                    width: 80.0,
                    child: Container(
                      margin: const EdgeInsets.all(5.0),
                      child: TextField(
                        style: TextStyle(color: ColorSelect.black, fontSize: 14),
                        textAlign: TextAlign.center,
                        controller: _LaserFreqController,
                        keyboardType: const TextInputType.numberWithOptions(
                            signed: true, decimal: true),
                        decoration: const InputDecoration.collapsed(
                          hintText: "100-5000",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                label(pwm),
                Container(
                  padding: const EdgeInsets.fromLTRB(6, 5, 6, 5),
                  decoration: myBoxDecoration(),
                  child: SizedBox(
                    width: 80.0,
                    child: Container(
                      margin: const EdgeInsets.all(5.0),
                      child: TextField(
                        style: TextStyle(color: ColorSelect.black, fontSize: 14),
                        textAlign: TextAlign.center,
                        controller: _PWFController,
                        keyboardType: const TextInputType.numberWithOptions(
                            signed: true, decimal: true),
                        decoration: const InputDecoration.collapsed(
                          hintText: "0-100",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                label(woble_freq),
                Container(
                  padding: const EdgeInsets.fromLTRB(6, 5, 6, 5),
                  decoration: myBoxDecoration(),
                  child: SizedBox(
                    width: 80.0,
                    child: Container(
                      margin: const EdgeInsets.all(5.0),
                      child: TextField(
                        style: TextStyle(color: ColorSelect.black, fontSize: 14),
                        textAlign: TextAlign.center,
                        controller: _wobbleFreqController,
                        keyboardType: const TextInputType.numberWithOptions(
                            signed: true, decimal: true),
                        decoration: const InputDecoration.collapsed(
                          hintText: "0-200",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                label(clean_weidth),
                Container(
                  padding: const EdgeInsets.fromLTRB(6, 5, 6, 5),
                  decoration: myBoxDecoration(),
                  child: SizedBox(
                    width: 80.0,
                    child: Container(
                      margin: const EdgeInsets.all(5.0),
                      child: TextField(
                        style: TextStyle(color: ColorSelect.black, fontSize: 14),
                        textAlign: TextAlign.center,
                        controller: _CleanWidthController,
                        keyboardType: const TextInputType.numberWithOptions(
                            signed: true, decimal: true),
                        decoration: const InputDecoration.collapsed(
                          hintText: "1-10",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                label(lsr),
                CupertinoSwitch(
                  value: laserSwitch,
                  onChanged: (value) {
                    setState(() {
                      laserSwitch = value;
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
                label(gs_manul),
                CupertinoSwitch(
                  value: gasManualSwitch,
                  onChanged: (value) {
                    setState(() {
                      gasManualSwitch = value;
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
                label(Safety_lock),
                CupertinoSwitch(
                  value: SaftyLockSwitch,
                  onChanged: (value) {
                    setState(() {
                      SaftyLockSwitch = value;
                      _showTextInputDialog(context);
                    });
                  },
                ),
              ],
            ),
          ],
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

  Widget label(String text) {
    return Text(text,
        style: TextStyle(color: ColorSelect.TheamColor, fontSize: 16),
        textAlign: TextAlign.center);
  }

  BoxDecoration myBoxDecoration() {
    return BoxDecoration(
      border: Border.all(),
      borderRadius: const BorderRadius.all(
        Radius.circular(5.0),
      ),
    );
  }

  final _textFieldController = TextEditingController();
  bool _obscureText = false;
  bool showAlert = false;
  late String _password;

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
              decoration: const InputDecoration(
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
                onPressed: () {
                  Navigator.pop(context, _textFieldController.text);
                  showAlert = true;
                },
              ),
              ElevatedButton(
                  child: const Text('Cancel'),
                  onPressed: () {
                    Navigator.pop(context, _textFieldController.text);
                  }),
            ],
          );
        });
  }
}

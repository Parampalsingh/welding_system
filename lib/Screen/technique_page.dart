import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:welding_system/Widgets/AppBars.dart';
import 'package:welding_system/Widgets/Colors.dart';
import 'package:welding_system/util/constants.dart';

class TechniquePage extends StatefulWidget {
  @override
  State<TechniquePage> createState() => _TechniquePageState();
}

class _TechniquePageState extends State<TechniquePage> {

  TextEditingController _laserPowercontroller = TextEditingController();
  TextEditingController _DutyCyclecontroller = TextEditingController();
  TextEditingController _laserFreqcontroller = TextEditingController();
  TextEditingController _woobleSpeedcontroller = TextEditingController();
  TextEditingController _swingWeidthcontroller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _laserPowercontroller = new TextEditingController(text: '1200');
    _DutyCyclecontroller = new TextEditingController(text: '58.0');
    _laserFreqcontroller = new TextEditingController(text: '2000');
    _woobleSpeedcontroller = new TextEditingController(text: '1000');
    _swingWeidthcontroller = new TextEditingController(text: '5.0');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: ColorSelect.TheamColor,
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        title: Text(
          "Technique",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(30),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(laser_cur,style: TextStyle(color: ColorSelect.TheamColor,fontSize: 20)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 50.0,
                        child: new TextField(
                          style:TextStyle(color: ColorSelect.black, fontSize: 18),
                          controller: _laserPowercontroller,
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(laser_pwr,style: TextStyle(color: ColorSelect.TheamColor,fontSize: 20)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 50.0,
                        child: new TextField(
                          style:TextStyle(color: ColorSelect.black, fontSize: 18),
                          controller: _DutyCyclecontroller,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration.collapsed(
                            hintText: "",
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      Text(" %",
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
                  Text(laser_freq,style: TextStyle(color: ColorSelect.TheamColor,fontSize: 20)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 50.0,
                        child: new TextField(
                          style:TextStyle(color: ColorSelect.black, fontSize: 18),
                          controller: _laserFreqcontroller,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration.collapsed(
                            hintText: "",
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      Text(" Hz",
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
                  Text(wobble_speed,style: TextStyle(color: ColorSelect.TheamColor,fontSize: 20)),
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
                      Text(" mm/s",
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
                          controller: _laserFreqcontroller,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration.collapsed(
                            hintText: "",
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      Text(" MS",
                          style: TextStyle(color: ColorSelect.black, fontSize: 18)),
                    ],
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

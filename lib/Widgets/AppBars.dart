import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:welding_system/Widgets/Colors.dart';

class AppBars extends AppBar {

  AppBars():super(
    iconTheme: IconThemeData(
      color: Colors.black, //change your color here
    ),
    backgroundColor: ColorSelect.TheamColor,
    title: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Flexiweld",
          style: TextStyle(color: Colors.white,fontSize: 20),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              "Date : " + DateFormat.yMMMEd().format(DateTime.now()).toString(),
              style: TextStyle(color: Colors.white,fontSize: 14),
            ),
            SizedBox(),
            Text(
              "V 6.06",
              style: TextStyle(color: Colors.white,fontSize: 14),
            )
          ],
        ),
      ],
    ),
    elevation: 0.0,
    automaticallyImplyLeading: false,
  );
}
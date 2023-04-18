import 'package:flutter/material.dart';
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
          "LHSW 200",
          style: TextStyle(color: Colors.white,fontSize: 20),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              "Date : 2023/04/01",
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
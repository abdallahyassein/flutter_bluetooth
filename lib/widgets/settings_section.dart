import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';

class SettingSection {
  static settingSection() {
    return Column(
      children: [
        SizedBox(
          height: 10,
        ),
        Text(
          "Settings",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20,
            color: Colors.blueAccent,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        IconButton(
          iconSize: 100,
          icon: Image.asset(
            'assets/images/settings.png',
          ),
          onPressed: () {
            FlutterBluetoothSerial.instance.openSettings();
          },
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          "NOTE: If you cannot find the device in the list, please pair the device by going to the bluetooth settings",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: Colors.red,
          ),
        ),
        SizedBox(height: 15),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:projectapp/helper/helper.dart';

class SendSerialDialog {
  static showSerialDialog(context, textFieldController, _connected,
      _scaffoldKey, Function _sendTextMessageToBluetooth) {
    return showDialog(
      context: context,
      builder: (ctx) => Dialog(
          backgroundColor: Color.fromRGBO(227, 227, 227, 1),
          insetPadding: EdgeInsets.all(0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Card(
                shape: RoundedRectangleBorder(
                  side: new BorderSide(color: Colors.blueAccent),
                  borderRadius: BorderRadius.circular(4.0),
                ),
                elevation: 10,
                child: TextField(
                  controller: textFieldController,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(5),
                      border: InputBorder.none,
                      hintText: 'write something to send to the bluetooth'),
                  onSubmitted: (value) {
                    if (_connected) {
                      if (value.isEmpty) {
                        BluetoothHelper.show(_scaffoldKey,
                            "please write something to send to bluetooth");
                        return;
                      }
                      print(value);
                      print(textFieldController.text);
                      _sendTextMessageToBluetooth(value);
                      textFieldController.clear();
                    } else {
                      BluetoothHelper.show(
                          _scaffoldKey, "please connect to a device");
                    }
                  },
                ),
              )
            ],
          )),
    );
  }
}

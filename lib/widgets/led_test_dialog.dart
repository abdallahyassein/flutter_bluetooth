import 'package:flutter/material.dart';
import 'package:projectapp/helper/helper.dart';

class LedTestDialog {
  static showLedTestDialog(
      context,
      _deviceState,
      testLEDONFieldController,
      testLEDOFFFieldController,
      _connected,
      _scaffoldKey,
      _sendTextMessageToBluetooth) {
    return showDialog(
      context: context,
      builder: (ctx) => Dialog(
          backgroundColor: Color.fromRGBO(227, 227, 227, 1),
          insetPadding: EdgeInsets.all(0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Card(
                  shape: RoundedRectangleBorder(
                    side: new BorderSide(
                      color: Colors.blueAccent,
                      width: 3,
                    ),
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  elevation: _deviceState == 0 ? 4 : 0,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          width: 50,
                          child: TextField(
                            textAlign: TextAlign.center,
                            controller: testLEDONFieldController,
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(5),
                                border: new OutlineInputBorder(
                                    borderSide:
                                        new BorderSide(color: Colors.teal)),
                                hintText: 'Test'),
                          ),
                        ),
                        FlatButton(
                          onPressed: () {
                            if (_connected) {
                              if (testLEDONFieldController.text.isEmpty) {
                                BluetoothHelper.show(
                                  _scaffoldKey,
                                  "please write something to send to bluetooth",
                                );
                                return;
                              }

                              print(testLEDONFieldController.text);
                              _sendTextMessageToBluetooth(
                                  testLEDONFieldController.text);
                            } else {
                              BluetoothHelper.show(
                                  _scaffoldKey, "please connect to a device");
                            }
                          },
                          child: Text(
                            "ON",
                            style: TextStyle(color: Colors.greenAccent),
                          ),
                        ),
                        Container(
                          width: 50,
                          child: TextField(
                            textAlign: TextAlign.center,
                            controller: testLEDOFFFieldController,
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(5),
                                border: new OutlineInputBorder(
                                    borderSide:
                                        new BorderSide(color: Colors.teal)),
                                hintText: 'Test'),
                          ),
                        ),
                        FlatButton(
                          onPressed: () {
                            print(_connected);
                            if (_connected) {
                              if (testLEDOFFFieldController.text.isEmpty) {
                                BluetoothHelper.show(_scaffoldKey,
                                    "please write something to send to bluetooth");
                                return;
                              }

                              print(testLEDOFFFieldController.text);
                              _sendTextMessageToBluetooth(
                                  testLEDOFFFieldController.text);
                            } else {
                              BluetoothHelper.show(
                                  _scaffoldKey, "please connect to a device");
                            }
                          },
                          child: Text("OFF",
                              style: TextStyle(color: Colors.redAccent)),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}

import 'package:control_pad/views/joystick_view.dart';
import 'package:flutter/material.dart';

class JoyStickDialog {
  static showJoyStickComponents(
    context,
    upFieldController,
    rightFieldController,
    leftFieldController,
    downFieldController,
    Function _sendTextMessageToBluetooth,
    _connected,
  ) {
    return showDialog(
      context: context,
      builder: (ctx) => Dialog(
          backgroundColor: Color.fromRGBO(227, 227, 227, 1),
          insetPadding: EdgeInsets.all(0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 30),
              Center(
                child: Container(
                  width: 60,
                  child: TextField(
                    textAlign: TextAlign.center,
                    controller: upFieldController,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(5),
                        border: new OutlineInputBorder(
                            borderSide: new BorderSide(color: Colors.teal)),
                        hintText: 'Up'),
                  ),
                ),
              ),
              SizedBox(height: 30),
              Stack(
                children: [
                  JoystickView(
                    interval: Duration(
                      milliseconds: 200,
                    ),
                    showArrows: true,
                    backgroundColor: Colors.greenAccent,
                    innerCircleColor: Colors.redAccent,
                    onDirectionChanged: (degrees, distance) {
                      // print(degrees);
                      // print(distance);

                      if (_connected && distance >= 0.5) {
                        if (degrees > 45 && degrees < 135) {
                          if (rightFieldController.text.isNotEmpty) {
                            _sendTextMessageToBluetooth(
                                rightFieldController.text);
                          }
                        } else if (degrees > 225 && degrees < 315) {
                          if (leftFieldController.text.isNotEmpty) {
                            _sendTextMessageToBluetooth(
                                leftFieldController.text);
                          }
                        } else if ((degrees > 0 && degrees < 45) ||
                            (degrees > 315 && degrees < 360)) {
                          if (upFieldController.text.isNotEmpty) {
                            _sendTextMessageToBluetooth(upFieldController.text);
                          }
                        } else if (degrees > 135 && degrees < 225) {
                          if (downFieldController.text.isNotEmpty) {
                            _sendTextMessageToBluetooth(
                                downFieldController.text);
                          }
                        }
                      }
                    },
                  ),
                  Positioned(
                    top: 75,
                    left: 20,
                    child: Container(
                      width: 50,
                      child: TextField(
                        textAlign: TextAlign.center,
                        controller: leftFieldController,
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(5),
                            border: new OutlineInputBorder(
                                borderSide: new BorderSide(color: Colors.teal)),
                            hintText: 'Left'),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 75,
                    right: 20,
                    child: Container(
                      width: 50,
                      child: TextField(
                        textAlign: TextAlign.center,
                        controller: rightFieldController,
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(5),
                            border: new OutlineInputBorder(
                                borderSide: new BorderSide(color: Colors.teal)),
                            hintText: 'Right'),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: Container(
                  width: 60,
                  child: TextField(
                    textAlign: TextAlign.center,
                    controller: downFieldController,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(5),
                        border: new OutlineInputBorder(
                            borderSide: new BorderSide(color: Colors.teal)),
                        hintText: 'Down'),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:myanmar_passenger_app/constants.dart';

class ButtonComponent extends StatelessWidget {
  const ButtonComponent({Key? key, required this.text, required this.func, required this.colorCode})
      : super(key: key);
  final String text;
  final Color colorCode;
  final Function() func;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: func,
      child: Container(
        height: 50,
        child: Center(
          child: Text(text, style: TextStyle(fontSize: 18.0)),
        ),
      ),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(colorCode),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.zero,
              bottomRight: Radius.zero,
              topLeft: Radius.zero,
              topRight: Radius.zero,
              // side: BorderSide(color: Colors.red),
            ),
          ),
        ),
      ),
      // borderRadius:
      // BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:simple_signup/constants.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final VoidCallback onPress;
  final Color color, textColor;

  const RoundedButton(
      {Key? key,
      required this.text,
      required this.onPress,
      this.color = kPrimaryColor,
      this.textColor = Colors.white})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      width: size.width * 0.8,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(29),
        child: Container(
          decoration: BoxDecoration(
            color: color,
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 40),
            child: TextButton(
              onPressed: onPress,
              child: Text(
                text,
                style: TextStyle(
                  color: textColor,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../constants/global_constants.dart';

class CustomTitleText extends StatelessWidget {
  final String text;
  const CustomTitleText({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: GlobalConstant.fontColorLive,
        fontSize: 12,
        fontWeight: FontWeight.bold
      ),
    );
  }
}

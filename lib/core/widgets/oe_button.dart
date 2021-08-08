import 'package:flutter/material.dart';
import '../../core/widgets/oe_custom_content_text.dart';
import '../constants/custom_enums.dart';
import '../constants/global_constants.dart';

class OeButton extends StatelessWidget {
  final void Function() onTap;
  final String text;
  final EnumButtonType? buttonType;
  final Color? color;
  final bool isDisabled;
  final double? customHeight;
  final bool hasBorder;
  final bool isLoading;

  const OeButton({
    Key? key,
    required this.onTap ,
    required this.text,
    this.buttonType,
    this.color,
    this.isDisabled = false,
    this.customHeight,
    this.hasBorder = false,
    this.isLoading = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Container(
      height: customHeight != null ? customHeight : themeData.buttonTheme.height,
      width: MediaQuery.of(context).size.width,
      child: FlatButton(
        color: color != null ? color : GlobalConstant.alternativeSoft,
        splashColor: Colors.white,
        onPressed: isDisabled || isLoading ? (){} : onTap,
        hoverColor: themeData.primaryColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            isLoading
                ? SizedBox(
                    height: 20,
                    width: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 1,
                      backgroundColor: Colors.white,
                    ),
                  )
                : CustomContentText(
                    text: text,
                  ),
          ],
        ),
      ),
      decoration: BoxDecoration(
        border: hasBorder ? Border.all(style: BorderStyle.solid, color: themeData.primaryColor) : Border(),
      ),
    );
  }
}

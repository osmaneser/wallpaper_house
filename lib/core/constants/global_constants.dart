import 'package:flutter/cupertino.dart';

class GlobalConstant {
  
  static Color mainBack = Color(0xff590202);
  static Color mainSoft = Color(0xffF0F2BB);
  static Color fontColorLive = Color(0xffF0F2BB);
  static Color fontColorAlternative = Color(0xff590202);
  static Color alternativeLive = Color(0xffF29F05);
  static Color alternativeSoft = Color(0xffD96704);

  static List<Locale> supportedLanguages = [Locale("tr", "TR"), Locale("en", "US")];
  static Locale initialLanguage = Locale("tr", "TR");
  static Locale currentLocale = Locale("tr");
}



import 'package:flutter/services.dart';
import 'package:yodawebapp/utils/const.dart';

class DomainFormatter extends TextInputFormatter {
  RegExp exp = new RegExp("([a-z])");

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue,
      TextEditingValue newValue
      ) {
    String newText = newValue.text;
    // ignore: unrelated_type_equality_checks
    if (newText.contains('.yoda.com') && exp.allMatches(newText).length == newText.length -2)  {
      newText = newText.replaceAll('.yoda.com', '');
    } else {
      newText = oldValue.text.replaceAll('.yoda.com', '');
    }
    return new TextEditingValue(
      text: newText.toString().toLowerCase() + '.' + Const.STANDARD_DOMAIN,
      selection: new TextSelection.collapsed(offset: newText.length),
    );
  }
}
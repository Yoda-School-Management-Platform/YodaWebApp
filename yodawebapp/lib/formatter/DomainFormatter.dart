

import 'package:flutter/services.dart';
import 'package:yodawebapp/utils/const.dart';

class DomainFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue,
      TextEditingValue newValue
      ) {
    String newText = newValue.text;
    if (newText.contains('.yoda.com'))  {
      newText = newText.replaceAll('.yoda.com', '');
    } else {
      newText = oldValue.text.replaceAll('.yoda.com', '');
    }
    return new TextEditingValue(
      text: newText.toString() + '.' + Const.STANDARD_DOMAIN,
      selection: new TextSelection.collapsed(offset: newText.length),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:yodawebapp/utils/color_palette.dart';


class StandardInput extends StatefulWidget {
  final stream;
  final onChanged;
  final labelText;
  final obscureText;
  final controller;
  final inputFormatters;

  const StandardInput({Key key, this.stream, this.onChanged, this.labelText, this.obscureText, this.controller, this.inputFormatters}) : super(key: key);

  _StandardInput createState() => _StandardInput();
}

class _StandardInput extends State<StandardInput> {

  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20),
      child: StreamBuilder(
          stream: widget.stream,
          builder: (context, snapshot) {
            return TextField(
                onChanged: widget.onChanged,
                obscureText: widget.obscureText != null ? widget.obscureText : false,
                inputFormatters: widget.inputFormatters != null ? widget.inputFormatters : [],
                controller: widget.controller != null ? widget.controller : null,
                decoration: InputDecoration(
                  labelText: widget.labelText,
                  errorText: snapshot.error,
                  labelStyle: TextStyle(color: Colors.grey),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(
                      color: Colors.red,
                      width: 3.0,
                    ),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(
                      color: Colors.red,
                      width: 3.0,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide:
                      BorderSide(width: 3.0, color: ColorPalette.yellow)),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(
                      color: Colors.grey,
                      width: 1.0,
                    ),
                  ),
                ));
          }
      ),
    );
  }

}
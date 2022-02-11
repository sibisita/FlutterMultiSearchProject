import 'package:flutter/material.dart';

class UseSubdirectoryCheckBox extends StatefulWidget {
  const UseSubdirectoryCheckBox({
    Key? key,
  }) : super(key: key);

  @override
  State<UseSubdirectoryCheckBox> createState() =>
      _UseSubdirectoryCheckBoxState();
}

class _UseSubdirectoryCheckBoxState extends State<UseSubdirectoryCheckBox> {
  bool valueOffCheckbox = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Use sub-directories : "),
        Checkbox(
          value: valueOffCheckbox,
          onChanged: (value) {
            setState(() {
              valueOffCheckbox = value ?? false;
            });
          },
        ),
      ],
    );
  }
}

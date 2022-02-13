import 'package:flutter/material.dart';

class LogStream extends StatefulWidget {
  const LogStream({
    Key? key,
  }) : super(key: key);

  @override
  State<LogStream> createState() => _LogStreamState();
}

class _LogStreamState extends State<LogStream> {
  ScrollController LogScrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        controller: LogScrollController,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          for (var i = 0; i < 120; i++)
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Hello world"),
                ],
              ),
            ),
        ]),
      ),
    );
  }
}

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:multi_search/frontend_elements/log_stream.dart';
import 'package:provider/provider.dart';

import '../providers/folder_location_providers.dart';

class ProgressPage extends StatefulWidget {
  const ProgressPage({Key? key}) : super(key: key);

  @override
  _ProgressPageState createState() => _ProgressPageState();
}

class _ProgressPageState extends State<ProgressPage> {
  double value = 0.5;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.orangeAccent,
                    borderRadius: BorderRadius.circular(10)),
                child: Stack(fit: StackFit.passthrough, children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: LinearProgressIndicator(value: value)),
                  ),
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            "Search Location: ${context.read<FolderLocationProvider>().searchlocation}"),
                        Text(
                            "Save Location: ${context.read<FolderLocationProvider>().savelocation}"),
                        Text("Files remaining: "),
                      ],
                    ),
                  )
                ]),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.orangeAccent,
                    borderRadius: BorderRadius.circular(10)),
                child: Row(children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pushNamed('/');
                          },
                          child: Text("Main Page")),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                          onPressed: (value <
                                  0.6) // need to change to >=1, where value= files completed / total files
                              ? null
                              : () {
                                  Navigator.of(context).pushNamed('/about');
                                },
                          child: Text("Result Page")),
                    ),
                  )
                ]),
              ),
            ),
          ),
          Expanded(
            flex: 8,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.orangeAccent,
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  children: [
                    Text("Detailed progress comes below...",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    LogStream(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

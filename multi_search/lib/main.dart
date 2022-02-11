import 'package:flutter/material.dart';

import 'frontend_elements/search_button.dart';
import 'frontend_elements/search_value_acceptor.dart';
import 'frontend_elements/use_subdirectory_check_box.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Multi Search',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: Colors.blue,
      child: Row(children: [
        (Expanded(
            flex: 6,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SearchValueAcceptor(),
            ))),
        Expanded(
          flex: 5,
          child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.orangeAccent,
                  borderRadius: BorderRadius.all(
                    Radius.circular(12.0),
                  ),
                ),
                child: Column(
                  children: [
                    Spacer(),
                    UseSubdirectoryCheckBox(),
                    SearchButton()
                  ],
                ),
              )),
        )
      ]),
    ));
  }
}

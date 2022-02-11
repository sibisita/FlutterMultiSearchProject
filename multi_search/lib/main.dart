import 'package:flutter/material.dart';

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
              child: Container(
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 181, 212, 236),
                    borderRadius: BorderRadius.all(
                      Radius.circular(12.0),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      autocorrect: false, autofocus: true,
                      cursorColor: Colors.redAccent, cursorWidth: 5,
                      cursorHeight: 30,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(10),
                          focusColor: Colors.blue[100],
                          border: UnderlineInputBorder(
                              borderSide: BorderSide(width: 80)),
                          hintText:
                              "  Enter the values to be searched here...\n  Each line is treated as a seperated value"),
                      keyboardType: TextInputType.multiline,
                      minLines: 30, //Normal textInputField will be displayed
                      maxLines:
                          null, // when user presses enter it will adapt to it
                    ),
                  )),
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
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                          onPressed: () {},
                          child: Column(
                            children: [
                              SizedBox(
                                height: 100,
                                child: Row(
                                  children: [
                                    Spacer(
                                      flex: 2,
                                    ),
                                    Icon(Icons.search),
                                    Spacer(),
                                    Text("Search",
                                        style: TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold)),
                                    Spacer(flex: 2),
                                  ],
                                ),
                              ),
                            ],
                          )),
                    )
                  ],
                ),
              )),
        )
      ]),
    ));
  }
}

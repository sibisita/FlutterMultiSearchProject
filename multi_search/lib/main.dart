import 'package:flutter/material.dart';
import 'package:multi_search/multi_search_provider.dart';
import 'package:multi_search/routes.dart';
import 'package:provider/provider.dart';

import 'frontend_elements/folder_picker.dart';
import 'frontend_elements/search_button.dart';
import 'frontend_elements/search_value_acceptor.dart';
import 'frontend_elements/use_subdirectory_check_box.dart';

void main() {
  runApp(
    /// Providers are above [MyApp] instead of inside it, so that tests
    /// can use [MyApp] while mocking the providers
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MultiSearchProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

/// Makes `Counter` readable inside the devtools by listing all of its properties

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Multi Search',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int counter = Provider.of(context);
    return Scaffold(
        floatingActionButton: FloatingActionButton(onPressed: () {
          print("Hello World!");
        }),
        body: Container(
          color: Colors.blue,
          child: Row(children: [
            (const Expanded(
                flex: 7,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: SearchValueAcceptor(),
                ))),
            Expanded(
              flex: 6,
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
                        Text("Hello"),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: InkWell(
                                  hoverColor: Colors.orangeAccent,
                                  onTap: () {
                                    Navigator.of(context).pushNamed('/about');
                                  },
                                  child: const Icon(Icons.info)),
                            )
                          ],
                        ),
                        const Spacer(),
                        const FolderPicker(
                          icon: Icons.folder,
                          buttonText: "Pick the folder to search.",
                        ),
                        const UseSubdirectoryCheckBox(),
                        const Spacer(),
                        const FolderPicker(
                          icon: Icons.save,
                          buttonText: "Pick the folder to save the results.",
                        ),
                        const Spacer(),
                        const SearchButton()
                      ],
                    ),
                  )),
            )
          ]),
        ));
  }
}

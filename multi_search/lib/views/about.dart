import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);
  final String letter = '''
Hi,

Multi Search was initially created to address a situation at my workplace. I was asked to find occurance details of 50 IPs in a folder containing 2000+ backup files. There was no readily available tool to do so. So I created this application. 

Before using flutter, I created similar application using python and TKINTER library. But that application was extremely slow.

So when flutter officially announced flutter for windows, I created this.

You can find the full source code for this in the below github repository.

https://github.com/sibisita/FlutterMultiSearchProject.git

All the best,

Sibi.
''';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("About Multi Search"),
        ),
        body: Center(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                  child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color.fromARGB(255, 181, 212, 236),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SelectableText(letter),
                      ))),
            ],
          ),
        )));
  }
}

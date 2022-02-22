import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/search_values_provider.dart';

class SearchValueAcceptor extends StatefulWidget {
  const SearchValueAcceptor({
    Key? key,
  }) : super(key: key);

  @override
  State<SearchValueAcceptor> createState() => _SearchValueAcceptorState();
}

class _SearchValueAcceptorState extends State<SearchValueAcceptor> {
  TextEditingController myController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    myController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    // Start listening to changes.
    myController.text =
        Provider.of<SearchValuesProvider>(context, listen: false)
            .searchValuesString;
    myController.addListener(() {
      context
          .read<SearchValuesProvider>()
          .searchvaluesUpdater(myController.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    //myController.text = "Hello";

    return Container(
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 181, 212, 236),
          borderRadius: BorderRadius.all(
            Radius.circular(12.0),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: myController,
            autocorrect: false, autofocus: true,
            cursorColor: Colors.redAccent, cursorWidth: 5,
            cursorHeight: 30,
            decoration: InputDecoration(
                contentPadding: EdgeInsets.all(10),
                focusColor: Colors.blue[100],
                border: UnderlineInputBorder(borderSide: BorderSide(width: 80)),
                hintText:
                    "  Enter the values to be searched here...\n  Each line is treated as a seperated value"),

            keyboardType: TextInputType.multiline,
            minLines: 30, //Normal textInputField will be displayed
            maxLines: null, // when user presses enter it will adapt to it
          ),
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_desktop_folder_picker/flutter_desktop_folder_picker.dart';

class FolderPicker extends StatefulWidget {
  final String buttonText;
  final IconData icon;

  const FolderPicker({
    Key? key,
    required this.buttonText,
    required this.icon,
  }) : super(key: key);
  @override
  _FolderPickerState createState() => _FolderPickerState();
}

class _FolderPickerState extends State<FolderPicker> {
  String _path = "Select a folder.";
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.amber,
            borderRadius: BorderRadius.circular(5),
            border: Border.all()),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                _path,
                softWrap: true,
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                  onPressed: () async {
                    String? path = await FlutterDesktopFolderPicker
                            .openFolderPickerDialog() ??
                        "Select a Folder";
                    setState(() {
                      _path = path.split("\\").join(" \\ ");
                    });
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(widget.icon),
                      Text(widget.buttonText),
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }
}

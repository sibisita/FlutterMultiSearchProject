import 'package:flutter/material.dart';
import 'package:flutter_desktop_folder_picker/flutter_desktop_folder_picker.dart';
import 'package:provider/provider.dart';

import '../providers/folder_location_providers.dart';

class FolderPicker extends StatefulWidget {
  ///type = 0 for search, type =1 for save
  final String buttonText;
  final IconData icon;
  final int type;

  const FolderPicker({
    Key? key,
    required this.buttonText,
    required this.icon,
    required this.type,
  }) : super(key: key);
  @override
  _FolderPickerState createState() => _FolderPickerState();
}

class _FolderPickerState extends State<FolderPicker> {
  @override
  Widget build(BuildContext context) {
    String _path = (widget.type == 0)
        ? context.watch<FolderLocationProvider>().searchlocation
        : context.watch<FolderLocationProvider>().savelocation;
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
                _path.split("\\").join("\\ "),
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
                        _path;

                    (widget.type == 0)
                        ? context
                            .read<FolderLocationProvider>()
                            .searchLocationUpdater(path)
                        : context
                            .read<FolderLocationProvider>()
                            .saveLocationUpdater(path);
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

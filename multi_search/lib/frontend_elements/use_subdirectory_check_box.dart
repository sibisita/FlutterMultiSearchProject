import 'package:flutter/material.dart';
import 'package:multi_search/providers/folder_location_providers.dart';
import 'package:provider/provider.dart';

class UseSubdirectoryCheckBox extends StatefulWidget {
  const UseSubdirectoryCheckBox({
    Key? key,
  }) : super(key: key);

  @override
  State<UseSubdirectoryCheckBox> createState() =>
      _UseSubdirectoryCheckBoxState();
}

class _UseSubdirectoryCheckBoxState extends State<UseSubdirectoryCheckBox> {
  @override
  Widget build(BuildContext context) {
    bool valueOffCheckbox =
        context.watch<FolderLocationProvider>().includeSubDirectory;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Use sub-directories : "),
        Checkbox(
          value: valueOffCheckbox,
          onChanged: (valuen) {
            context
                .read<FolderLocationProvider>()
                .includeSubDirectoryUpdater(valuen);
          },
        ),
      ],
    );
  }
}

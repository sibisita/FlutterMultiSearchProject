import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../backend_logic/main_search_logic.dart';
import '../providers/folder_location_providers.dart';
import '../providers/search_values_provider.dart';

class SearchButton extends StatelessWidget {
  const SearchButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: ElevatedButton(
          style: ButtonStyle(
            padding: MaterialStateProperty.all(const EdgeInsets.all(10)),
            elevation: MaterialStateProperty.all(8),
            backgroundColor: MaterialStateProperty.all(Colors.blue[700]),
            shadowColor: MaterialStateProperty.all(Colors.amber),
          ),
          onPressed: () {
            Navigator.of(context).pushNamed('/progress');
            if (context.read<FolderLocationProvider>().searchlocation ==
                "Select a folder.") {
              print("Select a folder to search.");
            } else if (context.read<FolderLocationProvider>().savelocation ==
                "Select a folder.") {
              print("Select a folder to save results.");
            } else if (context
                    .read<SearchValuesProvider>()
                    .searchValuesString ==
                "") {
              print("Enter Values to search");
            } else {
              mainSearchLogic(
                  searchLocation:
                      context.read<FolderLocationProvider>().searchlocation,
                  saveLocation:
                      context.read<FolderLocationProvider>().savelocation,
                  useSubdirectory: context
                      .read<FolderLocationProvider>()
                      .includeSubDirectory,
                  searchValues:
                      context.read<SearchValuesProvider>().searchValuesString);
            }
          },
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
                    Text("Start Search",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold)),
                    Spacer(flex: 2),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}

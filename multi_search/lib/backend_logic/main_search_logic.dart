import 'dart:io' as io;
//This function is called by the search button.

mainSearchLogic(
    {required String searchLocation,
    required String saveLocation,
    required String searchValues,
    required bool useSubdirectory}) async {
//We have the required information to start search.
/*We need to find the total number of files present in the searchLocation
*/

  Set<String> searchValuesSet = valueExtractor(
      searchValues); //search value set obtained by removing empty lines and duplicate elements
  Map resultDict = {};
  for (var i in searchValuesSet) {
    resultDict[i] = {
      {}
    }; //Creating empty dictionary for each search values for storing results
  }

  final listOfFiles = _listofFiles(
      searchLocation, useSubdirectory); //this function gets the list of files

  for (int i = 0; i < listOfFiles.length; i++) {
    (listOfFiles[i]).readAsString().then((String contents) {
      List<String> linesOfFile = contents.split("\n");
      // print(linesOfFile);
      for (int j = 0; j < linesOfFile.length; j++) {
        for (var search in searchValuesSet) {
          if (linesOfFile[j].contains(search)) {
            try {
              resultDict[search][listOfFiles[i].toString()]
                  .add([(j + 1).toString(), linesOfFile[j].toString()]);
              // print("success");

            } catch (e) {
              resultDict[search] = {}; //initialising a dictionary
              resultDict[search][listOfFiles[i].toString()] = [
                [(j + 1).toString(), linesOfFile[j].toString()]
              ];

              // print("elseBlock");

            }
          }
        }
      }
      for (var g in searchValuesSet) {
        print("\n\n\n" + g);
        print(resultDict[g]);
      }
    });
  }
}

valueExtractor(values) {
  List<String> rawValues = values.split("\n");
  while (rawValues.contains("")) {
    rawValues.remove("");
  }
  Set<String> setValues = rawValues.toSet();
  return setValues;
}

_listofFiles(searchLocation, useSubdirectory) {
  var directory = (searchLocation);

  var fileandDir = io.Directory("$directory").listSync(
      recursive: useSubdirectory,
      followLinks: false); //gets both files and directory
  var files = [];
  //below code filters the files
  for (var i in fileandDir) {
    if (i.runtimeType.toString() == "_File") {
      files.add(i);
    }
  }

  return files; //returns file objects
}

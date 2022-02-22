mainSearchLogic(
    {String searchLocation = "",
    String saveLocation = "",
    String searchValues = "",
    bool useSubdirectory = false}) {
  print(searchLocation);
  print(saveLocation);
  //print(searchValues);
  print(useSubdirectory);

  Set<String> searchValuesSet = valueExtractor(searchValues);
  print(searchValuesSet);
  print(searchValuesSet.length);
}

valueExtractor(values) {
  List<String> rawValues = values.split("\n");
  while (rawValues.contains("")) {
    rawValues.remove("");
  }
  Set<String> setValues = rawValues.toSet();
  return setValues;
}

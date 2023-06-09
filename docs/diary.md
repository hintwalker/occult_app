## Load json from asset

### Dữ liệu chứa trong file là dạng Map

``` dart
Future<DataModel> readJsonData() async {
    final jsonString =
        await rootBundle.rootBundle.loadString('assets/dataAsMap.json');
    final json = json.decode(jsonString) as Map<String, dynamic>;
    return DataModel.fromJson(json);
  }
```

### Dữ liệu chứa trong file là dạng List

``` dart
Future<List<DataModel>> readJsonData() async {
    final jsonString =
        await rootBundle.rootBundle.loadString('assets/dataAsList.json');
    final listOfJsonElements = json.decode(jsonString) as List;
    return listOfJsonElements.map((jsonElement) => DataModel.fromJson(jsonElement)).toList();
  }
```
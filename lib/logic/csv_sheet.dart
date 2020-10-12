import 'dart:convert';
import 'dart:io';

main() {
  CsvSheet().readFile();
}

// TODO extract reading/parsing logic into csv reader
class CsvSheet {

  // load completely into memory
  // iterate
  // find row with value in specific column
  // go to line number x
  // get cell, format to int/String/double, ...
  // getRow -> get by index or find
  // inside row --> get value by column name or index


  List<String> columnNames = [];
  

  void readFile() {

    final File file = new File("assets/csv/bmi_children_boys.csv");
    Stream<List> inputStream = file.openRead();

    int currentLineNumber = 0;
    
    inputStream
        .transform(utf8.decoder)       // Decode bytes to UTF-8.
        .transform(new LineSplitter()) // Convert stream to individual lines.
        .listen((String line) {        // Process results.

          List<String> row = line.split(','); // split by comma
          if (currentLineNumber == 0) {
            columnNames = row;
            print("HEADER: $row");
          }
          else {
            print("ROW:    $row");
            columnNames.forEach((element) {

            });
          }

          currentLineNumber++;
        },
        onDone: () { print('File is now closed.'); },
        onError: (e) { print(e.toString()); });

  }




}



import 'dart:convert';
import 'dart:io';

main() {
  CsvReader().readFile();
}


class CsvReader {

  // load completely into memory
  // iterate
  // find row with value in specific columnn
  // go to line number x
  // get cell, format to int/String/double, ...
  // getRow -> get by index or find
  // inside row --> get value by column name or index



  void readFile() {

    final File file = new File("assets/csv/bmi_children_boys.csv");
    Stream<List> inputStream = file.openRead();

    int currentLineNumber = 0;
    List<String> columnNames = [];
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
//            String id = row[0];
//            String symbol = row[1];
//            String open = row[2];
//            String low = row[3];
//            String high = row[4];
//            String close = row[5];
//            String volume = row[6];
//            String exchange = row[7];
//            String timestamp = row[8];
//            String date = row[9];
//            print('$id, $symbol, $open');

            columnNames.forEach((element) {

            });
          }

          currentLineNumber++;
        },
        onDone: () { print('File is now closed.'); },
        onError: (e) { print(e.toString()); });

  }




}



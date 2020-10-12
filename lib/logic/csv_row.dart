class CsvRow {

/*
TODO maybe abstract this some more:
  - CsvSheet
    - fromFile, fromString, from...
    - params:
      - divider
      - encoding
      - numberOfHeaderRows, default=1
        - if multiple: defaultHeaderRow (the one you are referring to for titles)
        - should also have getter for other column content in header
    - methods
      - getHeaderRow(index)
  - CsvCell
    - getColumnTitle
    - getValue
    - rowIndex, colIndex --> need to access current coordinates somewhere!
  - CsvHeader (could have multiple rows), i.e. Amazon,
  - CsvRow
    - contentIndex (starting with 0, after last header row), rawIndex (in file, starting with 0)
  - CsvColumn
    - getColumnName

    - type: String, int, double, any object (needs parser logic)
    - getCell(int columnIndex)
  - quick access for titles via HashMap (created on init)
  - editing:
    - moving columns
    - new columns
    - export to csv, custom divider


 */



  List<String> rowContent;

  String stringValue({int columnIndex, String columnName}) {
    assert((columnName!=null || columnIndex!=null) && (columnName==null || columnIndex==null));
    // get
  }


  List<String> _getColumnNames() {

  }

}
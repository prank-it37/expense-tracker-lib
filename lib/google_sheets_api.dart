import 'package:gsheets/gsheets.dart';

class GoogleSheetsApi {
  static const _credentials = r'''
  {
    // This is a sample credentials file for Google Sheets API.
    // Replace this with your own credentials JSON.
  }
  ''';
  // json file content obtained after linking gsheet with google cloud

  static final _spreadsheetId = '';
  // change this to match with your own spreadsheet

  static final _gsheets = GSheets(_credentials);
  static Worksheet? _worksheet;

  static int numberOfTransactions = 0;
  static List<List<dynamic>> currentTransactions = [];
  static bool loading = true;

  // initialise the spreadsheet!
  Future init() async {
    final ss = await _gsheets.spreadsheet(_spreadsheetId);
    _worksheet = ss.worksheetByTitle('Flutter');
    countRows();
  }

  // count the number of notes
  static Future countRows() async {
    while ((await _worksheet!.values.value(
          column: 1,
          row: numberOfTransactions + 1,
        )) !=
        '') {
      numberOfTransactions++;
    }
    // now we know how many notes to load, now let's load them!
    loadTransactions();
  }

  // load existing notes from the spreadsheet
  static Future loadTransactions() async {
    if (_worksheet == null) return;

    for (int i = 1; i < numberOfTransactions; i++) {
      final String transactionName = await _worksheet!.values.value(
        column: 1,
        row: i + 1,
      );
      final String transactionAmount = await _worksheet!.values.value(
        column: 2,
        row: i + 1,
      );
      final String transactionType = await _worksheet!.values.value(
        column: 3,
        row: i + 1,
      );

      if (currentTransactions.length < numberOfTransactions) {
        currentTransactions.add([
          transactionName,
          transactionAmount,
          transactionType,
        ]);
      }
    }
    print(currentTransactions);
    // this will stop the circular loading indicator
    loading = false;
  }

  // insert a new transaction
  static Future insert(String name, String amount, bool _isIncome) async {
    if (_worksheet == null) return;
    numberOfTransactions++;
    currentTransactions.add([
      name,
      amount,
      _isIncome == true ? 'income' : 'expense',
    ]);
    await _worksheet!.values.appendRow([
      name,
      amount,
      _isIncome == true ? 'income' : 'expense',
    ]);
  }

  // CALCULATE THE TOTAL INCOME!
  static double calculateIncome() {
    double totalIncome = 0;
    for (int i = 0; i < currentTransactions.length; i++) {
      if (currentTransactions[i][2] == 'income') {
        totalIncome += double.parse(currentTransactions[i][1]);
      }
    }
    return totalIncome;
  }

  // CALCULATE THE TOTAL EXPENSE!
  static double calculateExpense() {
    double totalExpense = 0;
    for (int i = 0; i < currentTransactions.length; i++) {
      if (currentTransactions[i][2] == 'expense') {
        totalExpense += double.parse(currentTransactions[i][1]);
      }
    }
    return totalExpense;
  }
}

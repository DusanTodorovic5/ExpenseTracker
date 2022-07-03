import 'day.dart';
import 'expense.dart';

class Manager {
  List<Expense> expenses = [];
  late Day today;

  static final Manager _instance = Manager._internal();

  factory Manager() {
    return _instance;
  }

  Manager._internal();
}

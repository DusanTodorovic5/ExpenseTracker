import 'package:flutter/material.dart';

import 'day.dart';
import 'expense.dart';
import 'pair.dart';

class Manager {
  List<Expense> expenses = [];
  late Day today;

  static final Manager _instance = Manager._internal();

  factory Manager() {
    return _instance;
  }

  Manager._internal() {
    Expense ex1 = Expense(
      name: "Food",
      color: Colors.red,
    );
    expenses.add(ex1);
    Expense ex2 = Expense(
      name: "Bills",
      color: Color.fromARGB(255, 54, 89, 244),
    );
    expenses.add(ex2);
    Expense ex3 = Expense(
      name: "Fuel",
      color: Color.fromARGB(255, 54, 244, 117),
    );
    expenses.add(ex3);
    Expense ex4 = Expense(
      name: "Drings",
      color: Color.fromARGB(255, 206, 54, 244),
    );
    expenses.add(ex4);
    today = Day(date: DateTime.now(), expenses: []);
    today.expenses.add(Pair(ex1, 1200.00));
    today.expenses.add(Pair(ex2, 1200.00));
    today.expenses.add(Pair(ex4, 1000.00));
    today.expenses.add(Pair(ex4, 2200.00));
    today.expenses.add(Pair(ex1, 500.00));
    today.expenses.add(Pair(ex2, 700.00));
    today.expenses.add(Pair(ex3, 800.00));
  }
}

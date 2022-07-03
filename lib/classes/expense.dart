import 'package:flutter/material.dart';

class Expense {
  Expense({required this.name, required this.color});

  String name;
  Color color;

  Expense.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        color = Color.fromARGB(
          json['a'],
          json['r'],
          json['g'],
          json['b'],
        );

  Map<String, dynamic> toJson() => {
        'name': name,
        'a': color.alpha,
        'r': color.red,
        'g': color.green,
        'b': color.blue,
      };
}

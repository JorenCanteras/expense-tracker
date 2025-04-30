import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense_model.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem(this.expense, {super.key});

  final Expense expense;

  @override
  Widget build(BuildContext context) {
    return Card(child: Text(expense.title),);
  }
}

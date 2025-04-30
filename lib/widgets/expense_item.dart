import 'dart:math';
import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense_model.dart';
import 'package:flutter/src/material/icons.dart';
class ExpenseItem extends StatelessWidget {
  const ExpenseItem(this.expense, {super.key});

  final Expense expense;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 20,
        ),
        child: Column(
          children: [
            Text(expense.title),
            SizedBox(height: 10),
            Row(
              children: [
                Text('\$${expense.amount.toStringAsFixed(2)}'),
                Spacer(),
                Row(children: [
                  Icon(categoryIcons[expense.category]),
                  const SizedBox(width: 6),
                  Text(expense.formattedDate),
                ],)
              ],
            )
          ],
        ),
      ),
    );
  }
}

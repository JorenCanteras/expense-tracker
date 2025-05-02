import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense_model.dart';
import 'package:expense_tracker/widgets/expense_item.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({
    super.key,
    required this.expenses,
    required this.onRemoveExpense,
  });

  final List<Expense> expenses;
  final void Function(Expense expense) onRemoveExpense;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (context, index) => Dismissible(
        key: ValueKey((expenses[index],)),
        onDismissed: (direction) {
          onRemoveExpense(expenses[index]);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: const Text('Expense deleted.'),
              duration: const Duration(seconds: 3),
              action: SnackBarAction(
                label: 'Undo',
                onPressed: () {
                  // Add undo functionality here if needed
                },
              ),
            ),
          );
        },
        child: ExpenseItem(
          expenses[index],
        ),
      ),
    );
  }
}


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
        background: Container(
          color: Theme.of(context).colorScheme.error.withOpacity(0.75),
          margin: EdgeInsets.symmetric(
              horizontal: Theme.of(context).cardTheme.margin!.horizontal),
          alignment: Alignment.centerRight,
          padding: const EdgeInsets.only(right: 32),
          child: const Icon(
            Icons.delete,
            color: Colors.white,
            size: 40,
          ),
        ),
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

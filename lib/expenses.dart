

import 'package:etracker/new_expense.dart';
import 'package:etracker/widgets/chart/chart.dart';
import 'package:etracker/widgets/expenses_list/expenses_list.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'models/expense.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
      title: 'Flutter Course',
      amount: 389.00,
      date: DateTime.now(),
      category: Category.work,
    ),
    Expense(
      title: 'Burger Mac-D',
      amount: 150.00,
      date: DateTime.now(),
      category: Category.food,
    ),
    Expense(
      title: 'Movie: 12th Fail',
      amount: 250.00,
      date: DateTime.now(),
      category: Category.leisure,
    ),
    Expense(
      title: 'Trip to Goa',
      amount: 2250.00,
      date: DateTime.now(),
      category: Category.travel,
    ),
  ];

  void _addExpenseOverlay() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) => NewExpense(onAddExpense: _addExpense),
    );
  }

  void _addExpense(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  void _removeExpense(Expense expense) {
    final expenseIndex = _registeredExpenses.indexOf(expense);
    setState(() {
      _registeredExpenses.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(duration: const Duration(seconds: 3), content: const Text('Expense deleted'), action: SnackBarAction(label: 'Undo', onPressed: (){
      setState(() {
        _registeredExpenses.insert(expenseIndex, expense);
      });
    },),),);
  }

  @override
  Widget build(BuildContext context) {
    Widget screenContent = Center(
      child: Text("OOP's \n Nothing to track! Start adding some expenses", style: GoogleFonts.comfortaa(color: Colors.blueGrey, fontSize: 13),textAlign: TextAlign.center,),
    );

    if (_registeredExpenses.isNotEmpty) {
      screenContent = ExpensesList(
        expenses: _registeredExpenses,
        onRemoveExpense: _removeExpense,
      );
    }
    return Scaffold(
      appBar: AppBar(
          title: Text(
            "ꫀׁׅܻTracker",
            style: GoogleFonts.comfortaa(),
          ),
          actions: [
            IconButton(
              onPressed: _addExpenseOverlay,
              icon: const Icon(Icons.add),
            ),
          ]),
      body: Column(
        children: [
          Chart(expenses: _registeredExpenses),
          Expanded(child: screenContent),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../models/expense.dart';

class ExpenseItem extends StatelessWidget{
  const ExpenseItem(this.expense, {super.key});

  final Expense expense;

  @override
  Widget build(Object context) {
    return Card(  child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Text(expense.title, style: GoogleFonts.comfortaa(fontSize: 15),),
        const SizedBox(height: 4,),
        Row(children: [
          Text('₹${expense.amount.toStringAsFixed(2)}', style: GoogleFonts.comfortaa(fontWeight: FontWeight.bold, fontSize: 12),),
          const Spacer(),
          Row(children: [
            Icon(categoryIcons[expense.category], size: 18,),
            const SizedBox(width: 8,),
            Text(expense.formatedDate, style: GoogleFonts.comfortaa(fontSize: 12),),
          ],),
        ],)

      ],)
    ),);
  }}
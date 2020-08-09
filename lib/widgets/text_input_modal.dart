import 'dart:ui';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import '../cubit/expenditure_cubit.dart';
import '../models/expenditure.dart';

class InputWidget extends StatefulWidget {
  @override
  _InputWidgetState createState() => _InputWidgetState();
}

class _InputWidgetState extends State<InputWidget> {
  final _titleController = TextEditingController();

  final _amountController = TextEditingController();
  void _submitToDb(BuildContext context) {
    Expenditure expenditure = Expenditure(
      title: _titleController.text,
      amount: double.parse(_amountController.text),
      note: "Note",
      date: DateTime.now(),
    );
    ExpenditureCubit expCubit = context.bloc<ExpenditureCubit>();
    expCubit.insert(expenditure);

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: _titleController,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              keyboardType: TextInputType.number,
              controller: _amountController,
            ),
            Container(
              alignment: Alignment.bottomRight,
              child: RaisedButton(
                onPressed: () => _submitToDb(context),
                child: Text(
                  "Add Expenditure",
                  style: TextStyle(color: Colors.white),
                ),
                color: Theme.of(context).primaryColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}

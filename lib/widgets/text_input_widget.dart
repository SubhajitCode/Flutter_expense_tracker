import 'package:expense_tracker/models/expenditure.dart';
import '../models/expenditure_provider.dart';
import 'package:flutter/material.dart';

void textInputModal(BuildContext context) {
  showModalBottomSheet<void>(
    isScrollControlled: true,
    context: context,
    builder: (context) {
      return InputWidget();
    },
  );
}

class InputWidget extends StatefulWidget {
  @override
  _InputWidgetState createState() => _InputWidgetState();
}

class _InputWidgetState extends State<InputWidget> {
  final _titleController = TextEditingController();

  final _amountController = TextEditingController();
  void _submitToDb() {
    Expenditure expenditure = Expenditure(
      title: _titleController.text,
      amount: double.parse(_amountController.text),
      note: "Note",
      date: DateTime.now(),
    );
    ExpenditureProvider.tp.insert(expenditure);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: Container(
        child: Column(mainAxisSize: MainAxisSize.min, children: [
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
              onPressed: _submitToDb,
              child: Text("Add Expenditure"),
              color: Theme.of(context).primaryColor,
            ),
          ),
        ]),
      ),
    );
  }
}

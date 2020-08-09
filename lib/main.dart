import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/expenditure_cubit.dart';
import 'widgets/expenditure_widget.dart';
import 'widgets/text_input_modal.dart';

void main() {
  runApp(ExpenseTracker());
}

class ExpenseTracker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: BlocProvider(
        create: (context) => ExpenditureCubit(),
        child: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({
    Key key,
  }) : super(key: key);
  void _textInputModal(BuildContext prevContext) async {
    ExpenditureCubit expenditureCubit = prevContext.bloc<ExpenditureCubit>();
    showModalBottomSheet(
      isScrollControlled: true,
      context: prevContext,
      builder: (prevContext) {
        return BlocProvider.value(
          value: expenditureCubit,
          child: InputWidget(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Personal expense Tracker"),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ExpenditureWidget(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        child: Icon(Icons.add),
        onPressed: () => _textInputModal(context),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

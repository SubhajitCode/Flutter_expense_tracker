import 'package:expense_tracker/cubit/expenditure_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
//import 'package:intl/intl.dart';

import '../models/expenditure.dart';
import 'empty_state.dart';
import 'loading_state.dart';

class ExpenditureWidget extends StatelessWidget {
  const ExpenditureWidget({
    Key key,
  }) : super(key: key);

  // void _onEditHandler(id) {
  //   return;
  // }

  void _onDeleteHandler(int id, ExpenditureCubit expCubit) {
    expCubit.delete(id);
  }

  Widget _listView(List<Expenditure> expenditureList) {
    expenditureList = expenditureList.reversed.toList();
    return ListView.builder(
      itemBuilder: (context, index) {
        return Column(
          children: [
            ListTile(
              leading: CircleAvatar(
                radius: 30,
                child: FittedBox(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "\u20B9${expenditureList[index].amount}",
                    ),
                  ),
                ),
              ),
              title: Text("${expenditureList[index].title}",
                  style: Theme.of(context).textTheme.headline6),
              subtitle: Text(
                  DateFormat.yMMMd().format(expenditureList[index].date),
                  style: Theme.of(context).textTheme.subtitle1),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  //TODO implement Edit
                  // IconButton(
                  //     icon: Icon(
                  //       Icons.edit,
                  //       color: Colors.blue,
                  //     ),
                  //     onPressed: null),
                  IconButton(
                      icon: Icon(Icons.delete_outline_outlined),
                      onPressed: () => _onDeleteHandler(
                          expenditureList[index].id,
                          context.bloc<ExpenditureCubit>())),
                ],
              ),
            ),
            Divider(),
          ],
        );
      },
      itemCount: expenditureList.length,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: BlocBuilder<ExpenditureCubit, ExpenditureState>(
          builder: (context, state) {
            if (state is ExpenditureInitial) return EmptyState();
            if (state is ExpenditureLoading) return LoadingState();
            if (state is ExpenditureLoaded)
              return _listView(state.expenditures);
            else
              return Text("some thing Is wong");
          },
        ),
      ),
    );
  }
}

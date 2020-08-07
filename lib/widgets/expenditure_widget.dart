import 'package:expense_tracker/cubit/expenditure_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
//import 'package:intl/intl.dart';

import '../models/expenditure.dart';

class ExpenditureWidget extends StatelessWidget {
  const ExpenditureWidget({
    Key key,
  }) : super(key: key);

  Widget listView(List<Expenditure> expenditureList) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return Card(
          elevation: 5,
          child: ListTile(
            leading: CircleAvatar(
              radius: 30,
              backgroundColor: Theme.of(context).accentColor,
              child: FittedBox(
                  child: Padding(
                padding: const EdgeInsets.all(6),
                child: Text(
                  "\u20B9${expenditureList[index].amount}",
                ),
              )),
            ),
            title: Text(
              "${expenditureList[index].title}",
              style: Theme.of(context).textTheme.headline6,
            ),
            subtitle: Text(
              "Date",
              //DateFormat.yMMMd().format(expenditureList[index].date),
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ),
        );
      },
      itemCount: expenditureList.length,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 600,
        child: BlocBuilder<ExpenditureCubit, ExpenditureState>(
            builder: (context, state) {
          if (state is ExpenditureInitial) return Text("Initial ...");
          if (state is ExpenditureLoading) return Text("Loading ...");
          if (state is ExpenditureLoaded)
            return listView(state.expenditures);
          else
            return Text("something Wrong");
        }));
  }
}

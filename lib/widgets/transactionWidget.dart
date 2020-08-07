import 'package:flutter/material.dart';
//import 'package:intl/intl.dart';

import '../models/expenditure.dart';

class ExpenditureWidget extends StatefulWidget {
  ExpenditureWidget();
  @override
  _ExpenditureWidgetState createState() => _ExpenditureWidgetState();
}

class _ExpenditureWidgetState extends State<ExpenditureWidget> {
  List<Expenditure> expenditureList;
  _ExpenditureWidgetState();

  void _refresh() async {
    expenditureList = await Expenditure().getDemoList();
    print("Refresh");
    for (var expenditure in expenditureList) {
      print(expenditure);
    }

    // setState(() async {
    //   expenditureList = await Expenditure().getDemoList();
    // });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Expenditure>>(
      future: Expenditure().getDemoList(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          expenditureList = snapshot.data;
          return Container(
            height: 600,
            child: ListView.builder(
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
            ),
          );
        } else {
          return Card(
            child: Text("No data"),
          );
        }
      },
    );
  }
}

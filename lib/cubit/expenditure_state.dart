part of 'expenditure_cubit.dart';

@immutable
abstract class ExpenditureState {
  const ExpenditureState();
}

class ExpenditureInitial extends ExpenditureState {
  final List<Expenditure> expenditures;
  const ExpenditureInitial(this.expenditures);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is ExpenditureInitial && o.expenditures == expenditures;
  }

  @override
  int get hashCode => expenditures.hashCode;
}

// class ExpenditureInsert extends ExpenditureState {

// }

// class ExpenditureDelete extends ExpenditureState {}

// class ExpenditureUpdate extends ExpenditureState {}

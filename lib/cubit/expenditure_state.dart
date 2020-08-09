part of 'expenditure_cubit.dart';

@immutable
abstract class ExpenditureState {
  const ExpenditureState();
}

class ExpenditureInitial extends ExpenditureState {
  const ExpenditureInitial();
}

class ExpenditureLoading extends ExpenditureState {
  const ExpenditureLoading();
}

class ExpenditureLoaded extends ExpenditureState {
  final List<Expenditure> expenditures;
  const ExpenditureLoaded(this.expenditures);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is ExpenditureLoaded && listEquals(o.expenditures, expenditures);
  }

  @override
  int get hashCode => expenditures.hashCode;
}

class ExpenditureNodata extends ExpenditureState {}

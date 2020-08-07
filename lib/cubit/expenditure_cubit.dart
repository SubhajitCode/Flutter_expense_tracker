import 'package:bloc/bloc.dart';
import 'package:expense_tracker/models/expenditure.dart';
import 'package:meta/meta.dart';

part 'expenditure_state.dart';

class ExpenditureCubit extends Cubit<ExpenditureState> {
  final List<Expenditure> expenditures;
  ExpenditureCubit(this.expenditures) : super(ExpenditureInitial(expenditures));
}

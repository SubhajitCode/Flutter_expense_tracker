import 'package:bloc/bloc.dart';
import 'package:expense_tracker/models/expenditure_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';
import '../models/expenditure.dart';

part 'expenditure_state.dart';

class ExpenditureCubit extends Cubit<ExpenditureState> {
  ExpenditureCubit() : super(ExpenditureInitial()) {
    getAllExpenditure();
  }

  Future<void> getAllExpenditure() async {
    emit(ExpenditureLoading());
    List<Expenditure> expenditures =
        await ExpenditureProvider.tp.getAllExpenditure();
    emit(ExpenditureLoaded(expenditures));
  }

  Future<void> insert(Expenditure expenditure) async {
    emit(ExpenditureLoading());
    await ExpenditureProvider.tp.insert(expenditure);
    getAllExpenditure();
  }
}

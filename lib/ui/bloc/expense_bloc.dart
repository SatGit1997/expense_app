import 'package:expense_app/data/local/db_helper.dart';
import 'package:expense_app/ui/bloc/expense_event.dart';
import 'package:expense_app/ui/bloc/expense_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExpenseBloc extends Bloc<ExpenseEvent, ExpenseState>{
  DbHelper dbHelper;

  ExpenseBloc({required this.dbHelper}) : super(ExpenseInitialState()){

    /// add
    on<AddExpenseEvent>((event, emit) async{

      emit(ExpenseLoadingState());
      bool check = await dbHelper.addExpense(event.newExpense);

      if(check){
        var allExp = await dbHelper.getAllExpense();

        emit(ExpenseLoadedState(mExp: allExp));
      } else {
        emit(ExpenseErrorState(errorMsg: "Expense cannot be added!!"));
      }
    });


  }
}
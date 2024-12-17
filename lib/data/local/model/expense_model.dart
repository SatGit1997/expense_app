import 'package:expense_app/data/local/db_helper.dart';
class ExpenseModel{
  int? id;
  int userId;
  int expenseType;
  String title;
  String desc;
  String createdAt;
  double amount;
  double balance;
  int categoryId;

  ExpenseModel(
  {this.id,
    required this.userId,
    required this.expenseType,
    required this.title,
    required this.desc,
    required this.createdAt,
    required this.amount,
    required this.balance,
    required this.categoryId});


  factory ExpenseModel.forMap(Map<String, dynamic> map) {
    return ExpenseModel(
      id: map[DbHelper.EXPENSE_ID],
        userId: map[DbHelper.TABLE_USER_ID],
        expenseType: map[DbHelper.EXPENSE_COLUMN_TABLE_TYPE],
        title: map[DbHelper.EXPENSE_COLUMN_TITLE],
        desc: map[DbHelper.EXPENSE_COLUMN_DESCRIPTION],
        createdAt: map[DbHelper.EXPENSE_COLUMN_CREATED_AT],
        amount: map[DbHelper.EXPENSE_COLUMN_AMOUNT],
        balance: map[DbHelper.EXPENSE_COLUMN_BALANCE],
        categoryId: map[DbHelper.EXPENSE_COLUMN_CAT_ID]);
  }


  Map< String, dynamic> toMap(){
    return{
      DbHelper.TABLE_USER_ID : userId,
      DbHelper.EXPENSE_COLUMN_TABLE_TYPE : expenseType,
      DbHelper.EXPENSE_COLUMN_TITLE : title,
      DbHelper.EXPENSE_COLUMN_DESCRIPTION : desc,
      DbHelper.EXPENSE_COLUMN_CREATED_AT : createdAt,
      DbHelper.EXPENSE_COLUMN_AMOUNT : amount,
      DbHelper.EXPENSE_COLUMN_BALANCE : balance,
      DbHelper.EXPENSE_COLUMN_CAT_ID : categoryId,
    };
  }

}
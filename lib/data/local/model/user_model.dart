import 'package:expense_app/data/local/db_helper.dart';

class UserModel{
  int? id;
  String userName;
  String email;
  String mobile;
  String password;
  String cPassword;


  UserModel(
      {this.id,
        required this.userName,
        required this.email,
        required this.mobile,
        required this.password,
        required this.cPassword,

      });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
        id: map[DbHelper.TABLE_ID],
        userName: map[DbHelper.TABLE_COLUMN_USERNAME],
        email: map[DbHelper.TABLE_COLUMN_EMAIL],
        mobile: map[DbHelper.TABLE_COLUMN_MOBILE],
        password: map[DbHelper.TABLE_COLUMN_PASSWORD],
        cPassword: map[DbHelper.TABLE_COLUMN_C_PASSWORD],
        );
  }

  Map<String, dynamic> toMap(){
    return {
      DbHelper.TABLE_COLUMN_USERNAME : userName,
      DbHelper.TABLE_COLUMN_EMAIL : email,
      DbHelper.TABLE_COLUMN_MOBILE : mobile,
      DbHelper.TABLE_COLUMN_PASSWORD : password,
      DbHelper.TABLE_COLUMN_C_PASSWORD : cPassword,

    };
  }
}
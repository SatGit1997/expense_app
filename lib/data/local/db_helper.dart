
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';

import 'model/user_model.dart';

/// tables
/// 1 user (uid, uname, pass, email, mobno, createdAt)
/// 2 expense (eid, uid, etype[1-> debit, 2-> credit....], title, desc, createdAt, amt, balance, cat id)
/// 3 cat( cat id, name, imgPath)
/// Database
/// 2models
/// fromMap and toMap


class DbHelper {
  //private constructor
  DbHelper._();

  static final instance = DbHelper._();

  Database ? uDB;

  /// user table
  static final String TABLE_USER = "user";
  static final String TABLE_ID = "u_id";
  static final String TABLE_COLUMN_USERNAME = "u_name";
  static final String TABLE_COLUMN_EMAIL = "u_email";
  static final String TABLE_COLUMN_MOBILE = "u_mobile";
  static final String TABLE_COLUMN_PASSWORD = "u_password";
  static final String TABLE_COLUMN_CREATED_AT = "u_created_at";


  /// expanse table
  static final String EXPENSE_TABLE = "expense";
  static final String EXPENSE_ID = "e_id";
  static final String TABLE_USER_ID = "u_id";
  static final String EXPENSE_COLUMN_TABLE_TYPE = "e_type";
  static final String EXPENSE_COLUMN_TITLE = "e_title";
  static final String EXPENSE_COLUMN_DESCRIPTION = "e_desc";
  static final String EXPENSE_COLUMN_CREATED_AT = "e_createdAt";
  static final String EXPENSE_COLUMN_AMOUNT = "amount";
  static final String EXPENSE_COLUMN_BALANCE = "balance";
  static final String EXPENSE_COLUMN_CAT_ID = "e_cat_id";

  /// First initial the database when database create
  Future<Database> initDB() async {
    uDB = uDB ?? await openDB();
    return uDB!;
  }

  /// openDB
  Future<Database> openDB() async {
    var appDir = await getApplicationDocumentsDirectory();
    var dbPath = join(appDir.path, "expenseDB.db");
    return openDatabase(dbPath, version: 1, onCreate: (db, version) {
      print("Db created!!");

      // user table sql
      db.execute(
          "created table $TABLE_USER ( $TABLE_ID integer primary key autoincrement $TABLE_COLUMN_USERNAME text not null, $TABLE_COLUMN_EMAIL text not null, $TABLE_COLUMN_MOBILE text not null, $TABLE_COLUMN_PASSWORD text not null, $TABLE_COLUMN_CREATED_AT text not null"
      );


      // expense table sql
      db.execute(
          "create table $EXPENSE_TABLE ( $EXPENSE_ID integer primary key autoincrement, $TABLE_USER_ID integer, $EXPENSE_COLUMN_TABLE_TYPE integer, $EXPENSE_COLUMN_TITLE text not null, $EXPENSE_COLUMN_DESCRIPTION text not null, $EXPENSE_COLUMN_CREATED_AT text not null, $EXPENSE_COLUMN_AMOUNT real not null, $EXPENSE_COLUMN_CAT_ID integer"
      );
    });
  }


  Future<bool> checkIfEmailAlreadyExists({required String email}) async {
    Database db = await initDB();

    List<Map<String, dynamic>> Data = await db.query(
        TABLE_USER, where: "$TABLE_COLUMN_EMAIL = ?", whereArgs: [email]);
    return Data.isNotEmpty;
  }


  Future<bool> registerUser({required UserModel newUser}) async {
    Database db = await initDB();
    int rowsEffected = await db.insert(TABLE_USER, newUser.toMap());
    return rowsEffected > 0;
  }


  Future<bool> authenticateUser(
      {required String email, required String pass}) async {
    Database db = await initDB();

    List<Map<String, dynamic>> mData = await db.query(TABLE_USER,
        where: "$TABLE_COLUMN_EMAIL = ? AND $TABLE_COLUMN_PASSWORD = ?",
        whereArgs: [email, pass]);
    if (mData.isNotEmpty) {
      var prefs = await SharedPreferences.getInstance();
      prefs.setString("userId", mData[0][TABLE_ID].toString());
    }
    return mData.isNotEmpty;
  }
}
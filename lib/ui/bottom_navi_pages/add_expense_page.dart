import 'package:expense_app/data/local/db_helper.dart';
import 'package:expense_app/data/local/model/expense_model.dart';
import 'package:expense_app/domain/app_constants.dart';
import 'package:expense_app/domain/ui_helper.dart';
import 'package:expense_app/ui/bottom_navi_pages/home_page.dart';
import 'package:expense_app/ui/on_boarding/dashboard_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddExpensePage extends StatefulWidget{
  @override
  State<AddExpensePage> createState() => _AddExpensePageState();
}

class _AddExpensePageState extends State<AddExpensePage> {

  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();
  TextEditingController amtController = TextEditingController();


  String selectedExpenseType = "Debit";

  int selectedCatIndex = -1;


  List<String> mExpenseType = ["Debit","Credit","Loan","Borrow"];
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Add Expense")),
        backgroundColor: Colors.green.shade300,
      ),
      backgroundColor: Colors.green.shade100,
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height - (
            MediaQuery.of(context).padding.top + kToolbarHeight
            )
          ),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                TextField(
                  controller: titleController,
                  decoration: mFieldDecor(hint: "Enter title here", heading: "Title"),
                ),
                mSpacer(),
                TextField(
                  controller: descController,
                  decoration: mFieldDecor(
                      hint: "Enter desc here",
                      heading: "Description"),
                ),
                mSpacer(),
                TextField(
                  controller: amtController,
                  decoration: mFieldDecor(
                      mPrefixText: "\$ ",
                      hint: "Enter Amount",
                      heading: "Amount"),
                ),
                mSpacer(),

                /// expense type

                StatefulBuilder(builder: (_, ss){
                  /*return SizedBox(width: double.infinity,
                    child: DropdownButton(
                        value: selectedExpenseType,
                        items: mExpenseType.map((expenseType){
                          return DropdownMenuItem(child: Text(expenseType), value: expenseType,);
                              }).toList(),
                         onChanged: (value){
                              selectedExpenseType = value ?? "Debit";
                              ss((){});
                              }),
                  );*/
                  return
                    DropdownMenu(
                        width: 354,
                        menuStyle: MenuStyle(),
                    // width: double.infinity,
                    inputDecorationTheme: InputDecorationTheme(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(11),
                        borderSide: BorderSide(width: 1,color: Color(0xff6574d3)),
                      ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(21),
                          borderSide: BorderSide(width: 1, color: Colors.green),
                        )
                    ),
                    initialSelection: selectedExpenseType,
                      onSelected: (value){
                      selectedExpenseType = value ?? "Debit";
                      },
                      dropdownMenuEntries: mExpenseType.map((expenseType){
                    return DropdownMenuEntry(value: expenseType, label: expenseType);
                                  }).toList());
                }),
                mSpacer(),
                InkWell(
                  onTap: (){
                    showModalBottomSheet(context: context, builder: (_){
                      return Container(
                        padding: EdgeInsets.symmetric(vertical: 21),
                        decoration: BoxDecoration(
                          color: Colors.green.shade200,
                          borderRadius: BorderRadius.only(topRight: Radius.circular(21),topLeft: Radius.circular(21))
                        ),
                        child: GridView.builder(
                          itemCount: AppConstants.mCat.length,
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 4,
                              childAspectRatio: 9/8,

                            ),
                            itemBuilder: (_, index){
                              return InkWell(
                                      onTap: (){
                                        selectedCatIndex = index;
                                setState(() {

                                });
                                Navigator.pop(context);
                               },
                                child: Column(
                                  children: [
                                    Image.asset(AppConstants.mCat[index].imgPath, width: 40, height: 40,),
                                    Text(AppConstants.mCat[index].title,)
                                  ],
                                ),
                              );
                        }),
                      );
                    });
                  },
                  child: Container(
                    width: double.infinity,
                    height: 55,
                    child: Center(

                      child: selectedCatIndex >= 0 ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(AppConstants.mCat[selectedCatIndex].imgPath, width: 40, height: 35,),
                          mSpacer(mWidth: 5),
                          Text("${AppConstants.mCat[selectedCatIndex].title}"),
                        ],
                      ) : Text("Choose a Category")
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(11),
                      border: Border.all(
                        width: 1,
                        color: Color(0xff6574d3)
                      )
                    ),
                  ),
                ),

                mSpacer(mHeight: 50),

                OutlinedButton(onPressed: () async{

                  if(titleController.text.isNotEmpty &&
                      descController.text.isNotEmpty &&
                      amtController.text.isNotEmpty&&
                      selectedCatIndex > -1
                  ) {

                    DbHelper dbHelper = DbHelper.instance;
                    var prefs = await SharedPreferences.getInstance();
                    String uid = prefs.getString("userId") ?? "";

                     bool check = await dbHelper.addExpense(ExpenseModel(
                         userId: int.parse(uid),
                        expenseType: selectedExpenseType,
                        title: titleController.text,
                        desc: descController.text,
                        createdAt: DateTime.now().millisecondsSinceEpoch.toString(),
                        amount: double.parse(amtController.text),
                        balance: 0,
                        categoryId: AppConstants.mCat[selectedCatIndex].id));

                    if(check){
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Expense added!!"),
                          backgroundColor: Colors.green,)
                      );
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => DashboardPage() ));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Error adding expense!!"),
                          backgroundColor: Colors.red,)
                      );
                    }

                  }


                }, child: Text("Add Expense"),
                  style: ElevatedButton.styleFrom(
                    side: BorderSide(
                      width: 1,
                      color: Color(0xff6574d3)
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(11),
                    ),


                    minimumSize: Size(35, 55)
                  ),)
              ],
            ),
          ),
        ),
      ),


    );
  }
}
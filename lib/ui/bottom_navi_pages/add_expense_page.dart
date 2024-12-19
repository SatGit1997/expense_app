import 'package:expense_app/domain/app_constants.dart';
import 'package:expense_app/domain/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AddPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    TextEditingController titleController = TextEditingController();
    TextEditingController descController = TextEditingController();
    TextEditingController amtController = TextEditingController();

    String selectedExpenseType = "Debit";


    List<String> mExpenseType = ["Debit","Credit","Loan","Borrow"];

    return Scaffold(
      backgroundColor: Colors.green.shade200,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
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
                mPrefixText: "\$",
                  hint: "Enter desc here",
                  heading: "Description"),
            ),
            mSpacer(),
            TextField(
              controller: amtController,
              decoration: mFieldDecor(hint: "Enter Amount", heading: "Amount"),
            ),
            mSpacer(),

            /// expense type

            StatefulBuilder(builder: (_, ss){
             /* return DropdownButton(
                  value: selectedExpenseType,
                  items: mExpenseType.map((expenseType){
                    return DropdownMenuItem(child: Text(expenseType), value: expenseType,);
                        }).toList());
                  }), onChanged: (value){
                        selectedExpenseType = value ?? "Debit";
                        ss((){});
                        });*/
              return DropdownMenu(
                width: double.infinity,
                inputDecorationTheme: InputDecorationTheme(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 1),
                    borderRadius: BorderRadius.circular(21),
                  ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 1),
                      borderRadius: BorderRadius.circular(21),
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
                    child: GridView.builder(
                      itemCount: AppConstants.mCat.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4,
                          childAspectRatio: 8/9
                        ), itemBuilder: (_, index){
                          return Column(
                            children: [
                              Image.asset(AppConstants.mCat[index].imgPath, width: 40, height: 40,),
                              Text(AppConstants.mCat[index].title)
                            ],
                          );
                    }),
                  );
                });
              },
              child: Container(
                width: double.infinity,
                height: 55,
                child: Center(
                  child: Text("Choose a Category"),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(21),
                  border: Border.all(
                    width: 1,
                    color: Colors.black
                  )
                ),
              ),
            )
          ],
        ),
      ),


    );
  }
}
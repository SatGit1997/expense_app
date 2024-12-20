
import 'package:expense_app/data/local/db_helper.dart';
import 'package:expense_app/data/local/model/user_model.dart';
import 'package:expense_app/domain/ui_helper.dart';

import 'package:flutter/material.dart';



class SignupPage extends StatefulWidget{

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
   TextEditingController userController = TextEditingController();

   TextEditingController emailController = TextEditingController();

   TextEditingController passController = TextEditingController();

   TextEditingController cPassController = TextEditingController();

   TextEditingController mobController = TextEditingController();

   // DbHelper dbHelper = DbHelper.getInstance();
   DbHelper dbHelper = DbHelper.instance;

   bool isPassVisible = false;

   bool isConPassVisible = false;

   /// Create a function that returns InputDecoration

   InputDecoration decorationtext(){
     return InputDecoration(
       labelText: "Username",
       // Label for the input field
       hintText: "Enter your username",
       // Hint text inside the field
       border: OutlineInputBorder(
         borderRadius: BorderRadius.circular(8),
       ),
         enabledBorder: OutlineInputBorder(
           // Border when not focused
       borderRadius: BorderRadius.circular(8),
         borderSide: BorderSide(color: Colors.purpleAccent, width: 2),
        ),
         focusedBorder: OutlineInputBorder(
           // Border when focused
        borderRadius: BorderRadius.circular(8),
         borderSide: BorderSide(color: Colors.purpleAccent, width: 2),
         ),
       filled: true,
       //Adds a fill color to the input field
       fillColor: Colors.white
     );
   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: ClampingScrollPhysics(parent: NeverScrollableScrollPhysics()),
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height - (
            MediaQuery.of(context).padding.top + kToolbarHeight
            )
          ),
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              children: [
                mSpacer(),
                Text('Create Account',
                  style: TextStyle(fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff6574d3)),),
                Container(
                  height: 90,
                  width: 90,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/images/Small_logo_rbg.png")
                      )
                  ),
                ),
                mSpacer(),
                Text('Create an account so you can explore all the',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 13
                  ),),
                Text(
                    'expenses',style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 13
                )),
                SizedBox(height: 10,),
                TextField(
                  controller: userController,
                  decoration: mFieldDecor(
                      hint: "Enter a your name",
                      heading: "Username")
                ),
                mSpacer(),
                TextField(
                  controller: emailController,
                  decoration: mFieldDecor(
                      hint: "Enter a valid email",
                      heading: "Email")
                ),
                mSpacer(),
                TextField(
                  controller: mobController,
                  keyboardType: TextInputType.number,
                  decoration: mFieldDecor(
                      hint: "Enter your mob num..",
                      heading: "Mobile"),
        
                ),
                mSpacer(),
                TextField(
                  controller: passController,
                  obscuringCharacter: "*",
        
                  decoration: mFieldDecor(
                      hint: "Enter a strong pass..",
                      heading: "Password"),
        
                ),
                mSpacer(),
                TextField(
                  controller: cPassController,
                  decoration: mFieldDecor(
                      hint: "Enter again pass",
                      heading: "Confirm Password"),
                ),
                /*SizedBox(height: 20,),
                TextField(
                  decoration: InputDecoration(
                      label: Text('Password'),
                      hintText: 'Enter 8 Digit password here',
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(11),
                          borderSide: BorderSide(
                              color: Color(0xff6574d3)
                          )
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(21),
                          borderSide: BorderSide(
                              color: Colors.green,
                              width: 2
                          )
                      )
                  ),
                ),
                SizedBox(height: 20,),
                TextField(
                  decoration: InputDecoration(
                      label: Text('Confirm Password'),
                      hintText: 'Enter again',
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(11),
                          borderSide: BorderSide(
                              color: Color(0xff6574d3)
                          )
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(21),
                          borderSide: BorderSide(
                              color: Colors.green,
                              width: 2
                          )
                      )
                  ),
                ),
                SizedBox(height: 20,),*/
        
        
                mSpacer(mHeight: 25),
        
        
                ElevatedButton(
                  onPressed: () async{
        
                  if(userController.text.isNotEmpty &&
                      emailController.text.isNotEmpty &&
                      mobController.text.isNotEmpty &&
                      passController.text.isNotEmpty &&
                      cPassController.text.isNotEmpty){
        
                    if(passController.text == cPassController.text){
        
                      /// register user
                      if(await dbHelper.checkIfEmailAlreadyExists(
                          email: emailController.text.toString())){
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Email already exits, login now"),backgroundColor: Colors.orangeAccent,));
                      }
                      else{
                      bool check = await dbHelper.registerUser(
                          newUser: UserModel(
                              userName: userController.text,
                              email: emailController.text,
                              mobile: mobController.text,
                              password: passController.text,
                              cPassword: cPassController.text,
                              ));
                      if(check){
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Account registered successfully!!"),backgroundColor: Colors.green,)
                        );
        
                        Navigator.pop(context);
                      }else{
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Failed to register account, try again"),backgroundColor: Colors.red,
                        ));
                      }
        
                      }
                    } else{
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Passwords doesn\'t match!!"), backgroundColor: Colors.orange,)
                      );
                    }
                  }else{
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Please fill all the required blanks!!"),backgroundColor: Colors.orange,)
                    );
                  }
        
                },
                  child: Text('Sign in',style: TextStyle(fontSize: 20,color: Colors.white),
                  ),style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff6574d3),
        
        
                  ),),
                mSpacer(mHeight: 10),
                InkWell(onTap: (){
                  Navigator.pop(context);
                },
                  child: Text('Already have an account',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.blue
                    ),),
                ),
                mSpacer(mHeight: 15),
                Text('Or continue with',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,color: Colors.blue
                  ),),
                SizedBox(height: 10,),
                Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 60,
                      height: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.red,
                              width: 1)
                      ),
                      child: Icon(Icons.g_mobiledata,size: 35, color: Colors.red,),
                    ),
                    SizedBox(width: 10,),
                    Container(
                      width: 60,
                      height: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.blue.shade700,
                              width: 1)
                      ),
                      child: Icon(Icons.facebook_outlined,color: Colors.blue.shade800,),
                    ),
                    SizedBox(width: 10,),
                    Container(
                      width: 60,
                      height: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.black.withOpacity(0.7))
                      ),
                      child: Icon(Icons.apple,color: Colors.black.withOpacity(0.6),),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
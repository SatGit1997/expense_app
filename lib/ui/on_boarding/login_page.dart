import 'package:expense_app/data/local/db_helper.dart';
import 'package:expense_app/domain/ui_helper.dart';
import 'package:expense_app/ui/bottom_navi_pages/home_page.dart';
import 'package:expense_app/ui/on_boarding/signup_page.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget{
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passController = TextEditingController();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(28.0),
        child: Column(
          children: [
            SizedBox(height: 10,),
            Text('Login here',
              style: TextStyle(fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff6574d3)),),

            Container(
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/Monetylogo_rbg.png")
                )
              ),
            ),
            // SizedBox(height: 10,),
            Text('Welcome back you\'ve',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 20
              ),),
            Text('been missed!',
                style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 20
            )),
            mSpacer(),
            TextField(
              decoration: mFieldDecor(
                  hint: "Enter registered email",
                  heading: "Email")
            ),
            mSpacer(mHeight: 20),
            TextField(
              decoration: mFieldDecor(hint: "Enter your registered pass!!", heading: "Password")
            ),
            mSpacer(mHeight: 20),
            Row(mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text('Forgot your password?',
                  style: TextStyle(color: Colors.blue),),
              ],
            ),
            mSpacer(mHeight: 20),
            ElevatedButton(
              onPressed: () async{

                DbHelper dbhelper = DbHelper.instance;

              if(emailController.text.isNotEmpty &&
                  passController.text.isNotEmpty) {

                if( await dbhelper.authenticateUser(
                    email: emailController.text,
                    pass: passController.text)){

                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage(),));
                }
                 else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Invalid credentials, longin again!!")));
                }
              } else{
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Please fill all the required blanks!!")));
              }
            },
              child: Text('Sign in',
                style: TextStyle(fontSize: 20,color: Colors.white),
              ),style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xff6574d3),

              ),),
            SizedBox(height: 40,),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('Don\'t have account?',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500
                  ),),
                InkWell(onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => SignupPage() ));
                },
                  child: Text('Create new account',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.blue
                    ),),
                ),
              ],
            ),

            SizedBox(height: 30,),
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
    );
  }
}
import 'package:expense_app/ui/on_boarding/signup_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'bottom_navigation_page.dart';
class LoginPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
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
            Text('been missed!',style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 20
            )),
            SizedBox(height: 10,),
            TextField(
              decoration: InputDecoration(
                  label: Text('Email'),
                  hintText: 'Enter a valid email here',
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(11),
                      borderSide: BorderSide(
                          color: Colors.blue
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
            SizedBox(height: 30,),
            TextField(
              decoration: InputDecoration(
                  label: Text('Password'),
                  hintText: 'Enter 8 Digit password here',
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(11),
                      borderSide: BorderSide(
                          color: Colors.blue
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
            Row(mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text('Forgot your password?',
                  style: TextStyle(color: Colors.blue),),
              ],
            ),
            SizedBox(height: 20,),
            SizedBox(width: 300,
              child: ElevatedButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> BottomNavigationPage()));

              },
                child: Text('Sign in',style: TextStyle(fontSize: 20,color: Colors.white),
                ),style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xff6574d3),

                ),),
            ),
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
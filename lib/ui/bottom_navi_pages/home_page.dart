import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget{
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(21.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// logo image
            Center(
              child: SizedBox(
                height: 40,
                  child: Image(image: AssetImage("assets/images/home_logo_gb.png"),)),
            ),

            SizedBox(height: 10,),

            /// profile bar
            Row(
              children: [
                Expanded(flex: 2,
                  child: CircleAvatar(
                    foregroundImage: AssetImage("assets/images/avitar_profile.jpg",),),
                ),
                SizedBox(width: 10,),
                Expanded(flex: 7,
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Morning"),
                      Text("Sateesh Chauhan",
                        style: TextStyle(
                          fontWeight: FontWeight.w600),)
                    ],
                  ),
                ),
                Expanded(flex: 7,
                  child:
                  /*Container(
                    width: 110,
                    height: 35,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: Color(0xffe6e9f8)
                    ),
                    child: Row(mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("This month"),
                        Icon(Icons.arrow_drop_down)
                      ],
                    ),
                  ),*/
                  OutlinedButton(
                    onPressed: (){},
                    child: Row(
                      children: [
                        Text('This Month',selectionColor: Colors.black,),
                        Icon(Icons.keyboard_arrow_down_rounded,color: Colors.black,),
                      ],
                    ),
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                      backgroundColor: Color(0xffe6e9f8),
                      side: BorderSide.none
                    ),
                  )
                )
              ],
            ),

            SizedBox(height: 10,),

            /// expanse total container
            Container(
              padding: EdgeInsets.all(16),
              width: double.infinity,
              height: 150,
              decoration: BoxDecoration(
                color: Color(0xff6574d3),
                borderRadius: BorderRadius.circular(11)
              ),
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("Expense total",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white
                      ),),
                      Text("\$3,734",
                        style: TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.w600,
                            color: Colors.white
                        ),),
                      Row(
                        children: [
                          Container(
                            height: 30,
                            width: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.redAccent
                            ),
                            child: Center(child: Text("+\$240",
                              style: TextStyle(
                                  color: Colors.white,
                                fontSize: 14
                              ),)),
                          ),
                          SizedBox(width: 8,),
                          Text("than last month",
                            style: TextStyle(
                            color: Colors.white.withOpacity(0.8),
                          ),)
                        ],
                      )

                    ],
                  ),
                  SizedBox(
                      width: 125,
                      child: Image(image: AssetImage("assets/images/expense_bg.png")))
                ],
              ),
            ),

            SizedBox(height: 10,),


            /// Expense list

            Text("Expense List",style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w600
            ),),

            /// Expense list using Listview

            Expanded(
              child: ListView(
                children: [
                  /// tuesday container
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(9),
                      border: Border.all(color: Colors.grey, width: 1)
                    ),
                    child: Column(
                      children: [
                        ListTile(
                          leading: Text("Tuesday, 14",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600
                            ),),
                          trailing: Text("-\$1380",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600
                            ),),
                        ),
                        Divider(
                          indent: 15,endIndent: 15,),
                        ListTile(
                          leading: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Color(0xffe6e9f8)
                            ),
                            child: Icon(Icons.shopping_cart_outlined,
                              color: Color(0xff6574d3),),
                          ),
                          title: Text('Shop',style: TextStyle(fontSize: 17,fontWeight: FontWeight.w500),),
                          subtitle: Text('Buy new clothes'),
                          trailing: Text('-\$90',
                            style: TextStyle(
                                fontSize: 15,
                                color: Color(0xffe78bbc)),),
                        ),
                        ListTile(
                          leading: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Color(0xfffaebd3)
                            ),
                            child: Icon(Icons.phone_iphone,
                              color: Colors.orangeAccent,),
                          ),
                          title: Text('Electronic',style: TextStyle(fontSize: 17,fontWeight: FontWeight.w500),),
                          subtitle: Text('Buy new iphone'),
                          trailing: Text('-\$1290',
                            style: TextStyle(
                                fontSize: 15,
                                color: Color(0xffe78bbc)),),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20,),

                  /// monday container
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(9),
                      border: Border.all(color: Colors.grey, width: 1)
                    ),
                    child: Column(
                      children: [
                        ListTile(
                          leading: Text("Monday, 13",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600
                            ),),
                          trailing: Text("-\$60",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600
                            ),),
                        ),
                        Divider(
                          indent: 15,endIndent: 15,),
                        ListTile(
                          leading: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Color(0xfffae6e7)
                            ),
                            child: Icon(Icons.shopping_cart_outlined,
                              color: Colors.redAccent,),
                          ),
                          title: Text('Transportation',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 17
                          ),),
                          subtitle: Text('Trip to Malang'),
                          trailing: Text('-\$60',
                            style: TextStyle(
                                fontSize: 15,
                                color: Color(0xffe78bbc)),),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),


            /*Container(
              padding: EdgeInsets.all(8),
              width: double.infinity,
              height: 190,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(11),

                border: Border(
                  top: BorderSide(width: 1.5,color: Colors.black12),
                  bottom: BorderSide(width: 1.5,color: Colors.black12),
                  left: BorderSide(width: 1.5,color: Colors.black12),
                  right: BorderSide(width: 1.5,color: Colors.black12),

                )
              ),
              child:
              Column(
                children: [
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Tuesday, 14",
                        style: TextStyle(
                        fontWeight: FontWeight.w600,
                          fontSize: 15
                      ),
                      ),
                      Text("-\$1380",

                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 15
                          )),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Container(
                    width: 320,
                    height: 1,
                    decoration: BoxDecoration(
                      color: Colors.black12
                    ),
                  ),
                  SizedBox(height: 10,),
                  Row(mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 50,
                        height: 50 ,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: Color(0xffe6e9f8)
                        ),
                        child: Icon(Icons.shopping_cart_outlined,color: Color(0xff6574d3),),
                      ),
                      SizedBox(width: 10,),
                      Expanded(flex: 12,
                        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Shop",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                )),
                            Text("Buy new clothes")
                          ],
                        ),
                      ),

                      Expanded(flex: 2,
                        child: Text("-\$90",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Color(0xffe78bbc)
                            )),
                      )
                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 50,
                        height: 50 ,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: Color(0xfffaebd3)
                        ),
                        child: Icon(Icons.phone_iphone_rounded,color: Colors.orangeAccent,),
                      ),
                      SizedBox(width: 10,),
                      Expanded(flex: 12,
                        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Electronic",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                )),
                            SizedBox(width: 10,),
                            Text("Buy new iphone 14")
                          ],
                        ),
                      ),
                      Expanded(flex: 3,
                        child: Text("-\$1290",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Color(0xffe78bbc)
                            )),
                      )
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 10,),
            Container(
              padding: EdgeInsets.all(8),
              width: double.infinity,
              height: 130,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(11),

                  border: Border(
                    top: BorderSide(width: 1.5,color: Colors.black12),
                    bottom: BorderSide(width: 1.5,color: Colors.black12),
                    left: BorderSide(width: 1.5,color: Colors.black12),
                    right: BorderSide(width: 1.5,color: Colors.black12),

                  )
              ),
              child:
              Column(
                children: [
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Monday, 13",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 15
                        ),
                      ),
                      Text("-\$60",

                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 15
                          )),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Container(
                    width: 320,
                    height: 2,
                    decoration: BoxDecoration(
                        color: Colors.black12
                    ),
                  ),
                  SizedBox(height: 10,),
                  Row(mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 50,
                        height: 50 ,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            color: Color(0xfffae6e7)
                        ),
                        child: Icon(Icons.local_taxi_rounded,color: Colors.redAccent,),
                      ),
                      SizedBox(width: 10,),
                      Expanded(flex: 6,
                        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Transportation",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                )),
                            Text("Trip to Malang")
                          ],
                        ),
                      ),
                      SizedBox(width: 110,),
                      Expanded(flex: 2,
                        child: Text("-\$60",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                                color: Color(0xffe78bbc)
                            )),
                      )
                    ],
                  ),


                ],
              ),
            ),*/
          ],
        ),
      ),

    );
  }
}
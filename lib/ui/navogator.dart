import 'package:flutter/material.dart';
import 'package:myapp/navigator/addtocart.dart';
import 'package:myapp/navigator/favorite.dart';
import 'package:myapp/navigator/homepage.dart';
import 'package:myapp/navigator/profile.dart';


 class Homewidget extends StatefulWidget {
   const Homewidget({ Key? key }) : super(key: key);
 
   @override
   _HomewidgetState createState() => _HomewidgetState();
 }
 
 class _HomewidgetState extends State<Homewidget> {
   @override
   var indexpage = 0;
   final Page = [
     Homepage(),
     Favoritewidget(),
     Addtocartwidget(),
     Profilewidget(),
   ];
   Widget build(BuildContext context) {
     return MaterialApp(
       debugShowCheckedModeBanner: false,
       home: Scaffold(
         appBar: AppBar(
           title:Text("E-Commerece"),

         ),
         bottomNavigationBar: BottomNavigationBar(
           type: BottomNavigationBarType.fixed,
           items: [
            
            BottomNavigationBarItem(icon: Icon(Icons.home),label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.favorite_border_outlined),label: "favorite"),
            BottomNavigationBarItem(icon: Icon(Icons.shopping_cart),label: "Cart"),
            BottomNavigationBarItem(icon: Icon(Icons.person),label: "Person"),
           ],
           onTap: (index){
             setState(() {
               indexpage = index;
             });
           },
           ),
       ),
       
     );
   }
 }
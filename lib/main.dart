import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Menu Program',
      home: Scaffold(
        backgroundColor: Colors.amber[100],
        appBar: AppBar(
          title: Text("The Food Menu"),
          backgroundColor: Colors.amberAccent,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FoodSection(titleName: "อาหารทั่วไป"),
            Container(
              padding: EdgeInsets.all(20),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  spacing: 30,
                  children: [
                    BoxMenu(
                      name: "พะโล้",
                      price: 20.00,
                      picture: "assets/menu1.jpg",
                    ),
                    BoxMenu(
                      name: "ไก่ทอด",
                      price: 80.00,
                      picture: "assets/menu2.jpg",
                    ),
                    BoxMenu(
                      name: "ไข่เจียว",
                      price: 20.00,
                      picture: "assets/menu3.jpg",
                    ),
                    BoxMenu(
                      name: "ไข่เจียว",
                      price: 20.00,
                      picture: "assets/menu3.jpg",
                    ),
                    BoxMenu(
                      name: "ไข่เจียว",
                      price: 20.00,
                      picture: "assets/menu3.jpg",
                    ),
                    BoxMenu(
                      name: "ไข่เจียว",
                      price: 20.00,
                      picture: "assets/menu3.jpg",
                    ),
                    BoxMenu(
                      name: "ไข่เจียว",
                      price: 20.00,
                      picture: "assets/menu3.jpg",
                    ),
                    BoxMenu(
                      name: "ไข่เจียว",
                      price: 20.00,
                      picture: "assets/menu3.jpg",
                    ),
                    BoxMenu(
                      name: "ไข่เจียว",
                      price: 20.00,
                      picture: "assets/menu3.jpg",
                    ),
                    BoxMenu(
                      name: "ไข่เจียว",
                      price: 20.00,
                      picture: "assets/menu3.jpg",
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FoodSection extends StatelessWidget {
  const FoodSection({super.key, required this.titleName});

  final String titleName;

  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(padding: const EdgeInsets.fromLTRB(20,50,0,0), child: Text(titleName,style:TextStyle(fontSize: 30,fontWeight: FontWeight.bold),)),
      ],
    );
  }
}

class BoxMenu extends StatelessWidget {
  const BoxMenu({
    super.key,
    required this.name,
    required this.price,
    required this.picture,
  });

  final String name;
  final double price;
  final String picture;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 230,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 200,
            height: 150,
            child: ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              child: Image(image: AssetImage(picture), fit: BoxFit.cover),
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
            child: Row(
              spacing: 70,
              children: [
                Column(
                  spacing: 12,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(name,style:TextStyle(fontWeight:FontWeight.bold,fontSize: 15)),
                    Row(
                      spacing: 5,
                      children: [
                      Text(price.toStringAsFixed(2),style: TextStyle(fontSize: 20),),
                      Text("฿",style: TextStyle(fontSize: 20),)
                    ],
                  )],
                ),
                Text("Buy"),
              
              ],
            ),
          ),
        ],
      ),
    );
  }
}

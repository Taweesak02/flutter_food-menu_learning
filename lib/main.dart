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
        backgroundColor: Colors.amber[300],
        appBar: AppBar(
          leading: Icon(Icons.menu_book_rounded),
          title: Text(
            "The Food Menu",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.white,
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MenuSection(
                name: "อาหารทั่วไป",
                menu: [
                  BoxMenu(
                    name: "พะโล้",
                    price: 30,
                    picture: "assets/common/menu1.jpg",
                  ),
                  BoxMenu(
                    name: "ไก่ทอด",
                    price: 50,
                    picture: "assets/common/menu2.jpg",
                  ),
                  BoxMenu(
                    name: "ไข่เจียว",
                    price: 20,
                    picture: "assets/common/menu3.jpg",
                  ),
                  BoxMenu(
                    name: "ผัดกะเพรา",
                    price: 30,
                    picture: "assets/common/menu4.jpg",
                  ),
                  BoxMenu(
                    name: "ข้าวผัด",
                    price: 40,
                    picture: "assets/common/menu5.jpg",
                  ),
                  BoxMenu(
                    name: "ผัดไท",
                    price: 35,
                    picture: "assets/common/menu6.jpg",
                  ),
                ],
              ),
              MenuSection(
                name: "ของหวาน",
                menu: [
                  BoxMenu(
                    name: "ไอศกรีม",
                    price: 20,
                    picture: "assets/dessert/menu1.jpg",
                  ),
                  BoxMenu(
                    name: "ข้าวเหนียวมะม่วง",
                    price: 35,
                    picture: "assets/dessert/menu2.jpg",
                  ),
                  BoxMenu(
                    name: "ปาท่องโก๋",
                    price: 20,
                    picture: "assets/dessert/menu3.jpg",
                  ),
                  BoxMenu(
                    name: "บราวนี",
                    price: 20,
                    picture: "assets/dessert/menu4.jpg",
                  ),
                ],
              ),
              MenuSection(
                name: "เครื่องดื่ม",
                menu: [
                  BoxMenu(
                    name: "น้ำเปล่า",
                    price: 10,
                    picture: "assets/drink/menu1.jpg",
                  ),
                  BoxMenu(
                    name: "โกโก้โอริโอ้ปั่น",
                    price: 35,
                    picture: "assets/drink/menu2.jpg",
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FoodSection extends StatelessWidget {
  const FoodSection({super.key, required this.titleName});

  final String titleName;

  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Text(
              titleName,
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
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
            padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    spacing: 12,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                      Row(
                        spacing: 5,
                        children: [
                          Text(
                            price.toStringAsFixed(2),
                            style: TextStyle(fontSize: 20),
                          ),
                          Text("฿", style: TextStyle(fontSize: 20)),
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(flex: 1, child: const BuyItem()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MenuSection extends StatelessWidget {
  const MenuSection({super.key, required this.name, required this.menu});

  final String name;
  final List<BoxMenu> menu;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FoodSection(titleName: name),
        Container(
          padding: EdgeInsets.all(20),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(spacing: 30, children: menu),
          ),
        ),
      ],
    );
  }
}

class BuyItem extends StatefulWidget {
  const BuyItem({super.key});

  @override
  State<BuyItem> createState() => _BuyItemState();
}

class _BuyItemState extends State<BuyItem> {
  bool _isbought = false;

  void _togglebought() {
    setState(() {
      if (_isbought) {
        _isbought = false;
      } else {
        _isbought = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: EdgeInsets.zero,
      icon:
          (_isbought
              ? Icon(color: Colors.green, Icons.add_box, size: 50)
              : Icon(Icons.add_box_outlined, size: 50)),
      onPressed: _togglebought,
    );
  }
}

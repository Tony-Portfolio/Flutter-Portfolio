import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';
import './profile_page.dart';
import './detail_page.dart';
import './store_page.dart';
import './cart_page.dart';
import './search_page.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  static const List<Widget> display = [
    StorePage(),
    SearchPage(),
    CartPage(),
    ProfilePage()
  ];
  int selected = 0;

  void onItemTapped(int index) {
    setState(() {
      selected = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(
          children: [
            Positioned.fill(
              child: display.elementAt(selected),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: EdgeInsets.fromLTRB(12, 0, 12, 0),
                color: Colors.white,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    LinkButtons(
                      text: 'Shop',
                      url: '/',
                      svg: 'assets/house-solid.svg',
                      active: selected == 0 ? 'true' : 'false',
                      onTap: () =>
                          onItemTapped(0), // Call onItemTapped with index 0
                    ),
                    LinkButtons(
                      text: 'Search',
                      url: '/',
                      svg: 'assets/magnifying-glass-solid.svg',
                      active: selected == 1 ? 'true' : 'false',
                      onTap: () =>
                          onItemTapped(1), // Call onItemTapped with index 1
                    ),
                    LinkButtons(
                      text: 'Cart',
                      url: '/',
                      svg: 'assets/basket-shopping-solid.svg',
                      active: selected == 2 ? 'true' : 'false',
                      onTap: () =>
                          onItemTapped(2), // Call onItemTapped with index 2
                    ),
                    LinkButtons(
                      text: 'Profile',
                      url: '/',
                      svg: 'assets/user-solid.svg',
                      active: selected == 3 ? 'true' : 'false',
                      onTap: () =>
                          onItemTapped(3), // Call onItemTapped with index 3
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

class LinkButtons extends StatelessWidget {
  final String text;
  final String url;
  final String svg;
  final String active;
  final VoidCallback onTap;

  const LinkButtons({
    Key? key,
    required this.text,
    required this.url,
    required this.svg,
    required this.active,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onTap, // Call the onTap callback
        child: Container(
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Container(
            margin: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    decoration: BoxDecoration(
                      color:
                          active == 'true' ? Color(0xFFF1F2F1) : Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(12, 6, 12, 6),
                      child: SvgPicture.asset(
                        svg,
                        height: 20,
                        width: 20,
                        color: active == 'true'
                            ? Colors.orange
                            : Color(0xFF5F5E5F),
                      ),
                    )),
                Container(
                  margin: const EdgeInsets.only(top: 6),
                  child: Text(
                    text,
                    style: TextStyle(
                      color: Color(0xFF5F5E5F),
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

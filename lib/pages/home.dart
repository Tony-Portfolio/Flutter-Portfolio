import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';
import './profile_page.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  static const List<Widget> display = [ProfilePage()];
  int selected = 0;

  @override
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          display.elementAt(selected),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
                padding: EdgeInsets.all(16),
                color: Colors.blue,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    LinkButtons(
                        text: 'Shop', url: '/', svg: 'assets/house-solid.svg'),
                    LinkButtons(
                        text: 'Search',
                        url: '/',
                        svg: 'assets/magnifying-glass-solid.svg'),
                    LinkButtons(
                        text: 'Cart',
                        url: '/',
                        svg: 'assets/basket-shopping-solid.svg'),
                    LinkButtons(
                        text: 'Profile',
                        url: '/',
                        svg: 'assets/user-solid.svg'),
                  ],
                )),
          ),
        ],
      ),
    ));
  }
}

class LinkButtons extends StatelessWidget {
  final String text;
  final String url;
  final String svg;

  const LinkButtons(
      {Key? key, required this.text, required this.url, required this.svg})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
          onTap: () async {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ProfilePage()),
            );
          },
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
                        SvgPicture.asset(
                          svg,
                          height: 20,
                          width: 20,
                          color: Color(0xFF5F5E5F),
                        ),
                        Container(
                            margin: const EdgeInsets.only(top: 8.5),
                            child: Text(text,
                                style: TextStyle(
                                  color: Color(0xFF5F5E5F),
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                ))),
                      ])))),
    );
  }
}

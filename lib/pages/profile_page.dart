import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Container(
          //   padding: EdgeInsets.all(12),
          //   child: ClipRRect(
          //     borderRadius:
          //         BorderRadius.circular(12.0), // Set the desired border radius
          //     child: Image.asset(
          //       'assets/profile.jpg',
          //       width: 120,
          //       height: 120,
          //       fit: BoxFit
          //           .cover, // You might want to adjust the BoxFit based on your requirements
          //     ),
          //   ),
          // ),
          Container(
            padding: EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Raka Ramadhan',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    )),
                Text('rakaoktoramadhan@gmail.com',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey)),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 16, 0, 16),
                  child: Text('Settings',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                  child: Text('Account'),
                ),
                Divider(
                  color: Color(0xFFF1F2F1),
                  thickness: 2,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                  child: Text('Shipping Address'),
                ),
                Divider(
                  color: Color(0xFFF1F2F1),
                  thickness: 2,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                  child: Text('Payment Methods'),
                ),
                Divider(
                  color: Color(0xFFF1F2F1),
                  thickness: 2,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                  child: Text('Preferences'),
                ),
                Divider(
                  color: Color(0xFFF1F2F1),
                  thickness: 2,
                ),
                Text('Sign Out'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

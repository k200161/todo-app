import 'package:flutter/material.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(
        'Hello Saad Bin Khalid,',
        style: TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.w500,
        ),
      ),
      shape: RoundedRectangleBorder(),
      subtitle: Text(
        'You have work today',
        style: TextStyle(
          fontSize: 15,
          color: Colors.black54,
        ),
      ),
      trailing: CircleAvatar(
        radius: 30,
        backgroundImage: AssetImage('assets/me.png'),
      ),
    );
  }
}

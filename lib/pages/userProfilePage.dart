import 'package:flutter/cupertino.dart';

class UserProfilePage extends StatelessWidget {
  const UserProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Text(
        'Your Profile',
        style: TextStyle(fontSize: 50),
      ),
    );
  }
}

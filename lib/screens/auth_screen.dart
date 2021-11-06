import 'package:flutter/material.dart';
import 'package:flutter_tomato_record_clone_coding/screens/start/address_page.dart';
import 'package:flutter_tomato_record_clone_coding/screens/start/intro_page.dart';

class AuthScreen extends StatelessWidget {
  AuthScreen({Key? key}) : super(key: key);

  final PageController _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _pageController,
        children: [
          IntroPage(_pageController),
          const AddressPage(),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_tomato_record_clone_coding/screens/start/address_page.dart';
import 'package:flutter_tomato_record_clone_coding/screens/start/auth_page.dart';
import 'package:flutter_tomato_record_clone_coding/screens/start/intro_page.dart';
import 'package:provider/provider.dart';

class StartScreen extends StatelessWidget {
  StartScreen({Key? key}) : super(key: key);

  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Provider<PageController>.value(
      value: _pageController,
      child: Scaffold(
        body: PageView(
          controller: _pageController,
          // physics: const NeverScrollableScrollPhysics(),
          children: const [
            IntroPage(),
            AddressPage(),
            AuthPage(),
          ],
        ),
      ),
    );
  }
}

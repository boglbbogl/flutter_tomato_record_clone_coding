import 'package:beamer/src/beamer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tomato_record_clone_coding/screens/home/items_page.dart';
import 'package:flutter_tomato_record_clone_coding/widgets/expandable_fab.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _bottomSelectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _bottomSelectedIndex,
        children: [
          const ItemsPage(),
          Container(color: Colors.accents[6]),
          Container(color: Colors.accents[9]),
          Container(color: Colors.accents[1]),
        ],
      ),
      floatingActionButton: ExpandableFab(distance: 90, children: [
        MaterialButton(
          onPressed: () {
            context.beamToNamed('/input');
          },
          shape: CircleBorder(),
          height: 36,
          color: Theme.of(context).colorScheme.primary,
          child: Icon(Icons.add),
        ),
        MaterialButton(
          onPressed: () {},
          shape: CircleBorder(),
          height: 36,
          color: Theme.of(context).colorScheme.primary,
          child: Icon(Icons.add),
        ),
        MaterialButton(
          onPressed: () {},
          shape: CircleBorder(),
          height: 36,
          color: Theme.of(context).colorScheme.primary,
          child: Icon(Icons.add),
        ),
      ]),
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          '서초동',
          style: Theme.of(context).textTheme.headline5,
        ),
        actions: [
          IconButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
              },
              icon: const Icon(Icons.search_outlined)),
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.format_align_justify_outlined)),
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.notifications_none_outlined)),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _bottomSelectedIndex,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              icon: Icon(_bottomSelectedIndex == 0
                  ? Icons.home_filled
                  : Icons.home_outlined),
              label: '홈'),
          BottomNavigationBarItem(
              icon: Icon(_bottomSelectedIndex == 1
                  ? Icons.location_on
                  : Icons.location_on_outlined),
              label: '내 근처'),
          BottomNavigationBarItem(
              icon: Icon(_bottomSelectedIndex == 2
                  ? Icons.chat_bubble
                  : Icons.chat_bubble_outline_rounded),
              label: '채팅'),
          BottomNavigationBarItem(
              icon: Icon(_bottomSelectedIndex == 3
                  ? Icons.account_circle
                  : Icons.account_circle_outlined),
              label: '내정보'),
        ],
        onTap: (index) {
          setState(() {
            _bottomSelectedIndex = index;
          });
        },
      ),
    );
  }
}

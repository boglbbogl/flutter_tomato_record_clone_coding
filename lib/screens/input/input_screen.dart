import 'package:beamer/src/beamer.dart';
import 'package:flutter/material.dart';

class InputScreen extends StatefulWidget {
  const InputScreen({Key? key}) : super(key: key);

  @override
  State<InputScreen> createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          '중고거래 글쓰기',
          style: Theme.of(context).textTheme.headline6,
        ),
        leading: TextButton(
          style: TextButton.styleFrom(
            backgroundColor: Colors.white,
          ),
          onPressed: () {
            context.beamBack();
          },
          child: Text('닫기', style: Theme.of(context).textTheme.bodyText2),
        ),
        actions: [
          TextButton(
            style: TextButton.styleFrom(
              backgroundColor: Colors.white,
            ),
            onPressed: () {},
            child: Text('완료', style: Theme.of(context).textTheme.bodyText2),
          ),
        ],
      ),
    );
  }
}

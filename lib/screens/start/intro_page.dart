import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';

class IntroPage extends StatelessWidget {
  PageController controller;

  IntroPage(this.controller, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      Size size = MediaQuery.of(context).size;
      final sizeOfPosImg = (size.width - 32) * 0.1;
      final imageSzie = size.width - 32;
      return SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text(
                '토마토마켓',
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.red,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: imageSzie,
                height: imageSzie,
                child: Stack(
                  children: [
                    ExtendedImage.asset('assets/imgs/carrot_intro.png'),
                    Positioned(
                        width: sizeOfPosImg,
                        left: imageSzie * 0.45,
                        height: sizeOfPosImg,
                        top: imageSzie * 0.45,
                        child: ExtendedImage.asset(
                            'assets/imgs/carrot_intro_pos.png')),
                  ],
                ),
              ),
              const Text(
                '우리 동네 중고 직거래 토마토마켓',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const Text(
                '토마토마켓은 동네 직거래 마켓이에요.\n내 동네를 성정하고 시작해보세요.',
                style: TextStyle(fontSize: 16),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextButton(
                    onPressed: () {
                      controller.animateToPage(1,
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.ease);
                    },
                    child: const Text(
                      '내 동네 설정하고 시작하기',
                      style: TextStyle(color: Colors.white),
                    ),
                    style: TextButton.styleFrom(backgroundColor: Colors.red),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    });
  }
}

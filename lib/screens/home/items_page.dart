import 'package:extended_image/extended_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tomato_record_clone_coding/constant/common_size.dart';

class ItemsPage extends StatelessWidget {
  const ItemsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      Size size = MediaQuery.of(context).size;

      final imgSize = size.width / 4;
      return ListView.separated(
        padding: const EdgeInsets.all(common_padding),
        itemCount: 10,
        itemBuilder: (context, index) {
          return SizedBox(
            height: imgSize,
            child: Row(
              children: [
                SizedBox(
                    width: imgSize,
                    height: imgSize,
                    child: ExtendedImage.network(
                      'https://picsum.photos/100',
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(12),
                    )),
                const SizedBox(width: common_sm_padding),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'work',
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                      Text(
                        '53일전',
                        style: Theme.of(context).textTheme.subtitle2,
                      ),
                      const Text('5,000원'),
                      Expanded(child: Container()),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SizedBox(
                            height: 18,
                            child: FittedBox(
                              fit: BoxFit.fitHeight,
                              child: Row(
                                children: const [
                                  Icon(CupertinoIcons.chat_bubble_2,
                                      color: Colors.grey),
                                  Text(
                                    '23',
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                  Icon(CupertinoIcons.heart,
                                      color: Colors.grey),
                                  Text(
                                    '5',
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
        separatorBuilder: (context, index) {
          return Divider(
            height: common_padding * 2,
            thickness: 1,
            color: Colors.grey.shade200,
            indent: common_sm_padding,
            endIndent: common_sm_padding,
          );
        },
      );
    });
  }
}

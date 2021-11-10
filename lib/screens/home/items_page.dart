import 'package:extended_image/extended_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tomato_record_clone_coding/constant/common_size.dart';
import 'package:shimmer/shimmer.dart';

class ItemsPage extends StatelessWidget {
  const ItemsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      Size size = MediaQuery.of(context).size;

      final imgSize = size.width / 4;
      // return _listView(imgSize);
      return FutureBuilder(
          future: Future.delayed(const Duration(milliseconds: 3000)),
          builder: (context, snapshot) {
            return AnimatedSwitcher(
                duration: const Duration(milliseconds: 1000),
                child: snapshot.connectionState == ConnectionState.done
                    ? _listView(imgSize)
                    : _shimmerListView(imgSize));
          });
    });
  }

  ListView _listView(double imgSize) {
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
                                Icon(CupertinoIcons.heart, color: Colors.grey),
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
  }

  Shimmer _shimmerListView(double imgSize) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: ListView.separated(
        padding: const EdgeInsets.all(common_padding),
        itemCount: 10,
        itemBuilder: (context, index) {
          return SizedBox(
            height: imgSize,
            child: Row(
              children: [
                Container(
                  width: imgSize,
                  height: imgSize,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                const SizedBox(width: common_sm_padding),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 16,
                        width: 150,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Container(
                        height: 16,
                        width: 130,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Container(
                        height: 16,
                        width: 80,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      Expanded(child: Container()),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            height: 14,
                            width: 80,
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
      ),
    );
  }
}

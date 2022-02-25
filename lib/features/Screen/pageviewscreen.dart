import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:golden_cleaver/core/utils/light_theme_colors.dart';
import 'package:golden_cleaver/features/Screen/onborder/onborder1.dart';
import 'package:golden_cleaver/features/Screen/onborder/onborder3.dart';

import 'onborder/onborder2.dart';

class PageViewScreen extends StatefulWidget {
  const PageViewScreen({Key? key}) : super(key: key);

  @override
  _PageViewScreenState createState() => _PageViewScreenState();

}

class _PageViewScreenState extends State<PageViewScreen> {
  int _currentIndex=0;
  @override
  Widget build(BuildContext context) {
    int num1;
    final PageController controller = PageController(initialPage: 0);
    return PageView(
      onPageChanged: (val){
        setState(() {
          _currentIndex=val;
        });
      },
      /// [PageView.scrollDirection] defaults to [Axis.horizontal].
      /// Use [Axis.vertical] to scroll vertically.
      scrollDirection: Axis.horizontal,
      controller: controller,
      children: <Widget>[
        OnBorder1(_currentIndex),
        OnBorder2(_currentIndex),
        OnBorder3(_currentIndex),
      ],

    );
  }
}

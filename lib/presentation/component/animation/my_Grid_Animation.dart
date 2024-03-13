import 'package:flutter/cupertino.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:islamic_app/core/extensions/num_extensions.dart';

class MyGridAnimation extends StatefulWidget {

  final int crossAxisCount;
  final double? childAspectRatio;
  final double? crossAxisSpacing;
  final double? mainAxisSpacing;
  final int itemCount;
  final Widget child;

  const MyGridAnimation({Key? key,
    required this.crossAxisCount, this.childAspectRatio, this.crossAxisSpacing, this.mainAxisSpacing, required this.itemCount, required this.child
  }) : super(key: key);
  @override
  _MyGridAnimationState createState() => _MyGridAnimationState();
}

class _MyGridAnimationState extends State<MyGridAnimation> {
  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
      child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: widget.crossAxisCount,
            childAspectRatio: widget.childAspectRatio??.729,
            crossAxisSpacing:widget.crossAxisSpacing?? 0.h,
            mainAxisSpacing: widget.mainAxisSpacing??0.h,
          ),
          itemCount: widget.itemCount,
          itemBuilder: (context, index) {
            return AnimationConfiguration.staggeredGrid(
                duration: Duration(milliseconds: 900),
                position: index,
                columnCount: widget.crossAxisCount??2,
                child: ScaleAnimation(
                    duration: Duration(milliseconds: 1000),
                    curve: Curves.fastLinearToSlowEaseIn,
                    child: FadeInAnimation(child: widget.child)));
          }),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import '../../../../core/resources/values_manager.dart';
import '../component.dart';


class ColumnAnimator extends StatefulWidget {
  final List<Widget>? children;
  final ScrollPhysics? physics;
  final CrossAxisAlignment? crossAxisAlignment;
  final MainAxisAlignment? mainAxisAlignment;
  final MainAxisSize? mainAxisSize;

  const ColumnAnimator({
    Key? key,
    this.children, this.physics, this.crossAxisAlignment, this.mainAxisAlignment, this.mainAxisSize,
  }) : super(key: key);

  @override
  _ColumnAnimatorState createState() => _ColumnAnimatorState();
}

class _ColumnAnimatorState extends State<ColumnAnimator> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height:deviceHeight,
      child: AnimationConfiguration.synchronized(
        child: SlideAnimation(
          verticalOffset: 50.0,
          child: AnimationLimiter(
            child: SingleChildScrollView(physics:widget.physics,
              child: Column(crossAxisAlignment:widget.crossAxisAlignment??CrossAxisAlignment.center,
                mainAxisAlignment:widget.mainAxisAlignment??MainAxisAlignment.start,
                mainAxisSize: widget.mainAxisSize??MainAxisSize.max,
                children:  List.generate(
                  (widget.children??[] ).length,
                      (index) =>Column(
                        children: [
                          const VerticalSpace( kFormPaddingVertical),
                          widget.children![index]
                        ],
                      )
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

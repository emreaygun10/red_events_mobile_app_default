import 'package:custom_sliding_segmented_control/custom_sliding_segmented_control.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SegmentControlWidget<T> extends StatelessWidget {
  const SegmentControlWidget({
    super.key,
    required this.childeren,
    required this.initiaValue,
    required this.onChange,
     this.width,
  });
  final Map<T, Widget> childeren;
  final T initiaValue;
  final void Function(T) onChange;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return CustomSlidingSegmentedControl<T>(
      innerPadding: const EdgeInsets.all(5),
      fixedWidth: width,
      initialValue: initiaValue,
      children: childeren,
      decoration: BoxDecoration(
        color:const Color(0xFFFAFAFA),
        borderRadius: BorderRadius.circular(8),
      ),
      thumbDecoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.3),
            blurRadius:3.0,
            spreadRadius: 1.0,
            offset: const Offset(
              0.0,
              1.0,
            ),
          ),
        ],
      ),
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeInToLinear,
      onValueChanged: onChange,
    );
  }
}

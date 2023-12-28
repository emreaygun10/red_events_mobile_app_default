import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gen/gen.dart';

///  Display Custom Linear Gradient on top screen
class BuildTopLinearGradient extends StatelessWidget {
  const BuildTopLinearGradient({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 260.h,
      decoration: BoxDecoration(
        color: Colors.white,
        gradient: LinearGradient(
          begin: FractionalOffset.topCenter,
          end: FractionalOffset.bottomCenter,
          colors: [
            ColorName.blueBase,
            ColorName.blueLight.withOpacity(0),
          ],
          stops: const [
            0.2,
            1.0,
          ],
        ),
      ),
    );
  }
}

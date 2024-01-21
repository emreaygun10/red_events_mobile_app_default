import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gen/src/asset/assets.gen.dart';

extension SvgExtension on SvgGenImage {
  SvgPicture toGetSvg() => this.svg(package: 'gen');

  SvgPicture toGetSvgWithColor({
    required Color color,
    double? height,
    double? width,
  }) =>
      this.svg(
        package: 'gen',
        colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
        height: height,
        width: width,
      );
}

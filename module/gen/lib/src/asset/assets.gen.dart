/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';

class $AssetsColorGen {
  const $AssetsColorGen();

  /// File path: assets/color/colors.xml
  String get colors => 'assets/color/colors.xml';

  /// List of all assets
  List<String> get values => [colors];
}

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/ic_arrow_left_line.svg
  SvgGenImage get icArrowLeftLine =>
      const SvgGenImage('assets/icons/ic_arrow_left_line.svg');

  /// File path: assets/icons/ic_arrow_right.svg
  SvgGenImage get icArrowRight =>
      const SvgGenImage('assets/icons/ic_arrow_right.svg');

  /// File path: assets/icons/ic_building.svg
  SvgGenImage get icBuilding =>
      const SvgGenImage('assets/icons/ic_building.svg');

  /// File path: assets/icons/ic_camera.svg
  SvgGenImage get icCamera => const SvgGenImage('assets/icons/ic_camera.svg');

  /// File path: assets/icons/ic_check_line.svg
  SvgGenImage get icCheckLine =>
      const SvgGenImage('assets/icons/ic_check_line.svg');

  /// File path: assets/icons/ic_close_circle.svg
  SvgGenImage get icCloseCircle =>
      const SvgGenImage('assets/icons/ic_close_circle.svg');

  /// File path: assets/icons/ic_eye.svg
  SvgGenImage get icEye => const SvgGenImage('assets/icons/ic_eye.svg');

  /// File path: assets/icons/ic_eye_off.svg
  SvgGenImage get icEyeOff => const SvgGenImage('assets/icons/ic_eye_off.svg');

  /// File path: assets/icons/ic_folder_open.svg
  SvgGenImage get icFolderOpen =>
      const SvgGenImage('assets/icons/ic_folder_open.svg');

  /// File path: assets/icons/ic_lock.svg
  SvgGenImage get icLock => const SvgGenImage('assets/icons/ic_lock.svg');

  /// File path: assets/icons/ic_logo_blue.svg
  SvgGenImage get icLogoBlue =>
      const SvgGenImage('assets/icons/ic_logo_blue.svg');

  /// File path: assets/icons/ic_logo_dark.svg
  SvgGenImage get icLogoDark =>
      const SvgGenImage('assets/icons/ic_logo_dark.svg');

  /// File path: assets/icons/ic_mail.svg
  SvgGenImage get icMail => const SvgGenImage('assets/icons/ic_mail.svg');

  /// File path: assets/icons/ic_page.svg
  SvgGenImage get icPage => const SvgGenImage('assets/icons/ic_page.svg');

  /// File path: assets/icons/ic_pick_person.svg
  SvgGenImage get icPickPerson =>
      const SvgGenImage('assets/icons/ic_pick_person.svg');

  /// File path: assets/icons/ic_select_box_circle.svg
  SvgGenImage get icSelectBoxCircle =>
      const SvgGenImage('assets/icons/ic_select_box_circle.svg');

  /// File path: assets/icons/ic_todo.svg
  SvgGenImage get icTodo => const SvgGenImage('assets/icons/ic_todo.svg');

  /// List of all assets
  List<SvgGenImage> get values => [
        icArrowLeftLine,
        icArrowRight,
        icBuilding,
        icCamera,
        icCheckLine,
        icCloseCircle,
        icEye,
        icEyeOff,
        icFolderOpen,
        icLock,
        icLogoBlue,
        icLogoDark,
        icMail,
        icPage,
        icPickPerson,
        icSelectBoxCircle,
        icTodo
      ];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/img_flags.png
  AssetGenImage get imgFlags =>
      const AssetGenImage('assets/images/img_flags.png');

  /// File path: assets/images/onboard_one.png
  AssetGenImage get onboardOne =>
      const AssetGenImage('assets/images/onboard_one.png');

  /// File path: assets/images/onboard_three.png
  AssetGenImage get onboardThree =>
      const AssetGenImage('assets/images/onboard_three.png');

  /// File path: assets/images/onboard_two.png
  AssetGenImage get onboardTwo =>
      const AssetGenImage('assets/images/onboard_two.png');

  /// List of all assets
  List<AssetGenImage> get values =>
      [imgFlags, onboardOne, onboardThree, onboardTwo];
}

class $AssetsLottieGen {
  const $AssetsLottieGen();

  /// File path: assets/lottie/anim_zombie.json
  LottieGenImage get animZombie =>
      const LottieGenImage('assets/lottie/anim_zombie.json');

  /// List of all assets
  List<LottieGenImage> get values => [animZombie];
}

class Assets {
  Assets._();

  static const $AssetsColorGen color = $AssetsColorGen();
  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsLottieGen lottie = $AssetsLottieGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class SvgGenImage {
  const SvgGenImage(this._assetName);

  final String _assetName;

  SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    SvgTheme theme = const SvgTheme(),
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    return SvgPicture.asset(
      _assetName,
      key: key,
      matchTextDirection: matchTextDirection,
      bundle: bundle,
      package: package,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      theme: theme,
      colorFilter: colorFilter,
      color: color,
      colorBlendMode: colorBlendMode,
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class LottieGenImage {
  const LottieGenImage(this._assetName);

  final String _assetName;

  LottieBuilder lottie({
    Animation<double>? controller,
    bool? animate,
    FrameRate? frameRate,
    bool? repeat,
    bool? reverse,
    LottieDelegates? delegates,
    LottieOptions? options,
    void Function(LottieComposition)? onLoaded,
    LottieImageProviderFactory? imageProviderFactory,
    Key? key,
    AssetBundle? bundle,
    Widget Function(BuildContext, Widget, LottieComposition?)? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    double? width,
    double? height,
    BoxFit? fit,
    AlignmentGeometry? alignment,
    String? package,
    bool? addRepaintBoundary,
    FilterQuality? filterQuality,
    void Function(String)? onWarning,
  }) {
    return Lottie.asset(
      _assetName,
      controller: controller,
      animate: animate,
      frameRate: frameRate,
      repeat: repeat,
      reverse: reverse,
      delegates: delegates,
      options: options,
      onLoaded: onLoaded,
      imageProviderFactory: imageProviderFactory,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      package: package,
      addRepaintBoundary: addRepaintBoundary,
      filterQuality: filterQuality,
      onWarning: onWarning,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

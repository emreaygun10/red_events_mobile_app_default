import 'package:cached_network_image/cached_network_image.dart';
import 'package:common/src/package/custom_image/custom_mem_cache.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// It will provide to image caching and image loading from network

final class CustomProfileNetworkNetworkImage extends StatelessWidget {
  /// The line `const CustomNetworkImage({super.key});` is defining a
  /// constructor
  /// for the `CustomNetworkImage` class.
  const CustomProfileNetworkNetworkImage({
    super.key,
    this.imageUrl,
    this.emptyWidget,
    this.memCache = const CustomMemCache(height: 200, width: 200),
    this.boxFit = BoxFit.cover,
    this.loadingWidget,
    this.size,
    this.errorListener,
    this.topLeft,
    this.topRight,
  });

  ///  Image source address
  final String? imageUrl;

  /// When image is not available then it will show empty widget
  final Widget? emptyWidget;

  /// When image is loading then it will show loading widget
  final Widget? loadingWidget;

  /// Default value is [CustomMemCache(height: 200, width: 200)]
  final CustomMemCache memCache;

  /// Default value is [BoxFit.cover]
  final BoxFit boxFit;

  /// Image size
  final Size? size;

  /// Error listener func
  final Future<void>? errorListener;

  /// Radius Top Left
  final Radius? topLeft;
  /// Radius Top Right
  final Radius? topRight;

  @override
  Widget build(BuildContext context) {
    final url = imageUrl;
    if (url == null || url.isEmpty) return emptyWidget ?? const SizedBox();
    return CachedNetworkImage(
      imageUrl: url,
      memCacheHeight: memCache.height,
      memCacheWidth: memCache.width,
      width: size?.width,
      height: size?.height,
      imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: topLeft ?? Radius.zero ,
            topRight: topRight ?? Radius.zero,
          ),
          image: DecorationImage(
            image: imageProvider,
            fit: boxFit,
          ),
        ),
      ),
      errorListener: (value) async {
        await errorListener;
        if (kDebugMode) debugPrint('Error: $value');
      },
      progressIndicatorBuilder: (context, url, progress) {
        return loadingWidget ??
            const Center(
              child: CircularProgressIndicator(),
            );
      },
      errorWidget: (context, url, error) {
        return emptyWidget ?? const SizedBox();
      },
    );
  }
}

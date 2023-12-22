import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:gen/gen.dart';

/// Network image with [Lottie] Loading
final class ProjectNetworkImage extends StatelessWidget {
  /// Custom Project Network Image
  const ProjectNetworkImage({required this.url, super.key});

  /// network url
  final String? url;
  @override
  Widget build(BuildContext context) {
    return CustomNetworkImage(
      imageUrl: url,
      loadingWidget: Assets.lottie.animZombie.lottie(),
    );
  }
}

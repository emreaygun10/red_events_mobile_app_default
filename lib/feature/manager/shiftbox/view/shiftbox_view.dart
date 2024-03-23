import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:gen/gen.dart';

part 'widgets/custom_app_bar.dart';

@RoutePage()
class ShiftBoxView extends StatefulWidget {
  const ShiftBoxView({super.key});

  @override
  State<ShiftBoxView> createState() => _ShiftBoxViewState();
}

class _ShiftBoxViewState extends State<ShiftBoxView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [ColorName.blueLight, ColorName.neutral100],
            stops: [0, 0.5],
          ),
        ),
        child: const Center(child: Text('GeeksforGeeks')),
      ),
    );
  }
}

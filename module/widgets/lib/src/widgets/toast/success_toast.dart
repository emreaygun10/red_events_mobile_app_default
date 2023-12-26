import 'package:flutter/material.dart';

class SuccessToast extends StatelessWidget {
  const SuccessToast({required this.message, super.key});

  /// Toast Message
  final String message;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Colors.greenAccent,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.check),
          const SizedBox(
            width: 12,
          ),
          Text(message),
        ],
      ),
    );
  }
}

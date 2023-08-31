import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Shimmer.fromColors(
        baseColor: Colors.purple,
        highlightColor: Colors.deepOrange,
        child: const Icon(
          Icons.flutter_dash_rounded,
          size: 120.0,
        ),
      ),
    );
  }
}

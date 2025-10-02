import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

import "../widgets/moving_cloud.dart";

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenHeight = MediaQuery.of(context).size.height;

    final clouds = [
      MovingCloud(top: screenHeight * 0, size: 300, duration: const Duration(seconds: 2), delay: const Duration(seconds: 10), opacity: 0.9, direction: CloudDirection.leftToRight),
      MovingCloud(top: screenHeight * 0.25, size: 80, duration: const Duration(seconds: 18), delay: const Duration(seconds: 2), opacity: 0.6, direction: CloudDirection.rightToLeft),
      MovingCloud(top: screenHeight * 0.45, size: 140, duration: const Duration(seconds: 20), delay: const Duration(seconds: 4), opacity: 0.8, direction: CloudDirection.leftToRight),
      MovingCloud(top: screenHeight * 0.65, size: 200, duration: const Duration(seconds: 12), delay: const Duration(seconds: 1), opacity: 0.5, direction: CloudDirection.rightToLeft),
      MovingCloud(top: screenHeight * 0.90, size: 250, duration: const Duration(seconds: 16), delay: const Duration(seconds: 3), opacity: 1, direction: CloudDirection.leftToRight),
    ];

    return Scaffold(
      backgroundColor: Color(0xFFA1D9FF),
      body: Stack(
        children: [
          ...clouds,

          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  "Hello, Little Minds!",
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    shadows: [Shadow(color: Colors.black26, offset: Offset(2, 2), blurRadius: 4)],
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurpleAccent,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  onPressed: () {},
                  child: const Text("Start Quiz"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

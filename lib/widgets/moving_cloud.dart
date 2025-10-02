import "package:flutter/material.dart";

enum CloudDirection { leftToRight, rightToLeft }

class MovingCloud extends StatefulWidget {
  final double top;
  final double size;
  final Duration duration;
  final Duration delay;
  final double opacity;
  final CloudDirection direction;

  const MovingCloud({super.key, required this.top, required this.size, required this.duration, required this.delay, required this.opacity, required this.direction});

  @override
  State<MovingCloud> createState() => _MovingCloudState();
}

class _MovingCloudState extends State<MovingCloud> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  Animation<double>? _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this, duration: widget.duration);

    // delay ekleyelim ki bulutlar aynı anda başlamasın
    Future.delayed(widget.delay, () {
      if (mounted) {
        _controller.repeat();
      }
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final screenWidth = MediaQuery.of(context).size.width;

    if (widget.direction == CloudDirection.leftToRight) {
      _animation = Tween<double>(begin: -widget.size, end: screenWidth).animate(_controller);
    } else {
      _animation = Tween<double>(begin: screenWidth, end: -widget.size).animate(_controller);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_animation == null) return const SizedBox.shrink();

    return AnimatedBuilder(
      animation: _controller,
      builder: (_, child) {
        return Positioned(
          top: widget.top,
          left: _animation!.value,
          child: Opacity(opacity: widget.opacity, child: child!),
        );
      },
      child: Image.asset("assets/abn.png", width: widget.size),
    );
  }
}

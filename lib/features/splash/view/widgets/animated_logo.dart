import 'package:flutter/material.dart';

import '../../../../core/utils/app_images.dart';

class AnimatedLogo extends StatelessWidget {
  const AnimatedLogo({
    super.key,
    required AnimationController controller,
    required Animation<double> fadeAnimation,
    required Animation<double> scaleAnimation,
  })  : _controller = controller,
        _fadeAnimation = fadeAnimation,
        _scaleAnimation = scaleAnimation;

  final AnimationController _controller;
  final Animation<double> _fadeAnimation;
  final Animation<double> _scaleAnimation;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Opacity(
              opacity: _fadeAnimation.value,
              child: Transform.scale(
                scale: _scaleAnimation.value,
                child: child,
              ),
            );
          },
          child: Image.asset(
            Assets.assetsImagesLogo,
            height: 150,
          )),
    );
  }
}

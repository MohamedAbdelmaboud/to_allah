import 'package:flutter/material.dart';
import 'package:to_allah/core/utils/app_images.dart';

class LoginLogo extends StatelessWidget {
  const LoginLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      Assets.assetsImagesLogo,
      height: 100,
    );
  }
}

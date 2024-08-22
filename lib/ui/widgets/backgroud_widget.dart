import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../utility/asset_path.dart';

class BackgroudWidget extends StatelessWidget {
  const BackgroudWidget({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SvgPicture.asset(
          height: double.maxFinite,
          width: double.maxFinite,
          AssetPath.backgroundSvg,
          fit: BoxFit.fill,
        ),
        child
      ],
    );
  }
}

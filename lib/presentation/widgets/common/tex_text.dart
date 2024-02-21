import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tex/tex.dart';

class TexText extends StatelessWidget {
  const TexText({super.key, required this.tex});

  final String tex;

  @override
  Widget build(BuildContext context) {
    final texhelper = TeX();
    final svg = texhelper.tex2svg(tex);
    return texhelper.success()
        ? SvgPicture.string(
            svg,
            fit: BoxFit.contain,
            colorFilter: const ColorFilter.mode(Colors.black, BlendMode.srcIn),
            // ColorFilter.mode(
            //     Theme.of(context).scaffoldBackgroundColor.computeLuminance() >
            //             0.5
            //         ? Colors.black
            //         : Colors.white,
            //     BlendMode.srcIn),
          )
        : const CircularProgressIndicator();
  }
}

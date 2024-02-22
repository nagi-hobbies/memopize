import 'package:flutter/material.dart';

enum ConstsCategory {
  mathematical,
  physical,
}

extension CategoryName on ConstsCategory {
  String get name => switch (this) {
        ConstsCategory.mathematical => 'math',
        ConstsCategory.physical => 'physics',
      };
}

extension CategoryColor on ConstsCategory {
  Color get color => switch (this) {
        ConstsCategory.mathematical => Colors.green,
        ConstsCategory.physical => Colors.purple,
      };
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:memopize/application/state/s_display_const_data_list.dart';
import 'package:memopize/application/state/s_game_session.dart';
import 'package:memopize/application/state/s_score.dart';
import 'package:memopize/presentation/widgets/memorizing_page/animated_list_view.dart';
import 'package:memopize/presentation/widgets/memorizing_page/top_bar.dart';
import 'package:memopize/presentation/widgets/strict_button_panel.dart';
import 'package:memopize/presentation/widgets/tex_text.dart';

class MemorizingPage extends ConsumerWidget {
  const MemorizingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gameSession = ref.watch(sGameSessionNotifierProvider);
    final score = ref.watch(sScoreNotifierProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('memorizing page'),
      ),
      backgroundColor: const Color(0xfff9fafe),
      body: Column(
        children: [
          TopBar(displayConstData: gameSession.displayConstData, score: score),
          Padding(
            padding: EdgeInsets.all(8.0.w),
            child: AnimatedListView(),
          ),
          Expanded(child: StrictButtonPanel())
        ],
      ),
    );
  }
}

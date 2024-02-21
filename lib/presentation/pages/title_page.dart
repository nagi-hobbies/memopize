import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:memopize/application/state/s_display_const_data_list.dart';
import 'package:memopize/domain/types/display_const_data.dart';
import 'package:memopize/infrastructure/sqlite/const_data_db_helper.dart';
import 'package:memopize/presentation/router/go_router.dart';
import 'package:memopize/presentation/router/page_path.dart';
import 'package:memopize/presentation/widgets/common/logo.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TitlePage extends HookConsumerWidget {
  const TitlePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final prefs = await SharedPreferences.getInstance();
      final lang = prefs.getString('lang') ?? 'Ja';
      Future<List<DisplayConstData>> displayConstDataList =
          ConstValueDBHelper.getAllDisplayConstData(lang);
      final sDisplayConstDataListNotifier =
          ref.read(sDisplayConstDataListNotifierProvider.notifier);
      displayConstDataList.then((value) {
        sDisplayConstDataListNotifier.set(value);
      });
    });
    return Scaffold(
      backgroundColor: const Color(0xff395886),
      body: InkWell(
        onTap: () {
          final router = ref.read(goRouterProvider);
          router.goNamed(
            PageId.collection.routeName,
          );
        },
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Container(
                    alignment: Alignment.bottomCenter,
                    width: double.infinity,
                    child: FittedBox(
                      fit: BoxFit.contain,
                      child: Padding(
                        padding: EdgeInsets.all(8.0.w),
                        child: const Logo(
                          height: 80,
                        ),
                      ),
                    )),
              ),
              Expanded(
                child: Center(
                  child: AnimatedTextKit(repeatForever: true, animatedTexts: [
                    TyperAnimatedText(
                      'Tap to start',
                      textStyle: const TextStyle(color: Colors.white, fontSize: 30),
                      speed: const Duration(milliseconds: 100),
                      curve: Curves.easeInOutCubic,
                      textAlign: TextAlign.center,
                    ),
                  ]),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

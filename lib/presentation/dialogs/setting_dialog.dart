import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:memopize/presentation/router/go_router.dart';
import 'package:memopize/presentation/router/page_path.dart';
import 'package:memopize/presentation/widgets/privacy_policy_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingDialog extends HookConsumerWidget {
  const SettingDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final language = useState('Ja');
    final rowLength = useState(10);
    final wheatherRevert = useState(true);

    final future = useMemoized(SharedPreferences.getInstance);
    final snapshot = useFuture(future, initialData: null);

    // initial value
    useEffect(() {
      final prefs = snapshot.data;
      if (prefs != null) {
        debugPrint('prefs: $prefs');
        final lang = prefs.getString('lang') ?? 'Ja';
        final rowL = prefs.getInt('rowLength') ?? 10;
        final wheatherR = prefs.getBool('wheatherRevert') ?? true;
        language.value = lang;
        rowLength.value = rowL;
        wheatherRevert.value = wheatherR;
      }
      return () {};
    }, [snapshot.data]);

    return Theme(
      data: ThemeData.light(),
      child: Dialog(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (Platform.isAndroid)
              Row(
                children: [
                  const Icon(Icons.privacy_tip, color: Colors.grey),
                  Text('Privacy Policy',
                      style: TextStyle(
                          fontSize: 20.h,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold)),
                  const PrivacyPolicyButton(),
                ],
              ),
            if (Platform.isAndroid) const Divider(),
            Row(
              children: [
                const Icon(Icons.info, color: Colors.grey),
                Text('License',
                    style: TextStyle(
                        fontSize: 20.h,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold)),
                TextButton(
                    onPressed: () {
                      showLicensePage(context: context);
                    },
                    child: Text('show', style: TextStyle(fontSize: 15.h))),
              ],
            ),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(Icons.settings, color: Colors.grey),
                    Text(
                      'Settings',
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 20.h,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
                width: double.infinity,
                child: Text(' ・${language.value == 'En' ? 'Language' : '言語'}',
                    style: TextStyle(fontSize: 15.h))),
            RadioListTile(
                title: const Text('日本語'),
                value: 'Ja',
                groupValue: language.value,
                onChanged: (value) {
                  language.value = value!;
                }),
            RadioListTile(
                title: const Text('English'),
                value: 'En',
                groupValue: language.value,
                onChanged: (value) {
                  language.value = value!;
                }),
            SizedBox(
              width: double.infinity,
              child: Text(
                  ' ・${language.value == 'En' ? 'Row Length' : '1行の桁数'}',
                  style: TextStyle(fontSize: 15.h)),
            ),
            Slider(
                value: rowLength.value.toDouble(),
                onChanged: (value) => rowLength.value = value.toInt(),
                min: 1,
                max: 10,
                divisions: 9,
                label: rowLength.value.round().toString()),
            SizedBox(
              width: double.infinity,
              child: Text(' ・${language.value == 'En' ? 'Revert？' : '巻き戻し'}',
                  style: TextStyle(fontSize: 15.h)),
            ),
            Switch(
              value: wheatherRevert.value,
              onChanged: (value) => wheatherRevert.value = value,
            ),
            TextButton(
                onPressed: () async {
                  final prefs = await SharedPreferences.getInstance();
                  prefs.setString('lang', language.value);
                  prefs.setInt('rowLength', rowLength.value);
                  prefs.setBool('wheatherRevert', wheatherRevert.value);
                  final router = ref.read(goRouterProvider);
                  Navigator.pop(context);
                  router.goNamed(
                    PageId.title.routeName,
                  );
                },
                child: Text('save', style: TextStyle(fontSize: 15.h))),
          ],
        ),
      ),
    );
  }
}

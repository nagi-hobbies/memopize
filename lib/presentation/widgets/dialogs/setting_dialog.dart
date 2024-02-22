import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:memopize/presentation/router/go_router.dart';
import 'package:memopize/presentation/router/page_path.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingDialog extends HookConsumerWidget {
  const SettingDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final language = useState('Ja');
    final rowLength = useState(10);
    final revertCount = useState(10);

    final future = useMemoized(SharedPreferences.getInstance);
    final snapshot = useFuture(future, initialData: null);

    // initial value
    useEffect(() {
      final prefs = snapshot.data;
      if (prefs != null) {
        debugPrint('prefs: $prefs');
        final lang = prefs.getString('lang') ?? 'Ja';
        final rowL = prefs.getInt('rowLength') ?? 10;
        final revertC = prefs.getInt('revertCount') ?? 10;
        language.value = lang;
        rowLength.value = rowL;
        revertCount.value = revertC;
      }
      return () {};
    }, [snapshot.data]);

    return Dialog(
      child: Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
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
                Expanded(
                    child: Container(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.close,
                        color: Colors.grey,
                      )),
                )),
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
            Text('Language', style: TextStyle(fontSize: 15.h)),
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
            Text('Digits per Column', style: TextStyle(fontSize: 15.h)),
            Slider(
                value: rowLength.value.toDouble(),
                onChanged: (value) => rowLength.value = value.toInt(),
                min: 1,
                max: 10,
                divisions: 9,
                label: rowLength.value.round().toString()),
            Text('Revert Count', style: TextStyle(fontSize: 15.h)),
            Slider(
                value: revertCount.value.toDouble(),
                onChanged: (value) => revertCount.value = value.toInt(),
                min: 0,
                max: 10,
                divisions: 10,
                label: revertCount.value.round().toString()),
            TextButton(
                onPressed: () async {
                  final prefs = await SharedPreferences.getInstance();
                  prefs.setString('lang', language.value);
                  prefs.setInt('rowLength', rowLength.value);
                  prefs.setInt('revertCount', revertCount.value);
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

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

    final future = useMemoized(SharedPreferences.getInstance);
    final snapshot = useFuture(future, initialData: null);

    // initial value
    useEffect(() {
      final prefs = snapshot.data;
      if (prefs != null) {
        debugPrint('prefs: $prefs');
        final lang = prefs.getString('lang') ?? 'Ja';
        final rowL = prefs.getInt('rowLength') ?? 10;
        language.value = lang;
        rowLength.value = rowL;
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
              ],
            ),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
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
            Text('Language', style: TextStyle(fontSize: 15.h)),
            DropdownButton(
                value: language.value,
                items: const [
                  DropdownMenuItem(value: 'Ja', child: Text('日本語')),
                  DropdownMenuItem(value: 'En', child: Text('English')),
                ],
                onChanged: (value) {
                  language.value = value!;
                }),
            Text('Digits per Row', style: TextStyle(fontSize: 15.h)),
            DropdownButton(
                value: rowLength.value,
                items: List.generate(10, (index) {
                  return DropdownMenuItem(
                      value: index + 1,
                      child: Text((index + 1).toString()));
                }),
                onChanged: (value) async {
                  rowLength.value = value!;
                }),
            TextButton(
                onPressed: () async {
                  final prefs = await SharedPreferences.getInstance();
                  prefs.setString('lang', language.value);
                  prefs.setInt('rowLength', rowLength.value);
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

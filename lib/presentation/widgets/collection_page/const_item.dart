import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:memopize/domain/types/consts_category.dart';
import 'package:memopize/domain/types/display_const_data.dart';
import 'package:memopize/presentation/widgets/common/card_element.dart';
import 'package:memopize/presentation/widgets/common/category_tag.dart';
import 'package:memopize/presentation/widgets/common/tex_text.dart';

class ConstItem extends HookWidget {
  const ConstItem(
      {super.key,
      required this.displayConstData,
      required this.onPressedCallBack});
  final DisplayConstData displayConstData;
  final VoidCallback onPressedCallBack;

  @override
  Widget build(BuildContext context) {
    final isExpanded = useState(false);
    return CardElement(
      child: Theme(
        data: Theme.of(context).copyWith(
          dividerColor: Colors.transparent, // change the divider color
        ),
        child: ExpansionTile(
            title: Row(
              children: [
                Text(displayConstData.name,
                    style: const TextStyle(fontWeight: FontWeight.bold)),
                Expanded(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CategoryTag(
                        category: displayConstData.category ==
                                ConstsCategory.mathematical.name
                            ? ConstsCategory.mathematical
                            : ConstsCategory.physical),
                  ],
                )),
              ],
            ),
            subtitle: Row(
              children: [
                Text('${displayConstData.firstthree}...'),
                Expanded(child: Container()),
                Text('high score: ${displayConstData.highscore}')
              ],
            ),
            leading: SizedBox(
                width: 50,
                height: 50,
                child: TexText(tex: displayConstData.tex)),
            trailing: SizedBox(
              width: 80,
              child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                AnimatedRotation(
                  duration: const Duration(milliseconds: 300),
                  turns: isExpanded.value ? 0.5 : 0,
                  child: const Icon(Icons.expand_more),
                ),
                IconButton.filled(
                  onPressed: onPressedCallBack,
                  icon: const Icon(
                    Icons.play_arrow_outlined,
                  ),
                ),
              ]),
            ),
            children: [
              ListTile(
                title: Text(displayConstData.description),
              ),
            ],
            onExpansionChanged: (value) {
              isExpanded.value = value;
            }),
      ),
    );
  }
}

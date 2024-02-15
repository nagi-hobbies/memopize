import 'package:memopize/domain/types/display_const_data.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 's_display_const_data_list.g.dart';

@Riverpod(keepAlive: true)
class SDisplayConstDataListNotifier extends _$SDisplayConstDataListNotifier {
  @override
  List<DisplayConstData> build() {
    return const [];
  }

  List<DisplayConstData> get value => state;

  void set(List<DisplayConstData> displayConstDataList) {
    state = displayConstDataList;
  }
}

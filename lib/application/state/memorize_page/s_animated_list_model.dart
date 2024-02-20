import 'package:riverpod_annotation/riverpod_annotation.dart';

part 's_animated_list_model.g.dart';

@Riverpod(keepAlive: true)
class SAnimatedListModelNotifier extends _$SAnimatedListModelNotifier {
  @override
  List<int> build() {
    return [];
  }

  void add() {
    state = [...state, state.last + 1];
  }

  void remove() {
    state = List<int>.from(state)..removeAt(0);
  }

  void reverseAdd() {
    state = [state.first - 1, ...state];
  }

  void reverseRemove() {
    state = List<int>.from(state)..removeLast();
  }

  void set(List<int> value) {
    state = value;
  }

  List<int> get value => state;
}

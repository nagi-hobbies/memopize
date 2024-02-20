import 'package:flip_card/flip_card_controller.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 's_flip_card_controller.g.dart';

@riverpod
List<FlipCardController> flipCardControllerList(ref) {
  return List.generate(1000, (index) => FlipCardController());
}

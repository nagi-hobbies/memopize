import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 's_global_object_key_list.g.dart';

@riverpod
List<GlobalObjectKey<FlipCardState>> globalObjectKeyList(ref) {
  return List.generate(1000, (index) => GlobalObjectKey('flip_card_$index'));
}

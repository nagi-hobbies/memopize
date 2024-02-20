import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'list_key.g.dart';

@riverpod
GlobalKey<AnimatedListState> listKey(ref) {
  return GlobalKey<AnimatedListState>();
}

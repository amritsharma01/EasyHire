import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final controller =
    Provider.family.autoDispose<TextEditingController, String>((ref, arg) {
  final TextEditingController textEditingController = TextEditingController();
  ref.onDispose(() => textEditingController.dispose);
  return textEditingController;
});

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppRadioButton extends ConsumerWidget {
  final List<String> labels;
  final StateProvider<bool> stateProvider;

  const AppRadioButton({
    super.key,
    required this.labels,
    required this.stateProvider,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedValue = ref.watch(stateProvider) ? 0 : 1;

    return Column(
      children: List.generate(labels.length, (index) {
        return ListTile(
          title: Text(labels[index]),
          leading: Radio<int>(
            value: index,
            groupValue: selectedValue,
            onChanged: (value) {
              ref.read(stateProvider.notifier).state = value == 0;
            },
          ),
        );
      }),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppSwitch extends ConsumerWidget {
  final String label1;
  final String label2;
  final StateProvider<bool> stateProvider;

  const AppSwitch({
    super.key,
    required this.label1,
    required this.label2,
    required this.stateProvider,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isJobSeeker = ref.watch(stateProvider);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(label1),
        Switch(
          value: isJobSeeker,
          onChanged: (value) {
            ref.read(stateProvider.notifier).state = value;
          },
        ),
        Text(label2),
      ],
    );
  }
}

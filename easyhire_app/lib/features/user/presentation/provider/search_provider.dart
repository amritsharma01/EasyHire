import 'package:flutter_riverpod/flutter_riverpod.dart';

final searchQueryProvider = StateProvider<String>((ref) => "");
final filterProvider = StateProvider<Map<String, dynamic>>((ref) => {});

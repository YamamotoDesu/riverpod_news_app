import 'package:flutter_riverpod/flutter_riverpod.dart';

final counterProvider = StateProvider(
  (ref) => 0,
);

final textProvider = Provider(
  (ref) => 'You have pushed the button this many times:',
);
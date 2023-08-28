import 'package:flutter_riverpod/flutter_riverpod.dart';

final subscriptionProvider = StateProvider<bool>((ref) {
  return true;
});

final ratingProvider = StateProvider<double>((ref)
=> 0
);
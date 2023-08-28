// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:soulknobe_customer/Model/UserModel.dart';
import 'package:soulknobe_customer/Screens/BottomNavigation/Home/repository/home_repository.dart';

// final userProvider = StateProvider<UserModel>((ref) => UserModel());

final homeControllerProvider =
    StateNotifierProvider< HomeController, bool>((ref) {
  return HomeController(
    homeRepository: ref.watch(homerepositoryProvider),
  );
});

// final getGoalStream = StreamProvider.autoDispose.family<
//     String>((ref, data) {
//   final rep = ref.watch(homeControllerProvider.notifier);
//   return rep.getGoal(data);
// });

class HomeController extends StateNotifier<bool> {
  final HomeRepository _homeRepository;
  HomeController( {
    required HomeRepository homeRepository,
  }) : _homeRepository = homeRepository,
  super(false);
  

  // Stream getGoal(String data) {
  //   Map newData = jsonDecode(data);
  //   return ref.watch(goalRepositoryProvider).getGoal(
  //       delete: newData["delete"], search: newData["search"]);
  // }
}

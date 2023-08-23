import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:soulknobe_customer/Model/UserModel.dart';

late double scrHeight;
late double scrWidth;
UserModel? userData;

final userProvider = NotifierProvider<UserNotifier, UserModel>(() {
  return UserNotifier();
});

class UserNotifier extends Notifier<UserModel> {
  UserNotifier();

  @override
  build() {
    return UserModel();
  }

  void updateUser(UserModel updatedUser) {
    state = updatedUser;
  }
}

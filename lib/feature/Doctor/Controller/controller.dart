import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:soulknobe_customer/Model/DoctorModel.dart';
import 'package:soulknobe_customer/feature/auth/Controller/auth_Controller.dart';

import '../Repository/repository.dart';

final doctorControllerProvider =
    StateNotifierProvider<DoctorController, List<DoctorModel>>(
  (ref) => DoctorController(ref: ref),
);

final doctorListcontroller = StreamProvider.autoDispose<List<DoctorModel>>(
  (ref) {
    return ref.watch(doctorControllerProvider.notifier).getDoctorList();
  },
);

class DoctorController extends StateNotifier<List<DoctorModel>> {
  final Ref _ref;
  DoctorController({required Ref ref})
      : _ref = ref,
        super([]);

  Stream<List<DoctorModel>> getDoctorList() {
    final doctorRepository = _ref.read(doctorRepositoryProvider);
    return doctorRepository.getUserdata();
  }
}

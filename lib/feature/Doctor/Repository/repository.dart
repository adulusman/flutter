import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:soulknobe_customer/Core/Constants/firebase_constants/firebase_Constants.dart';

import '../../../Model/DoctorModel.dart';

final doctorRepositoryProvider = Provider<MyModelRepository>(
  (ref) => MyModelRepository(),
);

class MyModelRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

//   Stream<List<DoctorModel>> getDoctorDetails() {
//     return _firestore.collection(FirebaseConstants.doctors).snapshots().map(
//       (snapshot) {
//         return snapshot.docs.map(
//           (doc) {
//             final name = doc["name"];
//             final description = doc["description"];
//             final departments = List<String>.from(doc["department"]);
//             return DoctorModel(name: name,description: description,department: departments);
//           },
//         ).toList();
//       },
//     );
//   }
// }

  Stream<List<DoctorModel>> getUserdata() {
    return _doctors.snapshots().map(
      ( snapshot) => snapshot.docs
          .map((QueryDocumentSnapshot doc) =>
              DoctorModel.fromJson(doc.data() as Map<String, dynamic>))
          .toList(),
    );
  }
CollectionReference get _doctors {
    return _firestore.collection(FirebaseConstants.doctors);
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';

class CriteriaModel {
  String? name;
  String? location;
  String? age;
  String? bloodGroup;
  String? weight;
  bool? infection;
  bool? fever;
  DateTime? lastDonation;
  bool? breastFeeding;
  bool? hyperTension;
  bool? diabetesMellitus;
  bool? chronicAnemia;
  bool? infectionDermatitis;
  bool? anybleeding;
  bool? allergy;
  bool? jaundice;
  String? user;

  CriteriaModel(
      {this.name,
      this.location,
      this.age,
      this.bloodGroup,
      this.weight,
      this.infection,
      this.fever,
      this.lastDonation,
      this.breastFeeding,
      this.hyperTension,
      this.diabetesMellitus,
      this.chronicAnemia,
      this.infectionDermatitis,
      this.anybleeding,
      this.allergy,
      this.jaundice,
      this.user});

  CollectionReference criteria =
      FirebaseFirestore.instance.collection('criteria');

  Future<void> uploadCriteria() {
    return criteria
        .add({
          'name': name,
          'location': location,
          'age': age,
          'bloodGroup': bloodGroup,
          'weight': weight,
          'infection': infection,
          'fever': fever,
          'lastDonation': lastDonation,
          'breastFeeding': breastFeeding,
          'hypertension': hyperTension,
          'diabetesMellitus': diabetesMellitus,
          'chronicAnemia': chronicAnemia,
          'infectionDermatitis': infectionDermatitis,
          'anybleeding': anybleeding,
          'allergy': allergy,
          'jaundice': jaundice,
          'user': user,
        })
        .then((value) => print('criteria added'))
        .catchError((error) => 'did not add successfully');
  }

  // Future<List<Map<String, dynamic>>> readCriteria() async {
  //   List<Map<String, dynamic>> data = [];

  //   try {
  //     QuerySnapshot querySnapshot = await criteria.get();

  //     for (var doc in querySnapshot.docs) {
  //       data.add(doc.data() as Map<String, dynamic>);
  //     }

  //     return data;
  //   } catch (e) {
  //     print(e);
  //   }
  //   return data;
  // }
}

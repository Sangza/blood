import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DonorModel {
  String? blood;
  DateTime? donation;
  TimeOfDay? timeDonation;
  String? location;
  String? user;

  DonorModel(
      {this.blood, this.donation, this.timeDonation, this.location, this.user});

  CollectionReference donate = FirebaseFirestore.instance.collection('donor');

  Future<void> donorModel() {
    return donate
        .add({
          'blood': blood,
          'donation': donation.toString(),
          'timeDonation': timeDonation.toString(),
          'location': location,
          'user': user,
        })
        .then((value) => print('Added to donate'))
        .catchError((e) => 'failed to add');
  }
}

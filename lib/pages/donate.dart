import 'package:blood/model/donormodel.dart';
import 'package:blood/pages/homepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Donate extends StatefulWidget {
  const Donate({super.key});

  @override
  State<Donate> createState() => _DonateState();
}

class _DonateState extends State<Donate> {
  String blood = 'Red blood cell';
  DateTime? donation = DateTime.now();
  TimeOfDay? timeDonation = TimeOfDay.now();
  String location = '';

  bool isClicked = false;

  List<DropdownMenuItem<String>> menuItem = [
    const DropdownMenuItem(
      value: 'Red blood cell',
      child: Text('Red'),
    ),
    const DropdownMenuItem(
      value: 'White blood cell',
      child: Text('White blood'),
    ),
    const DropdownMenuItem(
      value: 'Platelet',
      child: Text('Platelet'),
    ),
    const DropdownMenuItem(
      value: 'Plasma',
      child: Text('Plasma'),
    ),
  ];

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: donation!,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null && pickedDate != donation) {
      setState(() {
        donation = pickedDate;
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: timeDonation!,
    );

    if (pickedTime != null && pickedTime != timeDonation) {
      setState(() {
        timeDonation = pickedTime;
      });
    }
  }

  User? users = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: const ShapeDecoration(
              gradient: LinearGradient(
                  begin: Alignment(0.00, -1),
                  end: Alignment(0, 1),
                  colors: [Colors.red, Colors.white, Colors.white]),
              shape: RoundedRectangleBorder()),
          child: Padding(
            padding: const EdgeInsets.only(top: 10, left: 30, right: 30),
            child: Column(
              children: [
                Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: const Icon(Icons.arrow_back))
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                DropdownButtonFormField(
                    focusColor: Colors.transparent,
                    dropdownColor: Colors.white,
                    items: menuItem,
                    value: blood,
                    onChanged: (newValue) {
                      setState(() {
                        if (newValue != null) blood = newValue;
                      });
                    },
                    decoration: const InputDecoration(
                        labelText: 'Blood Group',
                        labelStyle: TextStyle(color: Colors.red),
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red)))),
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 5),
                  child: Row(
                    children: const [
                      Text(
                        'Day of donation',
                        style: TextStyle(color: Colors.red),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: TextField(
                    showCursor: false,
                    onTap: () {
                      _selectDate(context);
                    },
                    onChanged: (value) {
                      value = donation.toString();
                      setState(() {
                        donation.toString().split(' ')[0] = value;
                      });
                    },
                    onSubmitted: (value) {
                      setState(() {
                        donation.toString().split(' ')[0] = value;
                      });
                    },
                    decoration: InputDecoration(
                        hintText: '${donation.toString().split(' ')[0]}',
                        labelStyle: const TextStyle(
                          color: Colors.red,
                        ),
                        border: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                        focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red))),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 5),
                  child: Row(
                    children: const [
                      Text(
                        'Location',
                        style: TextStyle(color: Colors.red),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: TextField(
                    showCursor: true,
                    cursorColor: Colors.red,
                    onChanged: (value) {
                      setState(() {
                        if (location != null) location = value;
                      });
                    },
                    onSubmitted: (value) {
                      setState(() {
                        if (location != null) location = value;
                      });
                    },
                    decoration: const InputDecoration(
                        hintText: 'Your preferred location',
                        labelStyle: TextStyle(
                          color: Colors.red,
                        ),
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red))),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 5),
                  child: Row(
                    children: const [
                      Text(
                        'Select a time for your donation',
                        style: TextStyle(color: Colors.red),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: TextField(
                    showCursor: false,
                    onTap: () {
                      _selectTime(context);
                    },
                    decoration: InputDecoration(
                        hintText: '${timeDonation?.format(context)}',
                        labelStyle: const TextStyle(
                          color: Colors.red,
                        ),
                        border: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                        focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red))),
                  ),
                ),
                isClicked == true
                    ? const CircularProgressIndicator()
                    : Padding(
                        padding: const EdgeInsets.only(top: 30),
                        child: InkWell(
                          onTap: () {
                            DonorModel model = DonorModel(
                                blood: blood,
                                donation: donation,
                                location: location,
                                user: users!.email.toString(),
                                timeDonation: timeDonation);
                            model.donorModel();
                            isClicked = true;
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: ((context) => const HomePage())));
                          },
                          child: Container(
                            height: 40,
                            width: 100,
                            decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                color: Colors.red),
                            child: const Center(
                              child: Text('Donate'),
                            ),
                          ),
                        ),
                      )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

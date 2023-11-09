import 'package:blood/pages/homepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:blood/model/criteriamodel.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constant.dart';

class Criteria extends StatefulWidget {
  const Criteria({super.key});

  @override
  State<Criteria> createState() => _CriteriaState();
}

class _CriteriaState extends State<Criteria> {
  String? name;
  String? location;
  String? age;
  String? weight;
  bool infection = false;
  bool notInfection = false;
  bool fever = false;
  bool notFever = false;
  DateTime? lastDonation = DateTime.now();
  bool breastFeeding = false;
  bool notBreast = false;
  bool hyperTension = false;
  bool diabetesMellitus = false;
  bool chronicAnemia = false;
  bool infectionDermatitis = false;
  bool anybleeding = false;
  bool allergy = false;
  bool jaundice = false;
  String bloodType = 'O';

  List<DropdownMenuItem<String>> get dropdownItem {
    List<DropdownMenuItem<String>> menuItem = [
      const DropdownMenuItem(
        value: 'O',
        child: Text('O'),
      ),
      const DropdownMenuItem(
        value: 'A',
        child: Text('A'),
      ),
      const DropdownMenuItem(
        value: 'B',
        child: Text('B'),
      ),
      const DropdownMenuItem(
        value: 'AB',
        child: Text('AB'),
      ),
    ];
    return menuItem;
  }

  void _infect(bool value) {
    setState(() {
      infection = value;
      if (infection && notInfection) {
        notInfection = false;
      }
    });
  }

  void _notinfect(bool value) {
    setState(() {
      notInfection = value;
      if (notInfection && infection) {
        infection = false;
      }
    });
  }

  void _fever(bool value) {
    setState(() {
      fever = value;
      if (fever && notFever) {
        notFever = false;
      }
    });
  }

  void _notfever(bool value) {
    setState(() {
      notFever = value;
      if (notFever && fever) {
        fever = false;
      }
    });
  }

  void _breast(bool value) {
    setState(() {
      breastFeeding = value;
      if (breastFeeding && notBreast) {
        notBreast = false;
      }
    });
  }

  void _notbreast(bool value) {
    setState(() {
      notBreast = value;
      if (notBreast && breastFeeding) {
        breastFeeding = false;
      }
    });
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: lastDonation!,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null && pickedDate != lastDonation) {
      setState(() {
        lastDonation = pickedDate;
      });
    }
  }

  bool? complete;
  void isComplete() async {
    SharedPreferences prefss = await SharedPreferences.getInstance();
    prefss.setBool('isCompleted', complete!);
  }

  User? users = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: const ShapeDecoration(
              gradient: LinearGradient(
                  begin: Alignment(0.00, -1),
                  end: Alignment(0, 1),
                  colors: [Colors.red, Colors.white, Colors.white]),
              shape: RoundedRectangleBorder()),
          child: Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Column(
              children: [
                Row(
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.menu,
                          color: Colors.red,
                        ))
                  ],
                ),
                Row(
                  children: const [
                    Text('Donor Criteria'),
                  ],
                ),
                Row(
                  children: const [
                    Text('Fill in the following details corretly'),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: TextField(
                    onChanged: (value) {
                      setState(() {
                        name = value;
                      });
                    },
                    onSubmitted: (value) {
                      setState(() {
                        name = value;
                      });
                    },
                    decoration: const InputDecoration(
                        labelText: 'Name',
                        labelStyle: TextStyle(color: Colors.red),
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red))),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: TextField(
                    onChanged: (value) {
                      setState(() {
                        location = value;
                      });
                    },
                    onSubmitted: (value) {
                      setState(() {
                        location = value;
                      });
                    },
                    decoration: const InputDecoration(
                        labelText: 'Address',
                        labelStyle: TextStyle(color: Colors.red),
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red))),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: TextField(
                    onChanged: (value) {
                      setState(() {
                        age = value;
                      });
                    },
                    onSubmitted: (value) {
                      setState(() {
                        age = value;
                      });
                    },
                    decoration: const InputDecoration(
                        labelText: 'Age',
                        labelStyle: TextStyle(color: Colors.red),
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red))),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: DropdownButtonFormField(
                      focusColor: Colors.transparent,
                      dropdownColor: Colors.white,
                      value: bloodType,
                      items: dropdownItem,
                      onChanged: (newValue) {
                        setState(() {
                          if (newValue != null) bloodType = newValue;
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
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 25),
                  child: TextField(
                    onChanged: (value) {
                      setState(() {
                        weight = value;
                      });
                    },
                    onSubmitted: (value) {
                      setState(() {
                        weight = value;
                      });
                    },
                    decoration: const InputDecoration(
                        labelText: 'Weight',
                        labelStyle: TextStyle(
                          color: Colors.red,
                        ),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red),
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red))),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Text(
                      'Have you had infection (cough, sore throat, runny nose or diarrhea) for the past one week?'),
                ),
                Row(
                  children: [
                    const Text('Yes'),
                    Checkbox(
                        activeColor: Colors.red,
                        value: infection,
                        onChanged: (value) {
                          _infect(value!);
                        }),
                    const Text('No'),
                    Checkbox(
                        activeColor: Colors.red,
                        value: notInfection,
                        onChanged: (value) {
                          _notinfect(value!);
                        })
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 10),
                  child:
                      Text('Have you had any fever for the past three weeks?'),
                ),
                Row(
                  children: [
                    const Text('Yes'),
                    Checkbox(
                        activeColor: Colors.red,
                        value: fever,
                        onChanged: (value) {
                          _fever(value!);
                        }),
                    const Text('No'),
                    Checkbox(
                        activeColor: Colors.red,
                        value: notFever,
                        onChanged: (value) {
                          _notfever(value!);
                        })
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 5),
                  child: Row(
                    children: const [
                      Text(
                        'When was your last donation',
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
                      value = lastDonation.toString();
                      setState(() {
                        lastDonation.toString().split(' ')[0] = value;
                      });
                    },
                    onSubmitted: (value) {
                      setState(() {
                        lastDonation.toString().split(' ')[0] = value;
                      });
                    },
                    decoration: InputDecoration(
                        hintText: '${lastDonation.toString().split(' ')[0]}',
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
                  padding: const EdgeInsets.only(top: 15),
                  child: Row(
                    children: const [
                      Text('Are  you pregnant or a breast feeding mother?'),
                    ],
                  ),
                ),
                Row(
                  children: [
                    const Text('Yes'),
                    Checkbox(
                        activeColor: Colors.red,
                        value: breastFeeding,
                        onChanged: (value) {
                          _breast(value!);
                        }),
                    const Text('No'),
                    Checkbox(
                        activeColor: Colors.red,
                        value: notBreast,
                        onChanged: (value) {
                          _notbreast(value!);
                        })
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 15),
                  child: Text(
                      'Tick on the box of each medical conditions if you have any'),
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.circle,
                      size: 10,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 5),
                      child: Text('Hypertension'),
                    ),
                    Checkbox(
                        activeColor: Colors.red,
                        value: hyperTension,
                        onChanged: (value) {
                          setState(() {
                            if (value != null) hyperTension = value;
                          });
                        })
                  ],
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.circle,
                      size: 10,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 5),
                      child: Text('Diabete mellitus'),
                    ),
                    Checkbox(
                        activeColor: Colors.red,
                        value: diabetesMellitus,
                        onChanged: (value) {
                          setState(() {
                            if (value != null) diabetesMellitus = value;
                          });
                        })
                  ],
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.circle,
                      size: 10,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 5),
                      child: Text('Chronic anemia'),
                    ),
                    Checkbox(
                        activeColor: Colors.red,
                        value: chronicAnemia,
                        onChanged: (value) {
                          setState(() {
                            if (value != null) chronicAnemia = value;
                          });
                        })
                  ],
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.circle,
                      size: 10,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 5),
                      child: Text('Infectious Dermatitis'),
                    ),
                    Checkbox(
                        activeColor: Colors.red,
                        value: infectionDermatitis,
                        onChanged: (value) {
                          setState(() {
                            if (value != null) infectionDermatitis = value;
                          });
                        })
                  ],
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.circle,
                      size: 10,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 5),
                      child: Text('Any bleeding disorder'),
                    ),
                    Checkbox(
                        activeColor: Colors.red,
                        value: anybleeding,
                        onChanged: (value) {
                          setState(() {
                            if (value != null) anybleeding = value;
                          });
                        })
                  ],
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.circle,
                      size: 10,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 5),
                      child: Text('History of allergy'),
                    ),
                    Checkbox(
                        activeColor: Colors.red,
                        value: allergy,
                        onChanged: (value) {
                          setState(() {
                            if (value != null) allergy = value;
                          });
                        })
                  ],
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.circle,
                      size: 10,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 5),
                      child: Text('History of jaundice'),
                    ),
                    Checkbox(
                        activeColor: Colors.red,
                        value: jaundice,
                        onChanged: (value) {
                          setState(() {
                            if (value != null) jaundice = value;
                          });
                        })
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: ElevatedButton(
                      onPressed: () async {
                        CriteriaModel criteria = CriteriaModel(
                            age: age,
                            allergy: allergy,
                            anybleeding: anybleeding,
                            bloodGroup: bloodType,
                            breastFeeding: breastFeeding,
                            chronicAnemia: chronicAnemia,
                            diabetesMellitus: diabetesMellitus,
                            fever: fever,
                            hyperTension: hyperTension,
                            infection: infection,
                            infectionDermatitis: infectionDermatitis,
                            jaundice: jaundice,
                            lastDonation: lastDonation,
                            user: users!.email.toString(),
                            weight: weight,
                            name: name,
                            location: location);
                        await criteria.uploadCriteria();

                        complete = true;
                        print(complete);
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                                builder: (context) => const HomePage()),
                            (route) => false);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: kbackground,
                      ),
                      child: const Text('Submit')),
                ),
                const SizedBox(
                  height: 10,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

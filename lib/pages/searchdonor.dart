import 'package:blood/model/criteriamodel.dart';
import 'package:blood/pages/homepage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  CollectionReference criteria =
      FirebaseFirestore.instance.collection('criteria');

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Search for a Donor'),
          backgroundColor: Colors.red,
        ),
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: FutureBuilder(
              future: criteria.get(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.none ||
                    snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return const Text('data');
                } else {
                  Map<String, dynamic> data =
                      snapshot.data! as Map<String, dynamic>;

                  if (data.isEmpty) {
                    return const Center(
                        child: const Text('data not available'));
                  }
                  return ListView.builder(
                      itemCount: data.length,
                      itemBuilder: ((context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(15),
                          child: Container(
                            height: 100,
                            decoration: BoxDecoration(border: Border.all()),
                            child: Row(
                              children: [
                                const CircleAvatar(),
                                Column(
                                  children: [
                                    Text(data[index]['name'] ?? ''),
                                    Text(data[index]['address'] ?? '')
                                  ],
                                ),
                                Column(
                                  children: [
                                    Text(data[index]['bloodGroup'] ?? ''),
                                    IconButton(
                                        onPressed: () {},
                                        icon: const Icon(Icons.chat))
                                  ],
                                )
                              ],
                            ),
                          ),
                        );
                      }));
                }
              }),
        ),
        bottomNavigationBar: myNavigationBar(context, 0),
      ),
    );
  }
}

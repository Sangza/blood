import 'package:blood/pages/homepage.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class Schedule extends StatefulWidget {
  const Schedule({super.key});

  @override
  State<Schedule> createState() => _ScheduleState();
}

class _ScheduleState extends State<Schedule> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            decoration: const ShapeDecoration(
                gradient: LinearGradient(
                    begin: Alignment(0.00, -1),
                    end: Alignment(0, 1),
                    colors: [Colors.red, Colors.white, Colors.white]),
                shape: RoundedRectangleBorder()),
            child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 5),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15, top: 15),
                    child: Row(
                      children: const [
                        Text(
                          'Recent Schedule',
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: LinearPercentIndicator(
                          barRadius: Radius.circular(10),
                          width: MediaQuery.of(context).size.width - 50,
                          animation: true,
                          lineHeight: 20.0,
                          animationDuration: 2500,
                          percent: 0.8,
                          center: Text("80.0%"),
                          linearStrokeCap: LinearStrokeCap.roundAll,
                          progressColor: Colors.green,
                        )),
                  ),
                  Text('You have 3days to donation appointment'),
                  Padding(
                    padding: const EdgeInsets.only(right: 35),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(onPressed: () {}, child: Text('cancel')),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        TextButton(
                            onPressed: () {},
                            child:
                                Text('Set remainder for the next appointmemt')),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Row(
                      children: const [
                        Text(
                          'Last donation',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, top: 20),
                    child: Row(
                      children: [
                        CircularPercentIndicator(
                          footer: Text('Red blood cell'),
                          radius: 40.0,
                          animation: true,
                          animationDuration: 1200,
                          lineWidth: 10.0,
                          percent: 0.4,
                          center: const Text(
                            "40%",
                            style: TextStyle(fontSize: 14.0),
                          ),
                          circularStrokeCap: CircularStrokeCap.butt,
                          backgroundColor: Colors.yellow,
                          progressColor: Colors.red,
                        ),
                        const SizedBox(
                          width: 70,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(0.0),
                          child: Column(
                            children: <Widget>[
                              LinearPercentIndicator(
                                width: 100.0,
                                lineHeight: 8.0,
                                animation: true,
                                animationDuration: 2000,
                                leading: const Text('platelet:'),
                                percent: 0.2,
                                progressColor: Colors.red,
                                barRadius: const Radius.circular(5),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              LinearPercentIndicator(
                                width: 100.0,
                                lineHeight: 8.0,
                                animation: true,
                                animationDuration: 2000,
                                leading: const Text('white cell:'),
                                percent: 0.5,
                                progressColor: Colors.orange,
                                barRadius: const Radius.circular(5),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              LinearPercentIndicator(
                                width: 100.0,
                                lineHeight: 8.0,
                                animation: true,
                                animationDuration: 2000,
                                leading: const Text('plasma:'),
                                percent: 0.9,
                                barRadius: const Radius.circular(5),
                                progressColor: Colors.blue,
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, top: 20),
                    child: Row(
                      children: const [
                        Text(
                          'Next donation',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, left: 20),
                    child: Row(
                      children: [
                        Text('White blood'),
                      ],
                    ),
                  ),
                  DropdownContainer(
                    dropdownContent: Container(
                      decoration: BoxDecoration(border: Border.all()),
                      child: Text('he is him'),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15, right: 15),
                      child: Container(
                        padding: EdgeInsets.all(9),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.transparent),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('click to know your next schedule'),
                            CircleAvatar()
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, left: 20),
                    child: Row(
                      children: [
                        Text('Blood component'),
                      ],
                    ),
                  ),
                  DropdownContainer(
                    dropdownContent: Container(
                      decoration: BoxDecoration(border: Border.all()),
                      height: 50,
                      child: Text('he is him'),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15, right: 15),
                      child: Container(
                        padding: EdgeInsets.all(9),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.transparent),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('click to know your next schedule'),
                            CircleAvatar()
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: myNavigationBar(context, 2),
      ),
    );
  }
}

class DropdownContainer extends StatefulWidget {
  final Widget child;
  final Widget dropdownContent;

  DropdownContainer({required this.child, required this.dropdownContent});

  @override
  _DropdownContainerState createState() => _DropdownContainerState();
}

class _DropdownContainerState extends State<DropdownContainer> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isExpanded = !_isExpanded;
        });
      },
      child: Column(
        children: [
          widget.child,
          AnimatedContainer(
            duration: Duration(milliseconds: 300),
            width: _isExpanded ? 200 : 0,
            height:
                _isExpanded ? 100 : 0, // Adjust the dropdown height as needed
            child: widget.dropdownContent,
          ),
        ],
      ),
    );
  }
}

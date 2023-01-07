import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:async';

class Alarm extends StatefulWidget {
  const Alarm({super.key});

  @override
  State<Alarm> createState() => _AlarmState();
}

class _AlarmState extends State<Alarm> {
  @override
  String nowTime =
      "${(DateTime.now().hour).toString()} : ${DateTime.now().minute.toString()}";
  List<String> alarmTimes = [];
  List<String> alarmName = [];
  List<bool> alarmIsOpen = [];
  List<int> each = [];
  List<int> total = [];
  void initState() {
    const fiveSeconds = Duration(seconds: 1);
    Timer.periodic(fiveSeconds, (Timer t) {
      setState(() {
        nowTime =
            "${(DateTime.now().hour).toString()} : ${DateTime.now().minute < 10 ? "0" + DateTime.now().minute.toString() : DateTime.now().minute.toString()}";
      });
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      floatingActionButton: SizedBox(
        width: 70,
        height: 70,
        child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(3660)),
          child: FloatingActionButton(
            onPressed: () async {
              TimeOfDay? timeOfDay = await showTimePicker(
                context: context,
                initialTime: TimeOfDay.now(),
                builder: (context, child) {
                  return Theme(
                    data: ThemeData.dark(),
                    child: TimePickerDialog(
                      initialTime: TimeOfDay.now(),
                    ),
                  );
                },
              );
              if (timeOfDay == null) return;
              alarmTimes.add("${timeOfDay.hour}:${timeOfDay.minute}");
              alarmName.add("");
              alarmIsOpen.add(false);
              each.add(0);
              total.add(1);
            },
            backgroundColor: Colors.yellow,
            child: const Icon(
              Icons.add,
              color: Colors.black,
              size: 30,
            ),
          ),
        ),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 10, left: 8, top: 10),
            child: Row(children: [
              const Padding(
                padding: EdgeInsets.only(left: 20),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "現在時間:",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w600
                        //fontWeight: FontWeight.bold
                        ),
                  ),
                ),
              ),
              Spacer(),
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: Text((nowTime),
                      style: GoogleFonts.dosis(
                        textStyle: const TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                        ),
                      )),
                ),
              ),
            ]),
          ),
          Flexible(
              child: ListView.builder(
                  itemCount: alarmTimes.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        SizedBox(
                          width: double.infinity,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Card(
                              color: Color.fromARGB(255, 123, 123, 123),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 10, bottom: 10, left: 5, right: 5),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                            width: double.infinity,
                                            height: 20,
                                            child: Stack(
                                                alignment: Alignment.topLeft,
                                                children: [
                                                  Text(
                                                    textAlign: TextAlign.left,
                                                    alarmName[index],
                                                    style: const TextStyle(
                                                      height: 1,
                                                      fontSize: 14,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                  Positioned(
                                                    right: 10.0,
                                                    child: GestureDetector(
                                                        onTap: () {
                                                          Navigator.of(context)
                                                              .pushNamed(
                                                                  '/setAlarm',
                                                                  arguments: {
                                                                'alarm':
                                                                    alarmTimes[
                                                                        index],
                                                                'each':
                                                                    each[index],
                                                                'total': total[
                                                                    index],
                                                              });
                                                        },
                                                        child: Icon(
                                                          Icons.edit,
                                                          color: Colors.amber,
                                                        )),
                                                  )
                                                ])),
                                        SizedBox(
                                          width: double.infinity,
                                          child: Row(children: [
                                            GestureDetector(
                                              child: Text(
                                                  textAlign: TextAlign.left,
                                                  alarmTimes[index],
                                                  style: GoogleFonts.rajdhani(
                                                    textStyle: const TextStyle(
                                                      height: 1,
                                                      fontSize: 50,
                                                      color: Colors.white,
                                                    ),
                                                  )),
                                              onTap: () {},
                                            ),
                                            Switch(
                                                activeColor: Colors.white,
                                                thumbColor:
                                                    MaterialStateProperty.all<
                                                        Color>(Colors.yellow),
                                                value: alarmIsOpen[index],
                                                onChanged: (value) => setState(
                                                    () => alarmIsOpen[index] =
                                                        value)),
                                          ]),
                                        ),
                                        Text(
                                          textAlign: TextAlign.left,
                                          "每${each[index]}分鐘響一次，共${total[index]}次",
                                          style: TextStyle(
                                            height: 1,
                                            fontSize: 14,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    );
                  }))
        ],
      ),
    );
  }
}

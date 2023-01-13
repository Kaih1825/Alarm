import 'package:alarm/screens/alarm.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';
import 'package:flutter/services.dart';

class setAlarm extends StatefulWidget {
  const setAlarm({super.key});

  @override
  State<setAlarm> createState() => _setAlarmState();
}

class _setAlarmState extends State<setAlarm> {
  @override
  String alarmTime = "";
  int each = 0;
  int total = 0;
  String tempTime = "";
  int index = 0;
  TextEditingController nameController = TextEditingController();
  TextEditingController eachController = TextEditingController();
  TextEditingController totalController = TextEditingController();

  void initState() {
    super.initState();
    nameController.text = alarmTime;
    eachController.text = each == 0 ? "" : each.toString();
    totalController.text = total == 0 ? "" : total.toString();
  }

  Widget build(BuildContext context) {
    dynamic obj = ModalRoute.of(context)!.settings.arguments;
    alarmTime = obj["alarm"];
    each = obj["each"];
    total = obj["total"];
    index = obj["index"];
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          "設定鬧鐘",
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TimePickerSpinner(
              alignment: Alignment.center,
              is24HourMode: true,
              normalTextStyle:
                  const TextStyle(fontSize: 48, color: Colors.grey),
              highlightedTextStyle:
                  const TextStyle(fontSize: 48, color: Colors.white),
              spacing: 50,
              itemHeight: 80,
              itemWidth: 100,
              isForce2Digits: true,
              onTimeChange: (time) {
                setState(() {
                  tempTime = time.toString();
                });
              },
            ),
            Expanded(
              flex: 1,
              child: Container(
                alignment: Alignment.topLeft,
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30)),
                    color: Colors.grey.shade900),
                child: Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30, top: 40),
                  child: Column(
                    children: [
                      TextField(
                        textAlign: TextAlign.center,
                        decoration: const InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.yellow),
                            ),
                            hintText: "鬧鐘名稱",
                            hintStyle: TextStyle(color: Colors.grey)),
                        cursorColor: Colors.yellow,
                        onEditingComplete: () {
                          FocusScope.of(context).unfocus();
                        },
                        style: const TextStyle(color: Colors.white),
                        controller: nameController,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 40.0),
                        child: SizedBox(
                          width: double.infinity,
                          child: Row(
                            children: [
                              const Text(
                                "每",
                                style: TextStyle(color: Colors.white),
                              ),
                              Expanded(
                                child: TextField(
                                  textAlign: TextAlign.center,
                                  decoration: const InputDecoration(
                                      hintText: "分鐘",
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.grey),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.yellow),
                                      ),
                                      hintStyle: TextStyle(color: Colors.grey)),
                                  cursorColor: Colors.yellow,
                                  onEditingComplete: () {
                                    FocusScope.of(context).unfocus();
                                  },
                                  style: const TextStyle(color: Colors.white),
                                  controller: totalController,
                                  keyboardType: TextInputType.number,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly
                                  ],
                                ),
                              ),
                              const Text(
                                "分鐘響一次，共",
                                style: TextStyle(color: Colors.white),
                              ),
                              Expanded(
                                child: TextField(
                                  textAlign: TextAlign.center,
                                  decoration: const InputDecoration(
                                      hintText: "次數",
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.grey),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.yellow),
                                      ),
                                      hintStyle: TextStyle(color: Colors.grey)),
                                  cursorColor: Colors.yellow,
                                  onEditingComplete: () {
                                    FocusScope.of(context).unfocus();
                                  },
                                  style: const TextStyle(color: Colors.white),
                                  controller: eachController,
                                  keyboardType: TextInputType.number,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly
                                  ],
                                ),
                              ),
                              const Text(
                                "次",
                                style: TextStyle(color: Colors.white),
                              )
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 40.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 20.0),
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.yellow),
                                child: const Text(
                                  "取消",
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: ElevatedButton(
                                onPressed: () {
                                  Alarm()
                                  Navigator.pop(context);
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.yellow),
                                child: const Text(
                                  "確定",
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';

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
  TextEditingController nameController = TextEditingController();
  TextEditingController eachController = TextEditingController();
  TextEditingController totalController = TextEditingController();
  Widget build(BuildContext context) {
    dynamic obj = ModalRoute.of(context)!.settings.arguments;
    alarmTime = obj["alarm"];
    each = obj["each"];
    total = obj["total"];
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
                  padding: const EdgeInsets.only(left: 30, right: 30, top: 20),
                  child: Column(
                    children: [
                      TextField(
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
                      Row(
                        children: [
                          const Text(
                            "每",
                            style: TextStyle(color: Colors.white),
                          ),
                          SizedBox(
                            width: 30,
                            child: TextField(
                              decoration: const InputDecoration(
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey),
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
                            ),
                          ),
                          const Text(
                            "分鐘響一次，共",
                            style: TextStyle(color: Colors.white),
                          ),
                          SizedBox(
                            width: 30,
                            child: TextField(
                              decoration: const InputDecoration(
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey),
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
                            ),
                          ),
                          const Text(
                            "次10",
                            style: TextStyle(color: Colors.white),
                          )
                        ],
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

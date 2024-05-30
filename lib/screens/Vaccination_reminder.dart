import 'dart:async';

import 'package:CattleSavior/controllers/task_controller.dart';
import 'package:CattleSavior/model/task.dart';
import 'package:CattleSavior/model/widgets/task_tile.dart';
import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../model/widgets/button.dart';
import '../services/notification_services.dart';
import 'add_reminder.dart';

class Vaccine_reminder extends StatefulWidget {
  const Vaccine_reminder({Key? key}) : super(key: key);

  @override
  State<Vaccine_reminder> createState() => _Vaccine_reminderState();
}

class _Vaccine_reminderState extends State<Vaccine_reminder> {
  DateTime _selectedDate = DateTime.parse(DateTime.now().toString());
  final _taskController = Get.put(TaskController());
  late var notifyHelper;
  bool animate = false;
  double left = 630;
  double top = 900;
  Timer? _timer;
  @override
  void initState() {
    super.initState();
    notifyHelper = NotifyHelper();
    notifyHelper.initializeNotification();
    notifyHelper.requestIOSPermissions();
    _timer = Timer(Duration(milliseconds: 500), () {
      setState(() {
        animate = true;
        left = 30;
        top = top / 3;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "টিকার সময়সূচি তালিকা",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          _addReminderBar(),
          _addDateBar(),
          const SizedBox(
            height: 10,
          ),
          _showReminders(),
        ],
      ),
    );
  }

  _showReminders() {
    return Expanded(child: Obx(() {
      return ListView.builder(
          itemCount: _taskController.taskList.length,
          itemBuilder: (_, index) {
            print(_taskController.taskList.length);
            Task task = _taskController.taskList[index];
            var hour = task.startTime.toString().split(":")[0];
            var minutes = task.startTime.toString().split(":")[1];
            debugPrint("My time is " + hour);
            debugPrint("My minute is " + minutes);
            DateTime date = DateFormat.jm().parse(task.startTime!);
            var myTime = DateFormat("HH:mm").format(date);
            var t = DateFormat("M/d/yyyy hh:mm a")
                .parse(task.date! + " " + task.startTime!);
            print(t);
            /*
                  print("my date "+date.toString());
                  print("my time " +myTime);
                  var t=DateFormat("M/d/yyyy hh:mm a").parse(task.date+" "+task.startTime);
                  print(t);
                  print(int.parse(myTime.toString().split(":")[0]));*/
            notifyHelper.scheduledNotification(
                int.parse(myTime.toString().split(":")[0]),
                int.parse(myTime.toString().split(":")[1]),
                task);

            return AnimationConfiguration.staggeredList(
                position: index,
                child: SlideAnimation(
                  child: FadeInAnimation(
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            _showBottomSheet(context, task);
                          },
                          child: TaskTile(task),
                        )
                      ],
                    ),
                  ),
                ));
          });
    }));
  }

  _showBottomSheet(BuildContext context, Task task) {
    Get.bottomSheet(
      Container(
        padding: const EdgeInsets.only(top: 4),
        height: task.isCompleted == 1
            ? MediaQuery.of(context).size.height * 0.24
            : MediaQuery.of(context).size.height * 0.32,
        color: Colors.white,
        child: Column(
          children: [
            Container(
              height: 6,
              width: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey,
              ),
            ),
            Spacer(),
            task.isCompleted == 1
                ? Container()
                : _bottomSheetButton(
                label: "টিকা দেয়া সম্পন্ন হয়েছে",
                onTap: () {
                  _taskController.markTaskCompleted(task.id!);
                  Get.back();
                },
                color: Colors.green.shade800,
                context: context),
            _bottomSheetButton(
                label: "সময়সূচি বাদ দিন",
                onTap: () {
                  _taskController.delete(task);
                  Get.back();
                },
                color: Colors.red.shade800,
                context: context),
            SizedBox(
              height: 10,
            ),
            _bottomSheetButton(
                label: "বন্ধ করুন",
                onTap: () {
                  Get.back();
                },
                color: Colors.white,
                isClose: true,
                context: context),
          ],
        ),
      ),
    );
  }

  _bottomSheetButton({
    required String label,
    required Function()? onTap,
    required Color color,
    bool isClose = false,
    required BuildContext context,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4),
        height: 55,
        width: MediaQuery.of(context).size.width * 20,
        decoration: BoxDecoration(
          border: Border.all(
            width: 2,
            color: isClose == true ? Colors.red : color,
          ),
          borderRadius: BorderRadius.circular(20),
          color: isClose == true ? Colors.teal : color,
        ),
        child: Center(
          child: Text(
            label,
            style: const TextStyle(
                fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
      ),
    );
  }

  _addDateBar() {
    return Container(
      margin: const EdgeInsets.only(
        top: 20,
        left: 20,
      ),
      child: DatePicker(
        DateTime.now(),
        height: 100,
        width: 80,
        initialSelectedDate: DateTime.now(),
        selectionColor: Colors.deepPurple,
        selectedTextColor: Colors.white,
        dateTextStyle: TextStyle(
            fontSize: 20, fontWeight: FontWeight.w600, color: Colors.blueGrey),
        dayTextStyle: TextStyle(
            fontSize: 16, fontWeight: FontWeight.w600, color: Colors.blueGrey),
        monthTextStyle: TextStyle(
            fontSize: 15, fontWeight: FontWeight.w600, color: Colors.blueGrey),
        onDateChange: (date) {
          _selectedDate = date;
        },
      ),
    );
  }

  _addReminderBar() {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("আজকের তারিখ",
                    style:
                    TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                Text(
                  DateFormat.yMMMMd().format(DateTime.now()),
                  style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueGrey),
                ),
              ],
            ),
          ),
          MyButton(
              label: "+\nযোগ করুন",
              onTap: () async {
                await Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AddReminder()));
                _taskController.getTasks();
              })
        ],
      ),
    );
  }
}

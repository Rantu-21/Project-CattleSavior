import 'package:CattleSavior/controllers/task_controller.dart';
import 'package:CattleSavior/model/task.dart';
import 'package:CattleSavior/model/widgets/button.dart';
import 'package:CattleSavior/model/widgets/input_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'Vaccination_reminder.dart';


class AddReminder extends StatefulWidget {
  const AddReminder({Key? key}) : super(key: key);

  @override
  _AddReminderState createState() => _AddReminderState();
}

class _AddReminderState extends State<AddReminder> {
  final TaskController _taskController = Get.put(TaskController());
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();
  DateTime _selectedDate = DateTime.now();
  String _endTime ="9:30 PM";
  String _startTime = DateFormat("hh:mm a").format(DateTime.now()).toString();
  int _selectedRemind = 10;
  List<int> remindList =[
    10,20,30,40,50
  ];
  int _selectedColor=0;


  @override
  Widget build(BuildContext context) {
    final now = new DateTime.now();
    final dt = DateTime(now.year, now.month, now.day, now.minute, now.second);
    final format = DateFormat.jm();
    return Scaffold(

      appBar: AppBar(
        title: const Text('নতুন টিকার সময়সূচি যোগ করুন',
          style: TextStyle(
              fontSize: 20,fontWeight: FontWeight.bold),),
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 20,right: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              InputField(title: "টিকার নাম", hint:"গলাফুলা/বাদলা/তড়কা টিকা...",controller: _titleController,),
              InputField(title: "সংক্ষিপ্ত বর্ননা", hint:"পশু চিহ্নিতকরণ সম্পর্কিত তথ্য...", controller: _noteController,),
              InputField(title: "টিকা প্রদানের পরবর্তী তারিখ", hint: DateFormat.yMd().format(_selectedDate),
                widget: IconButton(
                  icon: Icon(Icons.calendar_today_outlined),
                  onPressed: (){
                    _getDate();
                  },
                ),),
              Row(
                children: [
                  Expanded(
                      child:InputField(
                        title: "সময়",
                        hint: _startTime,
                        widget: IconButton(
                          onPressed: () {
                            _getTime(isStartTime: true);
                            setState(() {

                            });
                          },
                          icon: Icon(Icons.access_time_rounded,
                            color: Colors.grey,),
                        ),
                      ) ),
                  SizedBox(width: 12,),
                ],
              ),
              SizedBox(height: 18,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _colorselection(),
                  MyButton(label: "+\nযুক্ত করুন", onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => _validateDate(),
                      ),
                    );
                  })
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
  _validateDate(){
    if(_titleController.text.isNotEmpty && _noteController.text.isNotEmpty){
      _addToDb();
      //Get.back();
      return const Vaccine_reminder();//Get.back() doesn't work
    }else if (_titleController.text.isEmpty||_noteController.text.isEmpty){
      return const GetSnackBar(title: "আবশ্যক",message:"প্রত্যেক ঘর পূরণ করুন",
        snackPosition: SnackPosition.BOTTOM,
        snackStyle: SnackStyle.FLOATING,
        backgroundColor: Colors.redAccent,
      );
    }
  }
  _addToDb() async {
    int value = await _taskController.addTask(
        task: Task(
          note: _noteController.text,
          title: _titleController.text,
          date: DateFormat.yMd().format(_selectedDate),
          startTime: _startTime,
          endTime: _endTime,
          //remind: _selectedRemind,
          color: _selectedColor,
          isCompleted:0,
        )
    );
    print("My ID is" + "$value");

  }
  _colorselection(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("রং",
          style:TextStyle(
              fontSize: 21, fontWeight: FontWeight.bold
          ),
        ),
        SizedBox(height: 3.0,),
        Wrap(
            children: List<Widget>.generate(3, (int index){
              return GestureDetector(
                onTap: (){
                  setState(() {
                    _selectedColor= index;
                  });

                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: CircleAvatar(
                    radius: 14,
                    backgroundColor: index == 0?Colors.green:index==1?Colors.yellow[700]:Colors.red,
                    child: _selectedColor==index?const Icon(Icons.done,
                        color: Colors.black):Container(),
                  ),
                ),
              );
            },
            )
        )],
    );
  }
  _getDate() async {
    DateTime? _pickerDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2023),
        lastDate: DateTime(2040)
    );
    if (_pickerDate!=null){
      setState(() {
        _selectedDate = _pickerDate;
      });
    }else{
      print('তারিখ নির্বাচন করুন');
    }
  }
  _getTime({required bool isStartTime}) async {
    var pickedTime = await _showTimePicker();
    String _formatedTime = pickedTime.format(context);
    if (pickedTime == null){
      print('Time caneld');
    }else if(isStartTime==true){
      setState(() {
        _startTime = _formatedTime;
      });
    }else if(isStartTime==false){
      setState(() {
        _endTime = _formatedTime;
      });
    }
  }
  _showTimePicker(){
    return showTimePicker(
      initialEntryMode: TimePickerEntryMode.input,
      context: context,
      initialTime: TimeOfDay(
          hour: int.parse(_startTime.split(":")[0]),
          minute: int.parse(_startTime.split(":")[1].split(" ")[0])),
    );
  }
}

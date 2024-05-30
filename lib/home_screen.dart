
import 'package:CattleSavior/screens/Vet_info_screen.dart';
import 'package:flutter/material.dart';
import 'package:CattleSavior/screens/Grooming_screen.dart';
import 'package:CattleSavior/screens/List_Diseases_Screen.dart';
import 'package:CattleSavior/screens/Vaccination_Screen.dart';
import 'package:CattleSavior/screens/Vaccination_reminder.dart';
import 'package:CattleSavior/screens/medicine_screen.dart';
import 'package:CattleSavior/TfliteModel.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("CATTLE SAVIOR",style: TextStyle(fontSize: 22.0,fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      backgroundColor: Colors.black,
      body: Container(
        width: double.infinity, // <-- match_parent
        height: double.infinity,

        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
                return TfliteModel();
              }));},
              child: const Text("রোগ শনাক্ত করি",style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.bold),),
              style: ElevatedButton.styleFrom(primary: Colors.lightGreen[900],shape:RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)
              ),minimumSize: Size(double.infinity, 70)),
            ),





            ElevatedButton(
              onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
                  return const List_Diseases();
                }));
              }, child: const Text("সাধারণ রোগ সম্পর্কে জানি",style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.bold),),
              style: ElevatedButton.styleFrom(primary: Colors.lightGreen[900],shape:RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)
              ),minimumSize: Size(double.infinity, 70)),
            ),


            ElevatedButton(onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
                return const List_Vaccination_Diseases();
              }));
            }, child: const Text("টিকা সম্পর্কে জানি",style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.bold),),
              style: ElevatedButton.styleFrom(primary: Colors.lightGreen[900],shape:RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)
              ),minimumSize: Size(double.infinity, 70)),
            ),


            ElevatedButton(onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
                return Vaccine_reminder();
              }));
            }, child: const Text("টিকার সময়সূচি নির্ধারণ",style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.bold),),
              style: ElevatedButton.styleFrom(primary: Colors.lightGreen[900],shape:RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)
              ),minimumSize: Size(double.infinity, 70)),
            ),



            ElevatedButton(onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
                return cattle_grooming();
              }));
            }, child: const Text("সার্বিক পরিচর্যা",style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.bold),),
              style: ElevatedButton.styleFrom(primary: Colors.lightGreen[900],shape:RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)
              ),minimumSize: Size(double.infinity, 70)),
            ),



            ElevatedButton(onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
                return Medicine();
              }));
            }, child: const Text("ঔষধ পরিচিতি",style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.bold),),
              style: ElevatedButton.styleFrom(primary: Colors.lightGreen[900],shape:RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)
              ),minimumSize: Size(double.infinity, 70)),
            ),

            ElevatedButton(onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
                return Vet_info();
              }));
            }, child: const Text("পশুচিকিৎসকদের তথ্য",style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.bold),),
              style: ElevatedButton.styleFrom(primary: Colors.lightGreen[900],shape:RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)
              ),minimumSize: Size(double.infinity, 70)),
            ),
          ],

        ),
      ),
    );
  }
}

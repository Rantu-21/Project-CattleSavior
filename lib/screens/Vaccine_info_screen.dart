import 'package:flutter/material.dart';
import 'package:CattleSavior/model/Vaccine_info.dart';

class Vaccine_info_screen extends StatelessWidget {
  final Vaccine_info vaccine_info;
  Vaccine_info_screen(this.vaccine_info);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(vaccine_info.disease),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),

        child: SingleChildScrollView
          (
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(vaccine_info.image),
              const Padding(padding: EdgeInsets.all(2.0),
                child:Text("টিকার নাম",
                  style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),
                ),
              ),
              Padding(padding: const EdgeInsets.all(2.0),
                child:Text(vaccine_info.vaccine,
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
              const Padding(padding: EdgeInsets.all(2.0),
                child:Text("টিকা প্রয়োগের স্থান",
                  style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),
                ),
              ),
              Padding(padding: const EdgeInsets.all(2.0),
                child:Text(vaccine_info.place,
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
              const Padding(padding: EdgeInsets.all(2.0),
                child:Text("মাত্রা",
                  style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),
                ),
              ),
              Padding(padding: const EdgeInsets.all(2.0),
                child:Text(vaccine_info.amount,
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
              const Padding(padding: EdgeInsets.all(2.0),
                child:Text("টিকা শিডিউল",
                  style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),
                ),
              ),
              Padding(padding: const EdgeInsets.all(2.0),
                child:Text(vaccine_info.schedule,
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
              const Padding(padding: EdgeInsets.all(2.0),
                child:Text("সতর্কতা",
                  style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),
                ),
              ),
              Padding(padding: const EdgeInsets.all(2.0),
                child:Text(vaccine_info.cautions,
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: 20.0),
                ),
              ),

              const Padding(padding: EdgeInsets.all(2.0),
                child:Text("ব্যবহারবিধি",
                  style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),
                ),
              ),

              Padding(padding: const EdgeInsets.all(2.0),
                child:Text(vaccine_info.description,
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 20.0),
              ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}

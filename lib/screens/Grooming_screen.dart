import 'package:flutter/material.dart';
import '../model/Grooming.dart';
import 'Grooming_details_screen.dart';

class cattle_grooming extends StatefulWidget {
  const cattle_grooming({Key? key}) : super(key: key);

  @override
  State<cattle_grooming> createState() => _cattle_groomingState();
}

class _cattle_groomingState extends State<cattle_grooming> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("সার্বিক পরিচর্যা"),
      ),
      body: ListView.builder(
          itemCount: DiseaseList.length,
          itemBuilder: (context,index){
            Diseases diseases = DiseaseList[index];
            return Card(
              child: ListTile(
                title: Text(diseases.title,style: TextStyle(fontSize: 22.0,fontWeight: FontWeight.bold),),
                // subtitle: Text(diseases.description),
                leading: Icon(Icons.album_rounded),
                trailing: Icon(Icons.arrow_forward_rounded),
                onTap: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context)=> Disease_details(diseases)));
                },
                iconColor: Colors.black,

              ),
              color: Colors.deepPurpleAccent[100],

            );
          }),

    );
  }
}

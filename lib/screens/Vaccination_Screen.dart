import 'package:flutter/material.dart';
import 'package:CattleSavior/model/Vaccine_info.dart';
import 'package:CattleSavior/screens/Vaccine_info_screen.dart';

class List_Vaccination_Diseases extends StatefulWidget {
  const List_Vaccination_Diseases({Key? key}) : super(key: key);

  @override
  State<List_Vaccination_Diseases> createState() => _List_Vaccination_DiseasesState();
}

class _List_Vaccination_DiseasesState extends State<List_Vaccination_Diseases> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("রোগ এবং টিকা"),
      ),
      body: ListView.builder(
          itemCount: Vaccine_infoList.length,
          itemBuilder: (context,index){
            Vaccine_info vaccine_info = Vaccine_infoList[index];
            return Card(
              child: ListTile(
                title: Text(vaccine_info.disease,style: TextStyle(fontSize: 22.0,fontWeight: FontWeight.bold),),
                // subtitle: Text(diseases.description),
                leading: Icon(Icons.album_rounded),
                trailing: Icon(Icons.arrow_forward_rounded),
                onTap: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context)=> Vaccine_info_screen(vaccine_info)));
                },

              ),
              color: Colors.deepPurpleAccent[100],

            );
          }),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:CattleSavior/model/Diseases.dart';
import 'package:CattleSavior/screens/Disease_details_screen.dart';

class List_Diseases extends StatefulWidget {
  const List_Diseases({Key? key}) : super(key: key);

  @override
  State<List_Diseases> createState() => _List_DiseasesState();
}

class _List_DiseasesState extends State<List_Diseases> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("গরুর সাধারণ রোগ সমূহ"),
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

    ),
                color: Colors.deepPurpleAccent[100],

    );
    }),
    );
  }
}

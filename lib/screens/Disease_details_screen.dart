import 'package:flutter/material.dart';
import 'package:CattleSavior/model/Diseases.dart';

class Disease_details extends StatelessWidget {
  final Diseases diseases;
  Disease_details(this.diseases);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(diseases.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),

        child: SingleChildScrollView
          (
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(diseases.image),
      Padding(padding: const EdgeInsets.all(8.0),
      child: Text(diseases.description,
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

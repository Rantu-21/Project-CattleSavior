import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final String title;
  final String hint;
  final TextEditingController? controller;
  final Widget? widget;
  const InputField({Key? key,
    required this.title,
    required this.hint,
    this.controller,
    this.widget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          Container(
            height: 45,
            margin: const EdgeInsets.only(top: 5.0),
            padding: const EdgeInsets.only(left: 10),
            decoration: BoxDecoration(
                border: Border.all(
                    color: Colors.grey,
                    width: 1.0
                ),
                borderRadius: BorderRadius.circular(12)
            ),
            child: Row(
              children:[
                Expanded(child: TextFormField(
                    readOnly: widget == null?false:true,
                    autofocus: false,
                    cursorColor: Colors.black,
                    controller: controller,
                    style: const TextStyle(fontSize: 20,fontWeight: FontWeight.w400),
                    decoration: InputDecoration(
                      hintText: hint,
                      focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.white,
                              width: 0
                          )
                      ),
                      enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.white,
                            width: 0
                        ),
                      ),
                    ))
                ),
                widget == null?Container():Container(
                  child: widget,
                )
              ],
            ) ,
          )
        ],
      ),
    );
  }
}
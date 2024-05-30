import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Medicine extends StatelessWidget {
  const Medicine({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title:const Text("ঔষধ পরিচিতি",style: TextStyle(fontWeight: FontWeight.bold),),
        ),
        body:
        SingleChildScrollView(
          child: Column(
              children: [
                const Text(
                  '\nচিকিৎসকের পরামর্শ ছাড়া ঔষধ ব্যবহারে বিরত থাকুন',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                    color: Colors.red
                  ),
                ),
                Container(
                    padding: const EdgeInsets.all(15),
                    child:Table(

                      border: TableBorder.all(width:2, color:Colors.black45),
                      defaultVerticalAlignment: TableCellVerticalAlignment.middle,

                      //table border
                      children: const [
                        TableRow(
                            children: [
                              TableCell(child: Text("রোগের নাম\n",textAlign: TextAlign.center,style:TextStyle(fontWeight:FontWeight.bold,fontSize: 18),)),
                              TableCell(child: Text("ঔষধের নাম\n",textAlign: TextAlign.center,style:TextStyle(fontWeight:FontWeight.bold,fontSize: 18))),
                            ]
                        ),

                        TableRow(
                            children: [
                              TableCell(child: Text("ম্যাস্টাইটিস/\nওলান ফুলা",textAlign: TextAlign.center,style: TextStyle(fontSize: 18,fontWeight:FontWeight.bold),)),
                              TableCell(child: Text(" \nট্রাইজন ভেট/মক্সিলিন ভেট/জেন্টা- ১০ ভেট/ টেট্রাভেট/ কেটো-এ ভেট/ মেল্ভেট/ ট্যামিক ভেট/ মেল্ভেট-প্লাস/ আস্তা ভেট/ নিনাড্রিল ভেট/ প্রমাস্ট ভেট/ বায়োগাট ভেট/ জিস-ভেট\n ",style: TextStyle(fontWeight: FontWeight.bold),)),
                            ]
                        ),

                        TableRow(
                            children: [
                              TableCell(child: Text("লামপি",textAlign: TextAlign.center,style: TextStyle(fontSize: 18,fontWeight:FontWeight.bold,),)),
                              TableCell(child: Text(" \nট্রিজন ভেট/পিফারভেট\n ",style: TextStyle(fontWeight: FontWeight.bold))),

                            ]
                        ),
                        TableRow(
                            children: [
                              TableCell(child: Text("আই বি কে/\nপিংক আই",textAlign: TextAlign.center,style: TextStyle(fontSize: 18,fontWeight:FontWeight.bold,),)),
                              TableCell(child: Text(" \n২% বোরিক এসিড, ওপসোফেনোকাল (চোখের ড্রপ),সুপরাফেন (চোখের ড্রপ), ক্লোরাম্যাক্স (চোখের ড্রপ), ওটিট্রা-ভেট (ইঞ্জেকশান), টেকোমাইসিন এল এ (ইঞ্জেকশান)\n ",style: TextStyle(fontWeight: FontWeight.bold))),

                            ]
                        ),


                        TableRow(
                            children: [
                              TableCell(child: Text("ক্ষুরা রোগ",textAlign: TextAlign.center,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)),
                              TableCell(child: Text(" \nএফএমডি কিউর ভেট/ এসপি ভেট/ কমপিভেন ভেট/  ট্রাইজন ভেট/ মক্সিলিন ভেট/সালফাইট/   ট্যামিক ভেট/ কেটো-এ ভেট/ মেল্ভেট/ মেল্ভেট প্লাস/  আস্তা-ভেট/  নিনাড্রিল ভেট/ জিস- ভেট/ ই-ভেট প্লাস\n",style: TextStyle(fontWeight: FontWeight.bold))),

                            ]
                        ),

                        TableRow(
                            children: [
                              TableCell(child: Text("বাদলা",textAlign: TextAlign.center,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)),
                              TableCell(child: Text("কম্বিপেন-ভেট/ট্রিজন ভেট/মক্সিলিন-ভেট/ফাস্ট-ভেট/এসটা ভেট/ফেনাড্রিল-ভেট/টামিক-ভেট/কেটো-এ ভেট/মেল-ভেট প্লাস/ একমি নরমাল স্যালাইন\n",style: TextStyle(fontWeight: FontWeight.bold))),

                            ]

                        ),

                        TableRow(
                            children: [
                              TableCell(child: Text("গলাফুলা",textAlign: TextAlign.center,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)),
                              TableCell(child: Text("\nট্রিজন ভেট/ টাইফুর ভেট/ মক্সিলি ভেট/ সুলফাসল ভেট/ এস পি ভেট/ ফাস্ট ভেট/ টামিক ভেট/ কেটো-এ ভেট/ ফেনাড্রাইল ভেট/ এ- কোল্ড ভেট/ ডিলোরিস ভেট/ ব্রনকোভেট/ ভিটা এ-ডি-ই ভেট\n",style: TextStyle(fontWeight: FontWeight.bold))
                              ),]
                        ),
                        TableRow(
                            children: [
                              TableCell(child: Text("তড়কা",textAlign: TextAlign.center,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)),
                              TableCell(child: Text("\nসুনির্দিষ্ট কোনো চিকিৎসা নেই।তবে নিজে প্রাথমিক অবস্থায় উপসর্গ নিয়ন্ত্রণের জন্য কমবিপেন ভেট/ এস-পি ভেট এর সাথে ফাস্ট ভেট/ মেল ভেট/ মেল ভেট প্লাস/ টামিক ভেট/ কেটো-এ ভেট/ এস্টা ভেট/ ফেনাড্রাইল ভেট দিয়ে চিকিৎসা করা যেতে পারে ।\n",style: TextStyle(fontWeight: FontWeight.bold))),
                            ]
                        ),
                        TableRow(
                            children: [
                              TableCell(child: Text("গোবসন্ত রোগ",textAlign: TextAlign.center,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)),
                              TableCell(child: Text("\nসুনির্দিষ্ট কোন চিকিৎসা নেই। তবে রোগের প্রাথমিক অবস্থায় টাইফুর ভেট/ ট্রাইজন ভেট/ জেন্টা-১০ ভেট/ এসপি ভেট/ সালফাসল ভেট দিয়ে চিকিৎসা করা যেতে পারে।\n",style: TextStyle(fontWeight: FontWeight.bold))
                              ),]
                        ),
                        TableRow(
                            children: [
                              TableCell(child: Text("ডায়ারিয়া",textAlign: TextAlign.center,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)),
                              TableCell(child: Text("\nডাইরোভেট/ সিপ্র- এ ভেট/ সালফাডিন ভেট/ মেল্ভেট/ ট্যামিক ভেট/ গ্লুকোসাইট ভেট/ বায়োগাট ভেট/ জিস- ভেট\n",style: TextStyle(fontWeight: FontWeight.bold))
                              ),]
                        ),
                        TableRow(
                            children: [
                              TableCell(child: Text("পেট ফাঁপা",textAlign: TextAlign.center,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)),
                              TableCell(child: Text("\nব্লোট স্টপ ভেট/ বভি কেয়ার ভেট/ জিমোভেট/ বায়োগাট ভেট\n",style: TextStyle(fontWeight: FontWeight.bold))
                              ),]
                        ),
                        TableRow(
                            children: [
                              TableCell(child: Text("কোষ্ঠকাঠিন্য/\nইমপ্যাকশন",textAlign: TextAlign.center,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)),
                              TableCell(child: Text("\nঅক্সিকোন-এস ভেট/ ম্যাগভেট প্লাস/ ম্যাগভেট/ বভি কেয়ার ভেট\n",style: TextStyle(fontWeight: FontWeight.bold))
                              ),]
                        ),
                        TableRow(
                            children: [
                              TableCell(child: Text("অরুচি",textAlign: TextAlign.center,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)),
                              TableCell(child: Text("\nআনোরা ভেট/ আনোরা ডিএস ভেট/ জিস- ভেট/ ভি-প্লাস ভেট/ ভি-প্লেক্স প্লাস ভেট/ বায়গাট ভেট\n",style: TextStyle(fontWeight: FontWeight.bold))
                              ),]
                        ),
                        TableRow(
                            children: [
                              TableCell(child: Text("বদহজম",textAlign: TextAlign.center,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)),
                              TableCell(child: Text("\nবায়োগাট ভেট/ জাইমোভেট/ বভি কেয়ার ভেট/ রুমিগেস্ট ভেট/ গ্লুকোলাইট ভেট/ হেপাফিট ভেট/ হেপাটোভেট।\n",style: TextStyle(fontWeight: FontWeight.bold))
                              ),]
                        ),
                        TableRow(
                            children: [
                              TableCell(child: Text("গোলকৃমি",textAlign: TextAlign.center,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)),
                              TableCell(child: Text("\nনাইট্রক্স-এ ভেট/ এলটি ভেট/এলটি ভেট ডিএস/ এ-ম্যাকটিন প্লাস ভেট/ হেপাফিট প্লাস ভেট/ হেপাটোভেট/ ফেরোভেট/ ভি-প্লেক্স ভেট প্লাস/ ভিটা- এডিই ভেট/জিস-ভেট।\n",style: TextStyle(fontWeight: FontWeight.bold))
                              ),]
                        ),
                        TableRow(
                            children: [
                              TableCell(child: Text("মিল্ক ফিভার/দধুজ্বর",textAlign: TextAlign.center,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)),
                              TableCell(child: Text("\nডিক্যাম ভেট, ভিটা-ডি প্লাস ভেট/ সিপি- ভেট/ সিপি-ভেট প্লাস/ একমি ডেক্সট্রোজ/ একমি গ্লুকোজ স্যালাইন\n",style: TextStyle(fontWeight: FontWeight.bold))
                              ),]
                        ),
                        TableRow(
                            children: [
                              TableCell(child: Text("নিউমোনিয়া",textAlign: TextAlign.center,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)),
                              TableCell(child: Text("\nটিফুল-ভেট/ট্রাইজন ভেট/মক্সিলিন ভেট/ সালফাসল ভেট/ আস্তা- ভেট/ নিনাড্রিল ভেট/ট্যামিক ভেট/ কেট-এ ভেট/ মেল্ভেট/মেল্ভেট-প্লাস/ স্টেরন ভেট/ এ- কোল্ড ভেট/ ডিলরেস ভেট/ ব্রঙ্ক ভেট\n",style: TextStyle(fontWeight: FontWeight.bold))
                              ),]
                        ),
                        TableRow(
                            children: [
                              TableCell(child: Text("বাছুরের সাদা উদরাময় ",textAlign: TextAlign.center,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)),
                              TableCell(child: Text("\nট্রাইজন ভেট/ মক্সিলিন ভেট/ সিপ্র-এ ভেত/সালফাডিন ভেট/ টেট্রাভেট, গ্লুকসাইট ভেট, ট্যামিক ভেট/ কেট-এ ভেট/ মেল্ভেট, বায়োগাট ভেট, জিস- ভেট\n",style: TextStyle(fontWeight: FontWeight.bold))
                              ),]
                        ),
                        TableRow(
                            children: [
                              TableCell(child: Text("কিটোসিস",textAlign: TextAlign.center,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)),
                              TableCell(child: Text("\nনাইট্রক্স-এ ভেট/ এলটি ভেট/এলটি ভেট ডিএস/ এ-ম্যাকটিন প্লাস ভেট/ হেপাফিট প্লাস ভেট/ হেপাটোভেট/ ফেরোভেট/ ভি-প্লেক্স ভেট প্লাস\n",style: TextStyle(fontWeight: FontWeight.bold))
                              ),]
                        ),

                      ],)
                ),
              ]),
        ));
  }
}
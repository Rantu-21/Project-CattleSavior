import 'package:flutter/material.dart';

class Vet_info extends StatelessWidget {
  const Vet_info({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title:const Text("চিকিৎসকদের তথ্য সমূহ",style: TextStyle(fontWeight: FontWeight.bold),),
        ),
        body:
        SingleChildScrollView(
                child: Container(
                    padding: const EdgeInsets.all(15),
                    child:Table(
                      border: TableBorder.all(width:1, color:Colors.black45), //table border
                      children: const [
                        TableRow(
                            children: [
                              TableCell(child: Text("\nমিজানুর রহমান তারফদার\nউপ-সহকারী প্রাণী-সম্পদ কমকর্তা (সম্প্রসারণ),উপজেলা প্রাণী-সম্পদ আফিস,আশুগঞ্জ\nযোগাযোগ: 01733533418\n",textAlign: TextAlign.center,style: TextStyle(fontSize: 20,fontWeight:FontWeight.bold),)),
                            ]
                        ),
                        TableRow(
                            children: [
                              TableCell(child: Text("\nড. মোঃ লুৎফর রহমান\nভেটেরিনারি সার্জন, সেন্ট্রাল ভেটেরিনারি হাসপাতাল- ঢাকা।\n চেম্বার: বাড়ি-৪৯ রোড-১৩, নিকুঞ্জ-২, খিলক্ষেত,  ঢাকা।\nযোগাযোগ:  01552457085, 01731492093\n",textAlign: TextAlign.center,style: TextStyle(fontSize: 20,fontWeight:FontWeight.bold),)),
                            ]
                        ),
                        TableRow(
                            children: [
                              TableCell(child: Text("\nডাঃ সুশ্যাম বিশ্বাস\nPAW লাইফ কেয়ার, 1/12, ব্লক-জি, লালমাটিয়া, ঢাকা।\nযোগাযোগ: 01909617994\n",textAlign: TextAlign.center,style: TextStyle(fontSize: 20,fontWeight:FontWeight.bold),)),
                            ]
                        ),
                        TableRow(
                            children: [
                              TableCell(child: Text("\nডাঃ মোঃ মাহবুবুল আলম ভূঁইয়া\nসেন্ট্রাল ভেটেরিনারি হাসপাতাল, চেম্বারের ঠিকানা: ৬৭/২, উত্তর বাশাবু, খিলগাঁও, ঢাকা।\nযোগাযোগ: 01711146012\n",textAlign: TextAlign.center,style: TextStyle(fontSize: 20,fontWeight:FontWeight.bold),)),
                            ]
                        ),
                        TableRow(
                            children: [
                              TableCell(child: Text("\nসুলতান উদ্দিন ভূঁইয়া\nউপ-সহকারী প্রাণিসম্পদ কর্মকর্তা(সম্প্রসারণ),প্রেষণ, উপজেলা প্রাণিসম্পদ দপ্তর ভেটেরিনারী হাসপাতাল,আশুগঞ্জ ব্রাহ্মণবাড়িয়ায়\nযোগাযোগ: 01718485788\n",textAlign: TextAlign.center,style: TextStyle(fontSize: 20,fontWeight:FontWeight.bold),)),
                            ]
                        ),
                        TableRow(
                            children: [
                              TableCell(child: Text("\nশশাংক দাস\nএফ,এ(এ/আই),উপজেলা প্রানীসম্পদ দপ্তর ও ভেটেরিনারী হাসপাতাল ,আশুগঞ্জ,ব্রাহ্মণবাড়িয়া\nযোগাযোগ: 01781721388\n",textAlign: TextAlign.center,style: TextStyle(fontSize: 20,fontWeight:FontWeight.bold),)),
                            ]
                        ),
                        TableRow(
                            children: [
                              TableCell(child: Text("\nশংকর বর্ধন\nএফ,এ(এ/আই), উপজেলা প্রানীসম্পদ দপ্তর ও ভেটেরিনারী হাসপাতাল,সরাইল,ব্রাহ্মণবাড়িয়া\nযোগাযোগ: 01751644737\n",textAlign: TextAlign.center,style: TextStyle(fontSize: 20,fontWeight:FontWeight.bold),)),
                            ]
                        ),
                        TableRow(
                            children: [
                              TableCell(child: Text("\nমনোয়ার হোসেন\nভি,এফ,এ ,উপজেলা প্রানীসম্পদ দপ্তর ভেটেরিনারী হাসপাতাল, সরাইল,ব্রাহ্মণবাড়িয়া\nযোগাযোগ: 01610177736\n",textAlign: TextAlign.center,style: TextStyle(fontSize: 20,fontWeight:FontWeight.bold),)),
                            ]
                        ),
                        TableRow(
                            children: [
                              TableCell(child: Text("\nমোঃ ওয়ালী হোসেন\nভি,এফ, এ (অব:),উপজেলা প্রানীসম্পদ দপ্তর ভেটেরিনারী হাসপাতাল, সরাইল, ব্রাহ্মণবাড়িয়া\nযোগাযোগ: 01718902435\n",textAlign: TextAlign.center,style: TextStyle(fontSize: 20,fontWeight:FontWeight.bold),)),
                            ]
                        ),
                        TableRow(
                            children: [
                              TableCell(child: Text("\nমোঃ হাবিবুল হক\nউপ-সহকারী প্রানীসম্পদ কর্মকর্তা (সম্প্রসারণ)(অব:), উপজেলা প্রানীসম্পদ ও দপ্তর ভেটেরিনারী হাসপাতাল, সরাইল, ব্রাহ্মণবাড়িয়া\nযোগাযোগ: 01749189937\n",textAlign: TextAlign.center,style: TextStyle(fontSize: 20,fontWeight:FontWeight.bold),)),
                            ]
                        ),
                        TableRow(
                            children: [
                              TableCell(child: Text("\nআবু সাঈদ\nউপ-সহকারী প্রানীসম্পদ কর্মকর্তা(সম্প্রসারণ), উপজেলা প্রানী সম্পদ দপ্তর ও ভেটেরিনারী হাসপাতাল, সদর, ব্রাহ্মণবাড়িয়া\nযোগাযোগ: 01818614575\n",textAlign: TextAlign.center,style: TextStyle(fontSize: 20,fontWeight:FontWeight.bold),)),
                            ]
                        ),
                        TableRow(
                            children: [
                              TableCell(child: Text("\nমো:জাহের আলম\nএফ,এ (এ/আই) (স্বেচ্ছাসেবী), ব্রাহ্মণবাড়িয়া সদর, ব্রাহ্মণবাড়িয়া\nযোগাযোগ: 01786116042\n",textAlign: TextAlign.center,style: TextStyle(fontSize: 20,fontWeight:FontWeight.bold),)),
                            ]
                        ),
                        TableRow(
                            children: [
                              TableCell(child: Text("\nমোঃ আব্দুস সামাদ\nউপ-সহকারী প্রানীসম্পদ কর্মকর্তা (সম্প্রসারণ), উপজেলা প্রানী সম্পদ দপ্তর ও ভেটেরিনারী হাসপাতাল, নাসিরনগর, ব্রাহ্মণবাড়িয়া\nযোগাযোগ: 01719162763\n",textAlign: TextAlign.center,style: TextStyle(fontSize: 20,fontWeight:FontWeight.bold),)),
                            ]
                        ),
                        TableRow(
                            children: [
                              TableCell(child: Text("\nমোঃ হাবিবুর রহমান\nএফ,এ (এ/আই) (স্বেচ্ছাসেবী), আশুগঞ্জ উপজেলা ব্রাহ্মণবাড়িয়া\nযোগাযোগ: 01733929764\n",textAlign: TextAlign.center,style: TextStyle(fontSize: 20,fontWeight:FontWeight.bold),)),
                            ]
                        ),

                      ],)
                ),
              ),
        );
  }
}
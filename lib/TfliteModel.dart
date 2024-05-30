import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';

class TfliteModel extends StatefulWidget {
  const TfliteModel({Key? key}) : super(key: key);

  @override
  _TfliteModelState createState() => _TfliteModelState();
}

class _TfliteModelState extends State<TfliteModel> {
  File? _image;
  Map<String, dynamic>? _bestResult;
  bool imageSelect = false;

  @override
  void initState() {
    super.initState();
    loadModel();
  }

  Future loadModel() async {
    Tflite.close();
    String res = (await Tflite.loadModel(
      model: "assets/model.tflite",
      labels: "assets/labels.txt",
    ))!;
    print("Models loading status: $res");
  }

  Future imageClassification(File image) async {
    final List? recognitions = await Tflite.runModelOnImage(
      path: image.path,
      numResults: 6,
      threshold: 0.05,
      imageMean: 127.5,
      imageStd: 127.5,
    );

    if (recognitions != null && recognitions.isNotEmpty) {
      final bestRecognition = recognitions.reduce((curr, next) {
        return curr['confidence'] > next['confidence'] ? curr : next;
      });

      setState(() {
        _bestResult = Map<String, dynamic>.from(bestRecognition);
        _image = image;
        imageSelect = true;
      });
    }
  }

  Future pickImageFromCamera() async {
    await _deletePreviousImage(); // Delete the previously selected image
    final ImagePicker _picker = ImagePicker();
    final XFile? pickedFile = await _picker.pickImage(
      source: ImageSource.camera,
    );
    if (pickedFile != null) {
      File image = File(pickedFile.path);
      imageClassification(image);
    }
  }

  Future pickImageFromGallery() async {
    await _deletePreviousImage(); // Delete the previously selected image
    final ImagePicker _picker = ImagePicker();
    final XFile? pickedFile = await _picker.pickImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      File image = File(pickedFile.path);
      imageClassification(image);
    }
  }

  Future<void> _deletePreviousImage() async {
    if (_image != null && await _image!.exists()) {
      await _image!.delete();
    }
  }

  @override
  void dispose() {
    _deletePreviousImage(); // Ensure the image is deleted when the widget is disposed
    super.dispose();
  }

  Widget buildResultCard(Map<String, dynamic> result) {
    String diagnosis;
    Widget treatment;
    Color borderColor;

    switch (result['label']) {
      case 'LSD':
        borderColor = Colors.redAccent;
        diagnosis = "রোগ: লাম্পি চর্ম রোগ (Lumpy)";
        treatment = Text(
          "১) আক্রান্ত প্রাণীর ফোস্কা বা গুটি ফেঁটে গেলে Povisep solution বা আয়োডিন মিশ্রণ দিয়ে পরিষ্কার করতে হবে।\n"
              "২) ফোস্কাগুলি না ফাটলে ঐ গুলির উপর (চামড়ার উপরে) Povisep solution বা আয়োডিন দিয়ে রং এর মত প্রলেপ দেয়া যায়।\n"
              "৩) আক্রান্ত প্রাণীকে প্রচুর পানি বা চিটা গুড়ের সরবত খাওয়াতে হবে।\n"
              "৪) বিভিন্ন মিনারেল মিশ্রণ যেমন- ফেরাস সালফেট, কপার সালফেট, কোবাল্ট মিশ্রণ, জিংক মিশ্রণ খাওয়াতে হবে।\n"
              "৫) ভিটামিন-বি ইনজেকশনের মাধ্যমে এবং এন্টিহিসটামিন (Antihistamin), ব্যথানাশক (Painkiller), এন্টিপাইরেটিক (Antipyretic) ঔষধ প্রাণীকে দিতে হবে। প্রয়োজন হলে এন্টিবায়োটিক ব্যবহার করা যেতে পারে।\n",
          style: TextStyle(
            fontSize: 18,
            color: Colors.black87,
            height: 1.5,
          ),
        );
        break;
      case 'FMD':
        borderColor = Colors.orangeAccent;
        diagnosis = "রোগ: ক্ষুরা রোগ (Foot and Mouth)";
        treatment = Text(
          "১) ভেটেরিনারি চিকিৎসকের পরামর্শে নিন্মলিখিত ব্যবস্থাদি গ্রহণ করা যেতে পারে\n"
              "২) পশুর মুখে ও পায়ে ঘা হলে হালকা গরম পানিতে ফিটকিরি গুড়ো করে ১ গ্রাম ১ লিটার পানিতে বা পটাশিয়াম পারম্যাঙ্গানেট ১ গ্রাম/১০ লিটার পানিতে এর যেকোন একটি দ্বারা ক্ষতস্থান পরিস্কার করতে হবে। অতঃপর Sulphanilamide Powder এবং Doxacycline Powder আক্রান্ত স্থান ভালভাবে জীবাণুনাশক দ্বারা ধুয়ে দিনে ২ বার নারিকলে তৈল এর সাথে মিশিয়ে পেষ্ট তৈরী করে লাগাতে হবে।\n",
          style: TextStyle(
            fontSize: 18,
            color: Colors.black87,
            height: 1.5,
          ),
        );
        break;
      case 'IBK':
        borderColor = Colors.blueAccent;
        diagnosis = "রোগ: সংক্রামক বোভাইন কেরাটোকনজাংটিভাইটিস রোগ (IBK)";
        treatment = Text(
          "১। সংক্রমণ কমাতে আক্রান্ত পশুকে যত দ্রুত সম্ভব আলাদা করুন।\n"
              "২। খেয়াল রাখুন চোখে যেন মশা, মাছি এবং অন্যান্য কিটপতঙ্গ বসতে না পারে।\n"
              "৩। চোখে যেন সূর্যের তীব্র আলো না পরে।\n"
              "৪। চিকিৎসকের পরামর্শ অনুযায়ী ঔষধ ব্যবহার করুন।\n",
          style: TextStyle(
            fontSize: 18,
            color: Colors.black87,
            height: 1.5,
          ),
        );
        break;
      default:
        borderColor = Colors.grey;
        diagnosis = "কোনো রোগ শনাক্ত করা যায়নি";
        treatment = RichText(
          text: TextSpan(
            text: 'এক্ষেত্রে কোনো তাৎক্ষনিক প্রাথমিক চিকিৎসা এর প্রয়োজন নেই।\n',
            style: TextStyle(
              fontSize: 18,
              color: Colors.black87,
              height: 1.5,
            ),
            children: <TextSpan>[
              TextSpan(
                text: 'কিন্তু এই অ্যাপ শুধু নিচের ৩ টি রোগ শনাক্ত করতে পারে-\n',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              TextSpan(
                text: '১। লামপি চর্ম রোগ (LSD)\n'
                    '২। ক্ষুরা রোগ (FMD)\n'
                    '৩। গরুর গোলাপি চোখ রোগ (IBK)\n',
              ),
            ],
          ),
        );
    }

    return Card(
      margin: EdgeInsets.all(10),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(color: borderColor, width: 2),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Text(
                diagnosis,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: borderColor,
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              "তাৎক্ষনিক প্রাথমিক চিকিৎসাঃ",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                decoration: TextDecoration.underline,
              ),
            ),
            SizedBox(height: 10),
            treatment,
            SizedBox(height: 10),
            Text(
              "*** প্রয়োজনে যত দ্রুত সম্ভব ডাক্তারের পরামর্শ নিন।",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("রোগ শনাক্তকরণ"),
      ),
      body: ListView(
        children: [
          if (imageSelect)
            Container(
              margin: const EdgeInsets.all(10),
              child: Image.file(_image!),
            )
          else
            Container(
              margin: const EdgeInsets.all(5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "রোগাক্রান্ত ছবি নির্বাচন করুন",
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 25,
                      height: 1.5,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 15),
                  Image.asset('assets/detectionsample.jpg'),
                ],
              ),
            ),
          if (imageSelect && _bestResult != null)
            SingleChildScrollView(
              child: Column(
                children: [buildResultCard(_bestResult!)],
              ),
            ),
        ],
      ),
      floatingActionButton: imageSelect
          ? null
          : Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: pickImageFromCamera,
            tooltip: "Take Photo",
            child: const Icon(Icons.camera_alt),
          ),
          SizedBox(height: 10),
          FloatingActionButton(
            onPressed: pickImageFromGallery,
            tooltip: "Pick from Gallery",
            child: const Icon(Icons.photo_library),
          ),
        ],
      ),
    );
  }
}

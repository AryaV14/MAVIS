import 'package:mavis/feature_box.dart';
import 'package:mavis/pallete.dart';
import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final speechToText = SpeechToText();
  String lastWords = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initSpeechToText();
  }

  Future<void> initSpeechToText() async {
    try {
    await speechToText.initialize();
    print('SpeechToText initialized.');
  } catch (e) {
    print('SpeechToText initialization failed: $e');
  }
    setState(() {});
  }

  Future<void> startListening() async {
  try {
    await speechToText.listen(onResult: onSpeechResult, localeId: '',);
  } catch (e) {
    print('Error starting speech recognition: $e');
  }
  setState(() {});
}

  // Future<void> startListening() async {

  //   await speechToText.listen(
  //   onResult: onSpeechResult,
  //   localeId: '',
  // );
  //   setState(() {});
  // }

  Future<void> stopListening() async {
    await speechToText.stop();
    setState(() {});
  }

  void onSpeechResult(SpeechRecognitionResult result) {
    setState(() {
      lastWords = result.recognizedWords;
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    speechToText.stop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mavis'),
        leading: const Icon(Icons.menu),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //profile
            Stack(
              children: [
                Center(
                  child: Container(
                    height: 150,
                    width: 130,
                    margin: const EdgeInsets.only(top: 4),
                    decoration: const BoxDecoration(
                      color: Pallete.assistantCircleColor,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                Container(
                  height: 145,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage('assets/images/assist1.png'),
                    ),
                  ),
                ),
              ],
            ),

            //chat bubble
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 10,
              ),
              margin: const EdgeInsets.symmetric(horizontal: 40).copyWith(
                top: 10,
              ),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Pallete.whiteColor,
                ),
                borderRadius: BorderRadius.circular(20).copyWith(
                  topLeft: Radius.zero,
                ),
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0),
                child: Text(
                  'Good Morning Arya,\nWhat can I do for you?',
                  style: TextStyle(
                    color: Pallete.assistantCircleColor,
                    fontSize: 25,
                    fontFamily: 'Cera Pro',
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.only(
                left: 40,
                top: 10,
              ),
              child: const Text(
                'Here are a few features',
                style: TextStyle(
                  fontFamily: 'Cera Pro',
                  color: Pallete.whiteColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            //features list
            Column(
              children: const [
                FeatureBox(
                  color: Pallete.firstSuggestionBoxColor,
                  HeaderText: 'ChatGPT',
                  Description:
                      'A smarter way to stay organized and informed with ChatGPT',
                ),
                FeatureBox(
                  color: Pallete.secondSuggestionBoxColor,
                  HeaderText: 'Dall-E',
                  Description:
                      'Get inspired and stay creative with your personal assistant powered by Dall-E',
                ),
                FeatureBox(
                  color: Pallete.thirdSuggestionBoxColor,
                  HeaderText: 'Smart Voice Assistant',
                  Description:
                      'Get the best of both worlds with a voice assistant powered by Dall-E and ChatGPT',
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Pallete.firstSuggestionBoxColor,
        onPressed: () async {
          if (await speechToText.hasPermission && speechToText.isNotListening) {
            await startListening();

          } else if (speechToText.isListening) {
            await stopListening();
          } else {
            initSpeechToText();
        //   }else {
        //     print("The user has denied the use of speech recognition.");
         }
        },
        child: const Icon(
          Icons.mic,
          color: Pallete.blackColor,
        ),
      ),
    );
  }
}

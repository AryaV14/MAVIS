import 'package:mavis/pallete.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Mavis'),
          leading: const Icon(Icons.menu),
          centerTitle: true,
        ),
        body: Column(
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
                            shape:BoxShape.circle,
                          ),
                      ),
                ),
                Container(
                  height: 145,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(image: AssetImage(
                      'assets/images/assist1.png'
                      ),
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
              margin:const EdgeInsets.symmetric(horizontal: 40).copyWith(
                top: 30,
              ),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Pallete.whiteColor,
                ),
                borderRadius: BorderRadius.circular(20).copyWith(
                  topLeft: Radius.zero,
                ),
              ),
             child : const Padding(
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

            //suggestions list

            
          ],
        ),
      );
  }
}

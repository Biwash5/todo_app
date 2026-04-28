import 'package:flutter/material.dart';
import 'package:todo_app/home_screen.dart';

class MySplashScreen extends StatelessWidget {
  const MySplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var figmaWidth = 360;
    var figmaHeight = 640;
    var widthRatio = MediaQuery.of(context).size.width / figmaWidth;
    var heightRatio = MediaQuery.of(context).size.height / figmaHeight;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
                width: 350 * widthRatio,
                height: 250 * heightRatio,
                child: Image.asset('assets/Landing.png')),
          ),
          SizedBox(
            height: 50 * heightRatio,
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 63 * widthRatio,
              right: 53 * widthRatio,
            ),
            child: Text(
              'Make your day easier with ToDo',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),
          SizedBox(
            height: 5 * heightRatio,
          ),
          const Text(
            'Todo list in one click',
            style: TextStyle(fontWeight: FontWeight.normal, fontSize: 15),
          ),
          SizedBox(
            height: 60 * heightRatio,
          ),
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => HomeScreen()));
            },
            child: Container(
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 229, 144, 60),
                    borderRadius: BorderRadius.circular(10)),
                width: 250 * widthRatio,
                height: 50 * heightRatio,
                child: const Center(
                  child: Text(
                    'Get Started',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                )),
          )
        ],
      ),
    );
  }
}

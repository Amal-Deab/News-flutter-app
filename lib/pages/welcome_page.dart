import 'package:flutter/material.dart';
import 'package:newsapp/pages/home.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          children: [
            Material(
              elevation: 4.0,
              borderRadius: BorderRadius.circular(30),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image.asset('assets/welcome.jpg',
                    height: MediaQuery.of(context).size.height / 1.6,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'News from around the\n       world for you',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w900),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              'Best time to read, Take your time to read\n    alittle more of this world',
              style: TextStyle(color: Colors.black54, fontSize: 18),
            ),
            SizedBox(
              height: 40,
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => Home()),
                    (route) => false);
              },
              child: Material(
                elevation: 4.0,
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 13),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.green),
                  width: MediaQuery.of(context).size.width / 1.6,
                  child: Center(
                      child: Text(
                    'Get Started',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w700),
                  )),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

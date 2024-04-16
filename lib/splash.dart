
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:covid_19/home.dart';
import 'dart:math' as math;


class splash extends StatefulWidget {
static String id='splash';
  const splash({super.key});

  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash>with TickerProviderStateMixin {

  late AnimationController controller=AnimationController(
    duration: Duration(seconds: 5),
      vsync:this )..repeat();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Timer(Duration(seconds: 5),
        ()=>
      Navigator.pushNamed(context, home.id)
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            AnimatedBuilder(
              animation: controller,
              child: Container(child: Center(child:CircleAvatar(
                backgroundImage: AssetImage('images/covid.jpg'),
                radius: 80,
              ),
              )
                ,),
              builder: (BuildContext ,Widget?child){
                return Transform.rotate(angle: controller.value *5.0*math.pi,
                  child: child,
                );
              }
          ),
            SizedBox(height: 30,),
            Center(child: Text('Covid Tracker',
              style: TextStyle(fontSize: 30,fontWeight: FontWeight.w700,
              ),),),

          ],

        ),
      ),
      );

  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../common/color_extention.dart';
import '../maps/map.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 40),

              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                height: 50,
                child: Row(
                  children: [
                    Text(
                      'ZEO',
                      style: TextStyle(
                          color: TColor.primary,
                          fontSize: 40,
                          fontWeight: FontWeight.bold),
                    ),
                    const Text(
                      ' helper',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 35,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),

               Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  Image.asset(
                    "assets/img/gps.png",
                    height: 40,
                    width: 40,
                  ),
                  const SizedBox(width: 10),
                  const Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Kafr El-Shaikh',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Qism, Kafr el-Sheikh, Gharbia Governorate',
                        style: TextStyle(color: Colors.black, fontSize: 12),
                      ),
                    ],
                  )
                ],
              ),

              const SizedBox(height: 70),
              Center(child: Text('Services',style: TextStyle(color: TColor.black,fontSize: 35,),)),
              const SizedBox(height: 20),

              Center(child: Text('Go anywhere, get anything',style: TextStyle(color: TColor.black,fontSize: 18,),)),

              const SizedBox( height: 60,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center, // Center the content in the row
                children: [
                  Container(
                    width: 120.0,
                    height: 120.0,
                    decoration: BoxDecoration(
                      color: Colors.grey[200], // Adjust background color as needed
                      borderRadius: BorderRadius.circular(25.0), // Set corner radius
                    ),
                    child:  Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/img/package.png",
                          height: 100,
                          width: 100,
                        ),
                        Text(
                          'Package',
                          style: TextStyle(color: Colors.black, fontSize: 12),)
                      ],
                    ),

                  ),
                  const SizedBox(width: 25.0), // Add spacing between squares
                  Container(
                    width: 120.0,
                    height: 120.0,
                    decoration: BoxDecoration(
                      color: Colors.grey[300], // Adjust background color as needed
                      borderRadius: BorderRadius.circular(25.0), // Set corner radius
                    ),
                    child:  Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        Image.asset(
                          "assets/img/helper.png",
                          height: 100,
                          width: 100,
                        ),

                        const Text(
                          'Helper',
                          style: TextStyle(color: Colors.black, fontSize: 12),)
                      ],
                    ),
                  ),
                ],
              ),

              Container(
                margin: const EdgeInsets.only(top: 20),
                width: 120.0,
                height: 120.0,
                decoration: BoxDecoration(
                  color: TColor.primary, // Adjust background color as needed
                  borderRadius: BorderRadius.circular(25.0), // Set corner radius
                ),
                child:  Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const MapScreen(),
                            ));
                      },
                      child:  const Text(
                        'Go',
                        style: TextStyle(color: Colors.black, fontSize: 20,fontWeight: FontWeight.bold),)
                    ),

                  ],
                ),
              ),
            ],
          )),
    );
  }
}

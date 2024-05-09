import 'package:flutter/material.dart';

import '../../common/color_extention.dart';

class ActivityScreen extends StatelessWidget {
  const ActivityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 40),

                const Text(
                  'Activity',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 35,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 40),
                Text(
                  "Upcoming",
                  style: TextStyle(
                    color: TColor.black,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  // margin: const EdgeInsets.symmetric(horizontal: 30),
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.grey[200], // Adjust background color as needed
                    borderRadius:
                        BorderRadius.circular(10.0), // Set corner radius
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(width: 20),
                      const Text(
                        'You have no avtivity now',
                        style: TextStyle(color: Colors.black, fontSize: 18),
                      ),
                      const SizedBox(width: 20),
                      Image.asset("assets/img/Werd_person.png")
                    ],
                  ),
                ),
                const SizedBox(height: 40),
                Text(
                  "Past",
                  style: TextStyle(
                    color: TColor.black,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius:
                    BorderRadius.circular(10.0), // Set corner radius
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [

                      Image.asset("assets/img/package.png",height: 40,width: 40,),
                      const SizedBox(width: 20),

                      const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Package Activity',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                            ),
                          ),
                          Text(
                            'Mar 15  - 12:14 AM - EG20.50',
                            style: TextStyle(color: Colors.black, fontSize: 18),
                          ),
                        ],
                      ),

                    ],
                  ),
                ),

                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius:
                    BorderRadius.circular(10.0), // Set corner radius
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [

                      Image.asset("assets/img/helper.png",height: 40,width: 40,),
                      const SizedBox(width: 20),

                      const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'ZEO Helper',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                            ),
                          ),
                          Text(
                            'Mar 15  - 12:14 AM - EG20.50',
                            style: TextStyle(color: Colors.black, fontSize: 18),
                          ),
                        ],
                      ),

                    ],
                  ),
                ),

                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius:
                    BorderRadius.circular(10.0), // Set corner radius
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [

                      Image.asset("assets/img/helper.png",height: 40,width: 40,),
                      const SizedBox(width: 20),

                      const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'ZEO Helper',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                            ),
                          ),
                          Text(
                            'Mar 15  - 12:14 AM - EG20.50',
                            style: TextStyle(color: Colors.black, fontSize: 18),
                          ),
                        ],
                      ),

                    ],
                  ),
                ),


                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius:
                    BorderRadius.circular(10.0), // Set corner radius
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [

                      Image.asset("assets/img/helper.png",height: 40,width: 40,),
                      const SizedBox(width: 20),

                      const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'ZEO Helper',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                            ),
                          ),
                          Text(
                            'Mar 15  - 12:14 AM - EG20.50',
                            style: TextStyle(color: Colors.black, fontSize: 18),
                          ),
                        ],
                      ),

                    ],
                  ),
                ),


              ],
            ),
          )),
    );
  }
}

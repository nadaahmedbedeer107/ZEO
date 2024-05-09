import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:zeo/common/color_extention.dart';

import '../../common_widget/round_textfield.dart';
import '../../common_widget/star_rating.dart';
import '../../common_widget/textfield.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final CameraPosition _initialCameraPosition = const CameraPosition(
    target: LatLng(31.1106593,30.9387799),
    zoom: 11.0,
  );
  TextEditingController txtComment = TextEditingController();

  bool _isBoxExpanded = false;
  bool _isBoxMain = false;
  bool _isEndBox = false;
  bool _isMessageBox = false;
  bool _isCancelBox = false;

  bool _isRemoveBox = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              "assets/img/gps.png",
              height: 40,
              width: 30,
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
                  style: TextStyle(color: Colors.black, fontSize: 11),
                ),
              ],
            )
          ],
        ),
        elevation: 0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
        ),
      ),
      body: Stack(
        children: [
          GoogleMap(

            initialCameraPosition: _initialCameraPosition,
          ),
          _oneBox(),
          !_isRemoveBox
              ? _isBoxMain
                  ? AnimatedPositioned(
                      top: _isBoxExpanded
                          ? (MediaQuery.of(context).size.height / 4)
                          : null,
                      bottom: !_isBoxExpanded ? 150.0 : null,
                      left: 20.0,
                      right: 20.0,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                      child: GestureDetector(
                        onTap: () {
                          _moveBox();
                        },
                        child: _buildBox("ZEO helper name", "01012345678",
                            "Using Bike", "15 minutes to arrive", "EG 30.00"),
                      ),
                    )
                  : Container()
              : Container(),
          !_isRemoveBox
              ? _isBoxMain
                  ? Positioned(
                      bottom: 20.0,
                      left: 0,
                      right: 0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          IconButton(
                            icon: Image.asset(
                              "assets/img/red.png",
                              height: 100,
                              width: 100,
                            ),
                            onPressed: () {
                              setState(() {
                                _cancelBox();
                              });
                            },
                          ),
                          IconButton(
                            icon: Image.asset(
                              "assets/img/green.png",
                              height: 100,
                              width: 100,
                            ),
                            onPressed: () {
                              setState(() {
                                _messageBox();
                              });
                            },
                          ),
                          IconButton(
                            icon: Image.asset(
                              "assets/img/blue.png",
                              height: 100,
                              width: 100,
                            ),
                            onPressed: () {
                              setState(() {
                                _endBox();
                              });
                            },
                          ),
                        ],
                      ),
                    )
                  : Container()
              : Container(),
          !_isRemoveBox
              ? !_isBoxMain
                  ? SingleChildScrollView(
                      child: Align(
                        alignment:
                            Alignment.center, // Center the column horizontally
                        child: Container(
                          width: double.infinity, // Set width to full screen
                          padding: const EdgeInsets.all(
                              20.0), // Add 20.0 padding on all sides

                          child: _buildBoxColumn(),
                        ),
                      ),
                    )
                  : Container()
              : Container(),
        ],
      ),
    );
  }

  Widget _oneBox() {
    if (_isEndBox) {
      return Positioned(
        top: (MediaQuery.of(context).size.height / 4),
        left: 20.0,
        right: 20.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: (MediaQuery.of(context).size.height / 3),
              width: (MediaQuery.of(context).size.width),
              padding: const EdgeInsets.symmetric(horizontal: 30),
              decoration: BoxDecoration(
                color: TColor.cardMap.withOpacity(0.6),
                // shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(28),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 100.0,
                    height: 100.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.black, // Adjust border color
                        width: 1.0, // Adjust border width
                      ),
                    ),
                    child: Image.asset(
                      "assets/img/profile_photo.png",
                      height: 70,
                      width: 70,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        'helper',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        ' ZEO ',
                        style: TextStyle(
                          color: TColor.primary,
                          fontSize: 20,
                        ),
                      ),
                      const Text(
                        'helper',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  StarRating(
                    maxRating: 5,
                    initialRating: 0,
                    onRatingChanged: (rating) {
                      print("Selected rating: $rating");
                    },
                  ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //   crossAxisAlignment: CrossAxisAlignment.center,
                  //   children: [
                  //     Image.asset(
                  //       "assets/img/star.png",
                  //     ),
                  //     Image.asset(
                  //       "assets/img/star.png",
                  //     ),
                  //     Image.asset(
                  //       "assets/img/star.png",
                  //     ),
                  //     Image.asset(
                  //       "assets/img/star.png",
                  //     ),
                  //     Image.asset(
                  //       "assets/img/star.png",
                  //     ),
                  //   ],
                  // ),
                  const SizedBox(
                    height: 30,
                  ),
                  RectangleTextfield(
                    hintText: " Comment ( Optional )",
                    controller: txtComment,
                    keyboardType: TextInputType.emailAddress,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 100,
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Container(
                height: 56,
                width: (MediaQuery.of(context).size.width / 1.5),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: const Color(0xffF72E2E),
                  borderRadius: BorderRadius.circular(28),
                ),
                child: Text(
                  "End",
                  style: TextStyle(
                      color: TColor.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ],
        ),
      );
    } else if (_isMessageBox) {
      return Positioned(
        top: (MediaQuery.of(context).size.height / 5),
        left: 20.0,
        right: 20.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: (MediaQuery.of(context).size.height / 2.2),
              width: (MediaQuery.of(context).size.width),
              padding: const EdgeInsets.symmetric(horizontal: 30),
              decoration: BoxDecoration(
                color: TColor.placeholder2,
                // shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(28),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Container(
                        width: 100.0,
                        height: 100.0,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.black, // Adjust border color
                            width: 1.0, // Adjust border width
                          ),
                        ),
                        child: Image.asset(
                          "assets/img/profile_photo.png",
                          height: 70,
                          width: 70,
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            alignment: Alignment.center,
                            width: (MediaQuery.of(context).size.width / 1.9),
                            height: 30.0,
                            decoration: BoxDecoration(
                              color: TColor.textfield,
                              borderRadius: BorderRadius.circular(28),
                            ),
                            child: Text(
                              'i need .... (anything)',
                              style: TextStyle(
                                color: TColor.primaryText,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Container(
                            width: 30.0,
                            height: 30.0,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.white, // Adjust border color
                                width: 1.0, // Adjust border width
                              ),
                            ),
                            child: Image.asset(
                              "assets/img/profile_photo.png",
                              height: 70,
                              width: 70,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  RoundTextfield(
                    hintText: "Send Mesage",
                    controller: txtComment,
                    keyboardType: TextInputType.emailAddress,
                    prefixIconImage: "assets/img/send2.png",
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            IconButton(
              icon: Image.asset(
                "assets/img/green.png",
                height: 100,
                width: 100,
              ),
              onPressed: () {
                setState(() {
                  _messageBox();
                });
              },
            ),
          ],
        ),
      );
    } else if (_isCancelBox) {
      return Positioned(
        top: (MediaQuery.of(context).size.height / 4),
        left: 20.0,
        right: 20.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: (MediaQuery.of(context).size.height / 3),
              width: (MediaQuery.of(context).size.width),
              padding: const EdgeInsets.symmetric(horizontal: 30),
              decoration: BoxDecoration(
                color: TColor.placeholder2,
                // shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(28),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Are you sure you want to cancel ?',
                    style: TextStyle(
                      color: TColor.primaryText,
                      fontSize: 17,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  RectangleTextfield(
                    hintText: " Reason Why ... ( Optional )",
                    controller: txtComment,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      height: 56,
                      width: (MediaQuery.of(context).size.width / 4),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: const Color(0xffF72E2E),
                        borderRadius: BorderRadius.circular(28),
                      ),
                      child: Text(
                        "Cancle",
                        style: TextStyle(
                            color: TColor.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 100,
            ),
            IconButton(
              icon: Image.asset(
                "assets/img/red.png",
                height: 100,
                width: 100,
              ),
              onPressed: () {
                setState(() {
                  _cancelBox();
                });
              },
            ),
          ],
        ),
      );
    } else {
      return Container();
    }
  }

  Widget _buildBoxColumn() {
    return Column(
      mainAxisSize: MainAxisSize.min, // Restrict column size
      children: [
        InkWell(
          onTap: () {
            setState(() {
              _mainBox();
            });
          },
          child: Container(
            height: 140.0,
            decoration: BoxDecoration(
              color: TColor.cardMap.withOpacity(0.6),
              // shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(28),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 100.0,
                  height: 100.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.black, // Adjust border color
                      width: 1.0, // Adjust border width
                    ),
                  ),
                  child: Image.asset(
                    "assets/img/profile_photo.png",
                    height: 70,
                    width: 70,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'ZEO helper name',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      '4 minutes to arrive',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      'EG 30.00',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 10.0), // Add spacing between boxes
        InkWell(
          onTap: () {
            setState(() {
              _mainBox();
            });
          },
          child: Container(
            height: 140.0,
            decoration: BoxDecoration(
              color: TColor.cardMap.withOpacity(0.6),
              // shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(28),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 100.0,
                  height: 100.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.black, // Adjust border color
                      width: 1.0, // Adjust border width
                    ),
                  ),
                  child: Image.asset(
                    "assets/img/profile_photo.png",
                    height: 70,
                    width: 70,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'ZEO helper name',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      '4 minutes to arrive',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      'EG 30.00',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 10.0),
        InkWell(
          onTap: () {
            setState(() {
              _mainBox();
            });
          },
          child: Container(
            height: 140.0,
            decoration: BoxDecoration(
              color: TColor.cardMap.withOpacity(0.6),
              // shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(28),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 100.0,
                  height: 100.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.black, // Adjust border color
                      width: 1.0, // Adjust border width
                    ),
                  ),
                  child: Image.asset(
                    "assets/img/profile_photo.png",
                    height: 70,
                    width: 70,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'ZEO helper name',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      '4 minutes to arrive',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      'EG 30.00',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 10.0),
        InkWell(
          onTap: () {
            setState(() {
              _mainBox();
            });
          },
          child: Container(
            height: 140.0,
            decoration: BoxDecoration(
              color: TColor.cardMap.withOpacity(0.6),
              // shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(28),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 100.0,
                  height: 100.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.black, // Adjust border color
                      width: 1.0, // Adjust border width
                    ),
                  ),
                  child: Image.asset(
                    "assets/img/profile_photo.png",
                    height: 70,
                    width: 70,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'ZEO helper name',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      '4 minutes to arrive',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      'EG 30.00',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildBox(String name, phone, car, time, price) {
    return Container(
      height: _isBoxExpanded ? 200 : 140,
      decoration: BoxDecoration(
        color: TColor.cardMap.withOpacity(0.6),
        borderRadius: BorderRadius.circular(28),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 100.0,
            height: 100.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.black, // Adjust border color
                width: 1.0, // Adjust border width
              ),
            ),
            child: Image.asset(
              "assets/img/profile_photo.png",
              height: 70,
              width: 70,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                ),
              ),
              _isBoxExpanded
                  ? Text(
                      phone,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                      ),
                    )
                  : const SizedBox(),
              _isBoxExpanded
                  ? Text(
                      car,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                      ),
                    )
                  : const SizedBox(),
              Text(
                time,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                ),
              ),
              Row(
                children: [
                  Text(
                    price,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                    ),
                  ),
                  const SizedBox(width: 10),
                  TextButton(
                    onPressed: () {
                      _moveBox();
                    },
                    child: Text(
                      _isBoxExpanded ? 'Less Details' : 'More Details',
                      style: TextStyle(color: TColor.primary),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _moveBox() {
    setState(() {
      _isBoxExpanded = !_isBoxExpanded;
    });
  }

  void _mainBox() {
    setState(() {
      _isBoxMain = !_isBoxMain;
    });
  }

  void _endBox() {
    setState(() {
      _isEndBox = !_isEndBox;
      _isRemoveBox = !_isRemoveBox;
    });
  }

  void _messageBox() {
    setState(() {
      _isMessageBox = !_isMessageBox;
      _isRemoveBox = !_isRemoveBox;
    });
  }

  void _cancelBox() {
    setState(() {
      _isCancelBox = !_isCancelBox;
      _isRemoveBox = !_isRemoveBox;
    });
  }
}

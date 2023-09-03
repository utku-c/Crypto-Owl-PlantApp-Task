import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:plant_app/constant/favorites_constant.dart';

import '../../../extension/svg_extensiion.dart';
import '../../../model/plant_model.dart';
import 'home_page_detail.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final double bottomShettHeight = 100;
  final double bottomShettIconSize = 25;

  List<PlantModel> constPlantList = [
    PlantModel(
        plantName: "dracaena trifasciata",
        description: "(in bedrooms windowsill)",
        frequencyOfWatering: 3,
        imageUrl: "assets/image/plant_1.png",
        category: "indoor",
        sunlight: "moderator"),
    PlantModel(
      plantName: "monstera deliciosa",
      description: "(in kitchens windowsill)",
      frequencyOfWatering: 3,
      imageUrl: "assets/image/plant_2.png",
      category: "?",
      sunlight: "?",
    ),
    PlantModel(
      plantName: "sansevieria cylindrica",
      description: "(in kitchens windowsill)",
      frequencyOfWatering: 3,
      imageUrl: "assets/image/plant_3.png",
      category: "?",
      sunlight: "?",
    ),
    PlantModel(
      plantName: "aloe vera",
      description: "(in kitchens windowsill)",
      frequencyOfWatering: 3,
      imageUrl: "assets/image/plant_4.png",
      category: "?",
      sunlight: "?",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColor.backgroundColor,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 26),
                child: SizedBox(
                  height:
                      MediaQuery.of(context).size.height - bottomShettHeight,
                  child: Column(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Container(
                          padding: const EdgeInsets.only(top: 30),
                          child: Stack(
                            children: [
                              Row(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Text(
                                        "My Plant",
                                        style: TextStyle(
                                          color: AppColor.titleTextColor,
                                          fontSize: 36,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width -
                                                130,
                                        height: 50,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: TextField(
                                          decoration:
                                              _textFieldInputDecoration(),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Positioned(
                                right: -60,
                                height: 160,
                                child: Align(
                                  child: Image.asset(
                                    alignment: Alignment.bottomRight,
                                    "assets/image/img.png",
                                    height: 270,
                                    width: 260,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 7,
                        child: SizedBox(
                          child: ListView.builder(
                            itemCount: constPlantList.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(
                                  bottom: 20,
                                ),
                                child: _cardContainer(context, index),
                              );
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                height: bottomShettHeight,
                decoration: BoxDecoration(
                  color: AppColor.backgroundOfBottomSheet,
                  borderRadius: BorderRadius.circular(bottomShettHeight / 2),
                  boxShadow: const [
                    BoxShadow(
                      spreadRadius: 0.20,
                      blurRadius: 10,
                      offset: Offset(0, -3),
                      color: AppColor.textColor,
                    )
                  ],
                ),
                child: _bottomSheetRow(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container _cardContainer(BuildContext context, int index) {
    return Container(
      height: 134,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HomePageDetail(
                  plantModel: constPlantList[index],
                ),
              ));
        },
        child: _plantContainer(index),
      ),
    );
  }

  InputDecoration _textFieldInputDecoration() {
    return InputDecoration(
      contentPadding: const EdgeInsets.only(
        top: 0,
        bottom: 0,
        right: 6,
        left: 10,
      ),
      suffixIcon: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SvgPicture.asset(
          "assets/svg/app_search_icon.svg",
        ),
      ),
      hintText: "Search by name or species",
      border: const OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.transparent,
        ),
      ),
      enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.transparent,
        ),
      ),
      disabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.transparent,
        ),
      ),
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.transparent,
        ),
      ),
    );
  }

  Row _bottomSheetRow() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          padding: const EdgeInsets.all(1),
          child: SvgPicture.asset(
            SvgEnum.home_home_icon.svgPath,
            width: 28,
            height: 28,
          ),
        ),
        Container(
          padding: const EdgeInsets.all(1),
          child: SvgPicture.asset(
            SvgEnum.home_flowerpot_icon.svgPath,
            width: 32,
            height: 36,
          ),
        ),
        Container(
          padding: const EdgeInsets.all(1),
          child: SvgPicture.asset(
            SvgEnum.home_profile_icon.svgPath,
            width: 30,
            height: 30,
          ),
        )
      ],
    );
  }

  Row _plantContainer(int index) {
    return Row(
      children: [
        Expanded(
          flex: 9,
          child: Container(
            padding: const EdgeInsets.only(left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  constPlantList[index].plantName.toString(),
                  style: const TextStyle(
                    color: AppColor.textColor,
                    fontSize: 16,
                  ),
                ),
                Text(
                  constPlantList[index].description.toString(),
                  style: TextStyle(
                    color: Colors.grey.shade500,
                    fontSize: 11,
                  ),
                ),
                const SizedBox(height: 20),
                _blueCardForDays(index)
              ],
            ),
          ),
        ),
        Expanded(
          flex: 4,
          child: Container(
            child: Image.asset(constPlantList[index].imageUrl.toString()),
          ),
        )
      ],
    );
  }

  Container _blueCardForDays(int index) {
    return Container(
      height: 30,
      width: 86,
      decoration: BoxDecoration(
        color: AppColor.raindropBackgroundColor,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            SvgEnum.app_raindrop_icon.svgPath,
            height: 13,
            width: 13,
          ),
          const SizedBox(width: 4),
          Text(
            "in ${constPlantList[index].frequencyOfWatering} days",
            style: const TextStyle(
              color: AppColor.raindropTextColor,
              fontSize: 13,
            ),
          )
        ],
      ),
    );
  }
}

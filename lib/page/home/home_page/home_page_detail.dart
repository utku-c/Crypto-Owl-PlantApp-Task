import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:plant_app/extension/svg_extensiion.dart';

import '../../../constant/favorites_constant.dart';
import '../../../model/plant_model.dart';

class HomePageDetail extends StatefulWidget {
  const HomePageDetail({
    super.key,
    required this.plantModel,
  });
  final PlantModel plantModel;

  @override
  State<HomePageDetail> createState() => _HomePageDetailState();
}

class _HomePageDetailState extends State<HomePageDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: Colors.white,
        leading: Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SvgPicture.asset(
              "assets/svg/icon_arrow.svg",
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: SvgPicture.asset(
              "assets/svg/icon_delete.svg",
              width: 25,
              height: 25,
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: _plantInformation(),
              ),
              Stack(
                children: [
                  SizedBox(
                    child: Image.asset(
                      "assets/image/home_detail_bacground.png",
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        const SizedBox(height: 40),
                        Row(
                          children: [
                            _cardForDayContainer(),
                          ],
                        ),
                        const SizedBox(height: 54),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              widget.plantModel.plantName.toString(),
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              widget.plantModel.description.toString(),
                              style: const TextStyle(
                                color: Colors.white70,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 50),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: _customButton(),
                        )
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
          Positioned(
            right: -20,
            child: Image.asset(
              widget.plantModel.imageUrl.toString(),
              fit: BoxFit.contain,
              height: 400,
              width: 200,
            ),
          )
        ],
      ),
    );
  }

  Container _customButton() {
    return Container(
      width: double.infinity,
      height: 90,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: const Center(
        child: Text(
          "Water",
          style: TextStyle(
            color: AppColor.textColor,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Column _plantInformation() {
    return Column(
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: 26,
              backgroundColor: const Color(0xFFEFEFEF),
              child: SvgPicture.asset("assets/svg/icon_window.svg"),
            ),
            const SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Category",
                  style: TextStyle(color: Colors.grey.shade500),
                ),
                Text(
                  widget.plantModel.category.toString(),
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                )
              ],
            )
          ],
        ),
        const SizedBox(height: 20),
        Row(
          children: [
            CircleAvatar(
              radius: 26,
              backgroundColor: const Color(0xFFEFEFEF),
              child: SvgPicture.asset("assets/svg/icon_raindrop.svg"),
            ),
            const SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Water",
                  style: TextStyle(color: Colors.grey.shade500),
                ),
                Text(
                  "every ${widget.plantModel.frequencyOfWatering.toString()} days",
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                )
              ],
            )
          ],
        ),
        const SizedBox(height: 20),
        Row(
          children: [
            CircleAvatar(
              radius: 26,
              backgroundColor: const Color(0xFFEFEFEF),
              child: SvgPicture.asset("assets/svg/icon_sun.svg"),
            ),
            const SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Sunlight",
                  style: TextStyle(color: Colors.grey.shade500),
                ),
                Text(
                  widget.plantModel.sunlight.toString(),
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                )
              ],
            )
          ],
        ),
      ],
    );
  }

  Container _cardForDayContainer() {
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
            "in ${widget.plantModel.frequencyOfWatering} days",
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

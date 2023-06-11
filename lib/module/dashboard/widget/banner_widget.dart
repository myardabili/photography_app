import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../shared/colors.dart';

class BannerWidget extends StatefulWidget {
  const BannerWidget({super.key});

  @override
  State<BannerWidget> createState() => _BannerState();
}

class _BannerState extends State<BannerWidget> {
  int currentIndex = 0;
  final CarouselController carouselController = CarouselController();
  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      List images = [
        "https://images.unsplash.com/photo-1522688306378-fbb315c6ba9a?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NXx8dmliZXN8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=600&q=60",
        "https://images.unsplash.com/photo-1603425013520-e0b30e6e37dc?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=871&q=80",
        "https://images.unsplash.com/photo-1612242879330-cd06b2696e56?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OHx8c3R1ZGlvJTIwcGhvdG9ncmFwaHl8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=600&q=60",
        "https://images.unsplash.com/photo-1560615253-8b8d1ea96363?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTV8fHZpYmVzfGVufDB8fDB8fHww&auto=format&fit=crop&w=600&q=60",
      ];
      return Column(
        children: [
          CarouselSlider(
            carouselController: carouselController,
            options: CarouselOptions(
              height: 180.0,
              autoPlay: true,
              enlargeCenterPage: false,
              viewportFraction: 1.0,
              onPageChanged: (index, reason) {
                currentIndex = index;
                setState(() {});
              },
            ),
            items: images.map((imageUrl) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.symmetric(horizontal: 20.0),
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(20.0),
                      ),
                      image: DecorationImage(
                        image: NetworkImage(
                          imageUrl,
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              );
            }).toList(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: images.asMap().entries.map((entry) {
              bool isSelected = currentIndex == entry.key;
              return GestureDetector(
                onTap: () => carouselController.animateToPage(entry.key),
                child: Container(
                  width: isSelected ? 40 : 6.0,
                  height: 6.0,
                  margin: const EdgeInsets.only(
                    right: 6.0,
                    top: 12.0,
                  ),
                  decoration: BoxDecoration(
                    color: isSelected
                        ? ColorsApp.mainColor
                        : const Color(0xff3c3e40),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(12.0),
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      );
    });
  }
}

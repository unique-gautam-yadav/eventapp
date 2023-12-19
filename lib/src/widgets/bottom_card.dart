import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../utils.dart';
import '../views/home_page.dart';
import 'event_card.dart';

class BottomCard extends StatelessWidget {
  const BottomCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 40),
      decoration: BoxDecoration(
        color: AppColors.darkColor.withOpacity(.8),
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(50),
        ),
      ),
      child: Column(
        children: [
          Container(
            height: 6,
            width: 80,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(.4),
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          const EventCard(),
          const SizedBox(height: 20),
          Expanded(
            child: SizedBox(
              width: double.infinity,
              child: Stack(
                children: [
                  Positioned.fill(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Image.asset(
                        'assets/images/img.jpeg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 10,
                    left: 10,
                    child: Container(
                      height: 35,
                      width: 35,
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade50.withOpacity(.3),
                        borderRadius: BorderRadius.circular(122),
                      ),
                    ),
                  ),
                  const Positioned(
                    top: 10,
                    left: 10,
                    height: 35,
                    width: 35,
                    child: Icon(
                      Icons.link,
                      color: Colors.white,
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    left: 10,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 4, horizontal: 8),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade50.withOpacity(.3),
                        borderRadius: BorderRadius.circular(122),
                      ),
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Iconsax.location,
                            color: Colors.white,
                          ),
                          SizedBox(width: 10),
                          Text(
                            "NYC, US",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 10,
                    right: 10,
                    child: Container(
                      height: 110,
                      width: 110,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade50.withOpacity(.3),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            top: 10,
                            left: 10,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.network(
                                "https://randomuser.me/api/portraits/men/50.jpg",
                                width: 55,
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 10,
                            right: 10,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.network(
                                "https://randomuser.me/api/portraits/men/90.jpg",
                                width: 55,
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 10,
                            left: 15,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 2,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(122),
                              ),
                              child: const Text(
                                "Live",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 135,
                    right: 25,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 2,
                        horizontal: 12,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade50.withOpacity(.3),
                        borderRadius: BorderRadius.circular(122),
                      ),
                      child: const Text(
                        "Online",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: AppColors.darkPink,
                borderRadius: BorderRadius.circular(20)),
            child: Row(
              children: [
                Container(
                  height: 60,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  decoration: BoxDecoration(
                    color: AppColors.darkColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        margin: const EdgeInsets.only(right: 15),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.white.withOpacity(.2),
                          ),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Iconsax.notification,
                          color: Colors.white,
                          size: 10,
                        ),
                      ),
                      Text.rich(
                        TextSpan(
                          children: [
                            highlight('21'),
                            unHighlight('h'),
                            highlight(':32'),
                            unHighlight("m"),
                            highlight(":56"),
                            unHighlight("s"),
                          ],
                        ),
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                AnimatedContainer(
                    duration: const Duration(milliseconds: 250),
                    curve: Curves.easeOut,
                    height: 50,
                    margin: const EdgeInsets.all(8),
                    decoration: ShapeDecoration(
                      color: Colors.white.withOpacity(.2),
                      shape: const StarBorder(
                        pointRounding: .9,
                        points: 5,
                        rotation: 20,
                      ),
                    ),
                    child: const Center(
                      child: Text("   🔗   "),
                    )),
                Expanded(
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 64,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Join the event",
                            style: TextStyle(
                              color: AppColors.darkColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(width: 5),
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: AppColors.darkColor.withOpacity(.2),
                              ),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Iconsax.arrow_down_14,
                              color: AppColors.darkColor,
                              size: 10,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

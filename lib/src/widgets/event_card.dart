import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:random_avatar/random_avatar.dart';

import '../utils.dart';
import 'app_buttons.dart';

class EventCard extends StatelessWidget {
  const EventCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 55,
              width: 55,
              decoration: BoxDecoration(
                color: AppColors.whitishPink,
                shape: BoxShape.circle,
              ),
              child: const Center(
                child: Icon(
                  Iconsax.heart5,
                  color: Colors.white,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
              ),
              child: const Text(
                '⤒  High',
                style: TextStyle(
                  color: Colors.pink,
                ),
              ),
            ),
            const SizedBox(
              width: 55,
              height: 55,
              child: RotatedBox(
                quarterTurns: 1,
                child: Icon(
                  Iconsax.more,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
        const SizedBox(height: 10),
        Text(
          "10:30 - 12:30",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.white.withOpacity(.6),
          ),
        ),
        const SizedBox(height: 10),
        const Text(
          "How to build work processes",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 32,
            color: Colors.white,
            height: .95,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 40,
              width: 100,
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    height: 40,
                    width: 40,
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: AppColors.darkColor,
                          width: 3,
                        ),
                        shape: BoxShape.circle,
                      ),
                      child: RandomAvatar("joe"),
                    ),
                  ),
                  Positioned(
                    left: 25,
                    height: 40,
                    width: 40,
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: AppColors.darkColor,
                          width: 3,
                        ),
                        shape: BoxShape.circle,
                      ),
                      child: RandomAvatar("lae"),
                    ),
                  ),
                  Positioned(
                    left: 50,
                    height: 40,
                    width: 40,
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: AppColors.darkColor,
                          width: 3,
                        ),
                        shape: BoxShape.circle,
                      ),
                      child: RandomAvatar("hoi"),
                    ),
                  ),
                ],
              ),
            ),
            Text(
              "Leo, Kim & 5 mutuals",
              style: TextStyle(
                color: Colors.white.withOpacity(.6),
                fontSize: 18,
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        const SizedBox(
          height: 90,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RoundedIconButton(
                  icon: Iconsax.calendar_1,
                  title: "Meet",
                ),
                RoundedIconButton(
                  icon: Iconsax.story,
                  title: "Remind",
                ),
                RoundedIconButton(
                  icon: Iconsax.edit,
                  title: "Edit",
                ),
                RoundedEmptyButton(
                  icon: Iconsax.add,
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

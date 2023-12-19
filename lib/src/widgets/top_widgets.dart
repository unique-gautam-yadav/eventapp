import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
import 'package:random_avatar/random_avatar.dart';

import '../utils.dart';

class TopWidgets extends StatelessWidget {
  const TopWidgets({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 45,
                width: 45,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: AppColors.darkColor.withOpacity(.6),
                    width: 5,
                  ),
                  shape: BoxShape.circle,
                ),
                child: RandomAvatar(
                  "me",
                ),
              ),
              Row(
                children: [
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text.rich(
                      TextSpan(
                        text: DateFormat("EEEE").format(
                          DateTime.now(),
                        ),
                        children: [
                          TextSpan(
                            text:
                                DateFormat(", dd MMMM").format(DateTime.now()),
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                        style: TextStyle(
                          color: AppColors.darkColor,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    width: 35,
                    height: 35,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Icon(
                        Iconsax.arrow_down_1,
                        color: AppColors.pinkColor,
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                width: 45,
                height: 45,
                decoration: BoxDecoration(
                  color: AppColors.darkColor.withOpacity(.6),
                  shape: BoxShape.circle,
                ),
                child: const Center(
                  child: Icon(
                    CupertinoIcons.search,
                    color: Colors.white,
                    size: 15,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 30),
        Text.rich(
          const TextSpan(
            text: "You have ",
            children: [
              TextSpan(
                text: "4 events",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextSpan(text: "\ntoday"),
              TextSpan(
                text: " ➚",
                style: TextStyle(
                  color: Colors.pink,
                ),
              )
            ],
          ),
          style: TextStyle(
            color: Colors.white,
            fontSize: 28,
            shadows: [
              Shadow(
                color: AppColors.pinkColor,
                blurRadius: 5,
                offset: const Offset(.5, .5),
              ),
            ],
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}


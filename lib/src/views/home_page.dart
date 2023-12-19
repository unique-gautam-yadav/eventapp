import 'dart:developer';
import 'dart:ui';

import 'package:events_app/src/utils.dart';
import 'package:events_app/src/widgets/event_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../widgets/bottom_card.dart';
import '../widgets/top_widgets.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int startedAt = 0;
  int dragHeight = 0;
  bool openAll = false;
  double scale = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(
        builder: (context) {
          if (startedAt > 0) {
            // if ((startedAt - latestOffset) >= 200) {
            //   scale = 1;
            // } else {
            //   if ((startedAt - latestOffset) <= 0) {
            //     scale = 0;
            //   } else {
            scale = (dragHeight) / 200;
            //   }
            // }

            scale -= 1;
            scale = scale.abs();

            if (scale <= .3) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                setState(() {
                  openAll = true;
                });
              });
            }

            // scale = scale - 1;

            // if (scale <= 0) {
            //   scale = 0;
            // }
            // if (scale >= 1) {
            //   scale = 1;
            // }

            // scale = scale + 1;
          }
          debugPrint(scale.toString());
          return Stack(
            children: [
              AnimatedPositioned(
                duration: const Duration(milliseconds: 300),
                top: MediaQuery.sizeOf(context).height -
                    (MediaQuery.sizeOf(context).height * scale),
                height: MediaQuery.sizeOf(context).height,
                width: MediaQuery.sizeOf(context).width,
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 600),
                  opacity: 1,
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          AppColors.pinkColor,
                          AppColors.orangePink,
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              AnimatedPositioned(
                duration: const Duration(milliseconds: 300),
                top: MediaQuery.sizeOf(context).height -
                    (MediaQuery.sizeOf(context).height * scale),
                height: MediaQuery.sizeOf(context).height,
                width: MediaQuery.sizeOf(context).width,
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 100),
                  opacity: scale,
                  child: SafeArea(
                    bottom: false,
                    child: Column(
                      children: <Widget>[
                        const TopWidgets(),
                        const SizedBox(height: 15),
                        Expanded(
                          child: GestureDetector(
                            onPanUpdate: (_) {
                              int h = startedAt - _.globalPosition.dy.toInt();
                              if (h > 0 && h < 200) {
                                setState(() {
                                  dragHeight = h;
                                });
                              }
                            },
                            onPanEnd: (_) {
                              log("ended");
                              setState(() {
                                if (scale >= .2) {
                                  scale = 1;
                                } else {
                                  scale = 0;
                                }
                              });
                              // setState(() {
                              startedAt = 0;
                              // });
                            },
                            onPanStart: (_) {
                              log("Started");
                              startedAt = _.globalPosition.dy.toInt();
                            },
                            dragStartBehavior: DragStartBehavior.down,
                            child: const BottomCard(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              // scale >= 1
              //     ? const SizedBox()
              // :
              AnimatedPositioned(
                duration: const Duration(milliseconds: 300),
                bottom: MediaQuery.sizeOf(context).height -
                    (MediaQuery.sizeOf(context).height * (1 - scale)),
                height: MediaQuery.sizeOf(context).height,
                width: MediaQuery.sizeOf(context).width,
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 300),
                  opacity: 1 - scale,
                  child: allCards(),
                ),
              ),
              // Positioned.fill(
              //   child: AnimatedCrossFade(
              //     duration: const Duration(milliseconds: 350),
              //     crossFadeState: openAll
              //         ? CrossFadeState.showSecond
              //         : CrossFadeState.showFirst,
              //     firstChild: Container(),
              //     secondChild: allCards(),
              //   ),
              // ),
            ],
          );
        },
      ),
    );
  }

  Container allCards() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            AppColors.orangePink.withOpacity(.2),
            AppColors.pinkColor.withOpacity(1),
          ],
        ),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 0, sigmaY: 0),
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/bg.jpeg'),
              fit: BoxFit.cover,
            ),
          ),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CupertinoButton(
                    child: const Icon(Iconsax.close_circle),
                    onPressed: () {
                      setState(() {
                        openAll = false;
                        scale = 1;
                      });
                    },
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          AppColors.pinkColor,
                          AppColors.orangePink,
                        ],
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const EventCard(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

TextSpan highlight(String text) => TextSpan(
    text: text,
    style: const TextStyle(
      fontWeight: FontWeight.bold,
    ));

TextSpan unHighlight(String text) => TextSpan(
      text: text,
      style: TextStyle(
        color: Colors.white.withOpacity(.8),
      ),
    );

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:songtube/ui/animations/showUp.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:url_launcher/url_launcher.dart';

class IntroWelcome extends StatelessWidget {
  final Function onNext;
  IntroWelcome({
    this.onNext
  });
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          alignment: Alignment.center,
          children: [
            ShowUpTransition(
              duration: Duration(milliseconds: 600),
              forward: true,
              slideSide: SlideFromSlide.BOTTOM,
              child: Align(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AvatarGlow(
                      repeat: true,
                      endRadius: 120,
                      showTwoGlows: false,
                      glowColor: Theme.of(context).accentColor,
                      repeatPauseDuration: Duration(milliseconds: 50),
                      child: Container(
                        height: 160,
                        width: 160,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(200),
                          color: Theme.of(context).accentColor.withOpacity(0.1)
                        ),
                        child: Center(
                          child: Container(
                            height: 140,
                            width: 140,
                            child: Image.asset(
                              'assets/images/logo.png'
                            )
                          ),
                        ),
                      ),
                    ),
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        style: TextStyle(
                          fontSize: 26,
                          fontFamily: 'YTSans',
                          fontWeight: FontWeight.w400,
                          color: Theme.of(context).textTheme.bodyText1.color
                        ),
                        children: [
                          TextSpan(
                            text: "Welcome to\n"
                          ),
                          TextSpan(
                            text: "SongTube",
                            style: TextStyle(
                              color: Theme.of(context).accentColor,
                              fontWeight: FontWeight.w600
                            )
                          )
                        ]
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ShowUpTransition(
              forward: true,
              slideSide: SlideFromSlide.LEFT,
              duration: Duration(milliseconds: 600),
              child: GestureDetector(
                onTap: () {
                  launch('https://github.com/Hexer10/youtube_explode_dart');
                },
                child: Container(
                  alignment: Alignment.topLeft,
                  margin: EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 8),
                        child: Icon(
                          MdiIcons.youtube,
                          size: 40,
                          color: Colors.red
                        ),
                      ),
                      RichText(
                        textAlign: TextAlign.start,
                        text: TextSpan(
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'YTSans',
                            fontWeight: FontWeight.w400,
                            color: Theme.of(context).textTheme.bodyText1.color
                          ),
                          children: [
                            TextSpan(
                              text: "Powered by\n"
                            ),
                            TextSpan(
                              text: "YouTubeExplode",
                              style: TextStyle(
                                color: Theme.of(context).accentColor,
                                fontWeight: FontWeight.w600
                              )
                            )
                          ]
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: ShowUpTransition(
          delay: Duration(milliseconds: 600),
          duration: Duration(milliseconds: 600),
          forward: true,
          slideSide: SlideFromSlide.BOTTOM,
          child: Padding(
            padding: EdgeInsets.only(right: 16),
            child: FloatingActionButton.extended(
              backgroundColor: Colors.red,
              label: Text(
                "Start",
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'YTSans',
                  fontSize: 16
                ),
              ),
              icon: Icon(EvaIcons.arrowForward, color: Colors.white),
              onPressed: onNext,
            ),
          ),
        ),
      ),
    );
  }
}
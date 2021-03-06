import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:songtube/ui/animations/showUp.dart';

class IntroPermissions extends StatefulWidget {
  @override
  _IntroPermissionsState createState() => _IntroPermissionsState();
}

class _IntroPermissionsState extends State<IntroPermissions> {

  // Permission Granted
  bool accessGranted;

  @override
  void initState() {
    super.initState();
    accessGranted = false;
    Permission.storage.status.then((status) {
      if (status != PermissionStatus.granted) {
        setState(() => accessGranted = false);
      } else {
        setState(() => accessGranted = true);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        alignment: Alignment.center,
        children: [
          ShowUpTransition(
            duration: Duration(milliseconds: 600),
            forward: true,
            slideSide: SlideFromSlide.LEFT,
            child: Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 8),
                      child: AnimatedSwitcher(
                        duration: Duration(milliseconds: 300),
                        child: accessGranted
                          ? Icon(
                              MdiIcons.lockOpen,
                              size: 40,
                              color: Colors.red
                            )
                          : Icon(
                              MdiIcons.lock,
                              size: 40,
                              color: Colors.red
                            ),
                      ),
                    ),
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        style: TextStyle(
                          fontSize: 22,
                          fontFamily: 'YTSans',
                          fontWeight: FontWeight.w400,
                          color: Theme.of(context).textTheme.bodyText1.color
                        ),
                        children: [
                          TextSpan(
                            text: "Grant "
                          ),
                          TextSpan(
                            text: "Access",
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
          ShowUpTransition(
            slideSide: SlideFromSlide.BOTTOM,
            duration: Duration(milliseconds: 600),
            forward: true,
            child: Container(
              width: MediaQuery.of(context).size.width*0.6,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/grantAccess.png'),
                  Container(
                    margin: EdgeInsets.only(top: 32),
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'YTSans',
                          color: Theme.of(context).textTheme.bodyText1.color
                        ),
                        children: [
                          TextSpan(
                            text: "SongTube ",
                            style: TextStyle(
                              color: Theme.of(context).accentColor,
                              fontWeight: FontWeight.w600
                            )
                          ),
                          TextSpan(
                            text: "Needs Access to your External Storage to save all your Videos and Music",
                          )
                        ]
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          ShowUpTransition(
            forward: true,
            delay: Duration(milliseconds: 600),
            duration: Duration(milliseconds: 600),
            slideSide: SlideFromSlide.BOTTOM,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: GestureDetector(
                onTap: () {
                  if (accessGranted == false) {
                    Permission.storage.request().then((status) {
                      if (status == PermissionStatus.granted) {
                        setState(() => accessGranted = true);
                      }
                    });
                  }
                },
                child: AnimatedContainer(
                  margin: EdgeInsets.only(bottom: 32),
                  duration: Duration(milliseconds: 500),
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: accessGranted
                      ? BorderRadius.circular(50)
                      : BorderRadius.circular(10),
                    color: Theme.of(context).accentColor
                  ),
                  child: AnimatedSwitcher(
                    duration: Duration(milliseconds: 500),
                    child: accessGranted
                      ? Container(
                          margin: EdgeInsets.only(left: 14, right: 14),
                          child: Icon(
                            EvaIcons.doneAllOutline,
                            color: Colors.white,
                          )
                        )
                      : Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 16, right: 8),
                              child: Text(
                                "Allow Access",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600
                                )
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(right: 8),
                              child: Icon(
                                EvaIcons.radioButtonOnOutline,
                                color: Colors.white,
                              )
                            )
                          ],
                        ),
                  ),
                ),
              ),
            ),
          )
        ],
      )
    );
  }
}
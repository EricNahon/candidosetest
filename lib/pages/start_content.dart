import 'package:candidosetest/models/app_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/constants.dart';
import '../components/particle_background.dart';
import '../components/animated_image.dart';

class StartContent extends StatefulWidget {
  @override
  _StartContentState createState() => _StartContentState();
}

class _StartContentState extends State<StartContent> with TickerProviderStateMixin {
  Animation animation;
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(duration: Duration(milliseconds: 1500), vsync: this);
    animation = CurvedAnimation(parent: controller, curve: Curves.ease);

    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[Positioned.fill(child: ParticleBackground()), CenteredText(anim: animation)]);
  }
}

class CenteredText extends StatelessWidget {
  final Animation anim;

  const CenteredText({
    Key key,
    this.anim,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);

    return Center(
      child: Container(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              AnimatedImage(animation: anim),
              SizedBox(height: 30),
              Text(
                "Un questionnaire simple pour évaluer\nla probabilité d'une présence de candidose\n",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: "Quicksand",
                  fontSize: 20.0,
                ),
              ),
              SizedBox(height: 15),
              RaisedButton(
                elevation: 10,
                color: Color(0xFFc2c6e0),
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 24),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                onPressed: () {
                  appState.currentContentIndex = HomePageContent.quizz;
                },
                child: Container(
                  width: 230,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(width: 6),
                      Text(
                        "Commencer",
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: "Quicksand",
                          fontWeight: FontWeight.bold,
                          fontSize: 30.0,
                        ),
                        maxLines: 1,
                      ),
                      Icon(Icons.chevron_right, size: 38),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 15),
              Text(
                "(durée du test 5mn environ)",
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: "Quicksand",
                  fontSize: 14.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

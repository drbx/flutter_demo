import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class IntroductionPage extends StatefulWidget {
  const IntroductionPage({Key? key}) : super(key: key);

  @override
  State<IntroductionPage> createState() => _IntroductionPageState();
}

class _IntroductionPageState extends State<IntroductionPage> {
  List<PageViewModel> getPages() {
    return [
      PageViewModel(
          image: Image.asset("assets/introduction/page1.png"),
          title: "",
          body: "",
          footer: const Text("Footer Text here "),
          decoration: const PageDecoration(
            pageColor: Colors.blue,
          )),
      PageViewModel(
        image: Image.asset("assets/introduction/page2.png"),
        title: "Live Demo page 2 ",
        body: "Live Demo Text",
        footer: const Text("Footer Text  here "),
      ),
      PageViewModel(
        image: Image.asset("assets/introduction/page3.png"),
        title: "Live Demo page 3",
        body: "Welcome to Proto Coders Point",
        footer: const Text("Footer Text  here "),
      ),
      PageViewModel(
        image: Image.asset("assets/introduction/page4.png"),
        title: "Live Demo page 4 ",
        body: "Live Demo Text",
        footer: const Text("Footer Text  here "),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      globalBackgroundColor: Colors.white,
      pages: getPages(),
      showNextButton: true,
      showSkipButton: true,
      next: const Text("Next"),
      skip: const Text("Skip"),
      done: const Text("Got it "),
      onDone: () {
        Navigator.pushNamed(context, "/");
      },
    );
  }
}

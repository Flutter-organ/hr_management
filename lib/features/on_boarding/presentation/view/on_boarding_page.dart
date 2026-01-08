import 'package:flutter/material.dart';
import 'package:hr_management/features/on_boarding/model/on_boarding_model.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              itemCount: onBoardingitems.length,
              itemBuilder: (context, index) {
                return ListView(
                  children: [
                    Image.asset(onBoardingitems[index].image),
                    Text(onBoardingitems[index].title),
                    Text(onBoardingitems[index].subTitle),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

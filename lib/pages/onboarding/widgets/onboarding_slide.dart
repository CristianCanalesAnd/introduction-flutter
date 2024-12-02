import 'package:flutter/material.dart';
import 'package:introduction_flutter/pages/onboarding/models/onboarding_slide_info.dart';

class OnboardingSlide extends StatelessWidget {
  final OnboardingSlideInfo slideInfo;

  const OnboardingSlide({
    Key? key,
    required this.slideInfo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 5,
            child: Column(
              children: [
                const SizedBox(height: 30),
                buildTitle,
                const SizedBox(height: 30),
                buildImagePreview(context),
                const SizedBox(height: 40),
                buildDescription
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildImagePreview(BuildContext context) {
    double size = 300;
    return Center(
      child: Container(
        height: size,
        width: size,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage(slideInfo.assetUrl),
          ),
        ),
      ),
    );
  }

  Widget get buildTitle {
    return Container(
      color: Colors.white.withAlpha(0),
      height: 60,
      child: Text(
        slideInfo.title,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 24,
          fontWeight: FontWeight.w600,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget get buildDescription {
    return Text(
      slideInfo.description,
      style: const TextStyle(
        color: Colors.black,
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
      textAlign: TextAlign.center,
    );
  }
}

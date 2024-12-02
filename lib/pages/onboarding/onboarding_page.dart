import 'package:auto_route/auto_route.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:introduction_flutter/pages/onboarding/data/onboarding_data.dart';
import 'package:introduction_flutter/pages/onboarding/widgets/onboarding_slide.dart';
import 'package:introduction_flutter/router/router.dart';
import 'package:introduction_flutter/theme/app_colors.dart';
import 'package:introduction_flutter/widgets/custom_button.dart';
import 'package:introduction_flutter/widgets/custom_back_button.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  PageController pageController = PageController();

  bool isFirstPage = true;
  bool isLastPage = false;
  int totalSlides = 0;
  int currentSlide = 0;

  @override
  void initState() {
    setState(() {
      totalSlides = slides.length;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            buildHeaderView,
            buildSlideView,
            buildDots,
            buildBottomView
          ],
        ),
      ),
    );
  }

  Widget get buildHeaderView {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
      child: Stack(
        alignment: Alignment.center,
        children: [
          buildLogo,
          Row(
            children: [
              buildPreviousPage,
              const Spacer(),
              buildSkipBtn,
            ],
          ),
        ],
      ),
    );
  }

  Widget get buildPreviousPage {
    return isFirstPage
        ? const IconButton(
            onPressed: null,
            icon: SizedBox(height: 12, width: 12),
          )
        : CustomBackButton(onPressed: () => onAnimateSlide(nextSlide: false));
  }

  Widget get buildLogo {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/images/onboarding/logo.png',
          height: 24,
          width: 24,
        ),
        const SizedBox(width: 10),
        const Text(
          'Onboarding',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget get buildSkipBtn {
    return GestureDetector(
      onTap: () => onSkip(),
      child: const Text(
        'Skip',
        style: TextStyle(
            color: AppColors.fucsia, fontSize: 16, fontWeight: FontWeight.w600),
      ),
    );
  }

  Widget get buildSlideView {
    return Expanded(
      flex: 6,
      child: PageView(
        onPageChanged: (slide) => onPageChanged(context, slide),
        scrollDirection: Axis.horizontal,
        controller: pageController,
        children: buildPages,
      ),
    );
  }

  List<Widget> get buildPages {
    return slides.map((slideInfo) {
      return OnboardingSlide(slideInfo: slideInfo);
    }).toList();
  }

  Widget get buildDots {
    return DotsIndicator(
      dotsCount: totalSlides,
      position: currentSlide.toDouble(),
      decorator: const DotsDecorator(
        color: AppColors.lightFucsia,
        activeColor: AppColors.fucsia,
      ),
      onTap: (slide) => onDotPressed(context, slide.toInt()),
    );
  }

  Widget get buildBottomView {
    return Expanded(
      flex: 1,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: buildNextBtn(context),
          ),
        ],
      ),
    );
  }

  Widget buildNextBtn(BuildContext context) {
    return CustomButton(
      title: 'Next',
      backgroundColor: AppColors.fucsia,
      titleStyle: const TextStyle(
        color: Colors.white,
        fontSize: 16,
      ),
      elevation: 0,
      onPressed: () => isLastPage ? onClosePressed() : onAnimateSlide(),
    );
  }

  //Functions
  onSkip() {
    context.router.replace(const TabNavRoute());
  }

  onClosePressed() {
    context.router.replace(const TabNavRoute());
  }

  onPageChanged(BuildContext context, int slide) {
    setState(() {
      currentSlide = slide;
      isFirstPage = slide == 0;
      isLastPage = slide == slides.length - 1;
    });
  }

  onDotPressed(BuildContext context, int slide) {
    setState(() {
      currentSlide = slide;
    });
    animateToSlide(currentSlide);
  }

  onAnimateSlide({bool nextSlide = true}) {
    setState(() {
      currentSlide = nextSlide ? currentSlide + 1 : currentSlide - 1;
    });
    animateToSlide(currentSlide);
  }

  animateToSlide(int slideToAnimate) {
    pageController.animateToPage(
      slideToAnimate,
      duration: const Duration(milliseconds: 10),
      curve: Curves.ease,
    );
  }
}

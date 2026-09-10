import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../core/providers/app_session_provider.dart';
import '../models/onboarding_model.dart';
import 'login_view.dart';

class OnboardingView extends ConsumerStatefulWidget {
  const OnboardingView({super.key});

  @override
  ConsumerState<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends ConsumerState<OnboardingView> {
  final PageController _pageController = PageController();
  bool isLastPage = false;

  final List<OnboardingModel> _pages = const [
    OnboardingModel(
      imagePath: 'assets/images/onbording_1.png',
      title: 'Book When It Suits You',
      description:
          'Choose your preferred date, time, and location, then let a professional handle the rest.',
    ),
    OnboardingModel(
      imagePath: 'assets/images/onbording_2.png',
      title: 'Choose With Confidence',
      description:
          'Compare professionals, ratings, reviews, services, and prices before you book.',
    ),
    OnboardingModel(
      imagePath: 'assets/images/onbording_3.png',
      title: 'Get It Fixed Fast',
      description:
          'Find trusted professionals for all your home and maintenance needs.',
    ),
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: _pages.length,
                  onPageChanged: (index) {
                    setState(() {
                      isLastPage = index == _pages.length - 1;
                    });
                  },
                  itemBuilder: (context, index) {
                    final item = _pages[index];
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset(
                            item.imagePath,
                            width: double.infinity,
                            height: 320,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(height: 32),
                        Text(
                          item.title,
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.headlineLarge,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          item.description,
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ],
                    );
                  },
                ),
              ),
              const SizedBox(height: 16),
              SmoothPageIndicator(
                controller: _pageController,
                count: _pages.length,
                effect: ExpandingDotsEffect(
                  activeDotColor: Theme.of(context).colorScheme.primary,
                  dotColor: Colors.grey.shade300,
                  dotHeight: 8,
                  dotWidth: 8,
                  expansionFactor: 3,
                  spacing: 8,
                ),
              ),
              const SizedBox(height: 50),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: FilledButton(
                  onPressed: () {
                    if (isLastPage) {
                      ref.read(appSessionProvider.notifier).completeOnboarding();
                      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const LoginView()),
      );

                    } else {
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOutCubicEmphasized,
                      );
                    }
                  },
                  child: Text(
                    isLastPage ? 'GET STARTED' : 'NEXT',
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
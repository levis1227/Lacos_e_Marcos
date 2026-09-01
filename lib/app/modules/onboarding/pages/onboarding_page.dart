import 'package:flutter/material.dart';
import 'package:projeto_atual/app/core/theme/app_colors.dart';
import 'package:projeto_atual/app/routes/routes_names.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
// Imports atualizados para a nova estrutura de pastas
import 'package:projeto_atual/app/modules/onboarding/pages/onboard1_page.dart';
import 'package:projeto_atual/app/modules/onboarding/pages/onboard2_page.dart';
import 'package:projeto_atual/app/modules/onboarding/pages/onboard3_page.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _controller = PageController();
  bool onLastpage = false;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            PageView(
              controller: _controller,
              onPageChanged: (index) {
                setState(() {
                  onLastpage = (index == 2);
                });
              },
              children: const [
                Onboard1Page(),
                Onboard2Page(),
                Onboard3Page(),
              ],
            ),
            Column(
              children: [
                GestureDetector(
                  onTap: () => _controller.jumpToPage(2),
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.88,
                    ),
                    child: Text(
                      "Pular",
                      style: textTheme.bodyMedium?.copyWith(color: Colors.grey),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.75,
                  ),
                  child: SmoothPageIndicator(
                    controller: _controller,
                    count: 3,
                    effect: const SlideEffect(
                      spacing: 4.0,
                      radius: 4.0,
                      dotWidth: 14.0,
                      dotHeight: 7.0,
                      strokeWidth: 1.5,
                      dotColor: AppColors.dotInactive,
                      activeDotColor: AppColors.primaryButton,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    if (onLastpage) {
                      Navigator.pushReplacementNamed(
                        context,
                        RoutesName.loginSignup,
                      );
                    } else {
                      _controller.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeIn,
                      );
                    }
                  },
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.05,
                    ),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.07,
                      width: MediaQuery.of(context).size.width * 0.88,
                      decoration: BoxDecoration(
                        color: AppColors.primaryButton,
                        borderRadius: BorderRadius.circular(35),
                      ),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              onLastpage ? "Começar " : "Próximo ",
                              style: textTheme.titleMedium?.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Icon(
                              onLastpage ? Icons.check : Icons.chevron_right,
                              size: MediaQuery.sizeOf(context).width * 0.06,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projeto_atual/const/routes/routes_names.dart';
import 'package:projeto_atual/pages/on_board/on_board1.dart';
import 'package:projeto_atual/pages/on_board/on_board2.dart';
import 'package:projeto_atual/pages/on_board/on_board3.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  final PageController _controller = PageController();

  bool onLastpage = false;

  @override
  Widget build(BuildContext context) {
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
                OnBoard1(),
                OnBoard2(),
                OnBoard3(),
              ],
            ),
            Column(
              children: [
                GestureDetector(
                  onTap: () {
                    _controller.jumpToPage(2);
                  },
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.88,
                    ),
                    child: Text(
                      "Pular",
                      style:
                          GoogleFonts.inter(fontSize: 15, color: Colors.grey),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.75),
                  child: SmoothPageIndicator(
                    controller: _controller,
                    count: 3,
                    effect: const SlideEffect(
                      spacing: 4.0,
                      radius: 4.0,
                      dotWidth: 14.0,
                      dotHeight: 7.0,
                      strokeWidth: 1.5,
                      dotColor: Color.fromARGB(255, 170, 255, 237),
                      activeDotColor: Color.fromARGB(255, 3, 190, 150),
                    ),
                  ),
                ),
                onLastpage
                    ? GestureDetector(
                        onTap: () {
                          Navigator.pushReplacementNamed(
                              context, RoutesName.loginSignup);
                        },
                        child: Padding(
                          padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * 0.05,
                          ),
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.07,
                            width: MediaQuery.of(context).size.width * 0.88,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 3, 190, 150),
                              borderRadius: BorderRadius.circular(35),
                            ),
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Começar ",
                                    style: GoogleFonts.inter(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      letterSpacing: 1,
                                    ),
                                  ),
                                  Icon(
                                    Icons.check,
                                    size: MediaQuery.sizeOf(context).width *
                                        0.06,
                                    color: Colors.white,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
                    : GestureDetector(
                        onTap: () {
                          _controller.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeIn,
                          );
                        },
                        child: Padding(
                          padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * 0.05,
                          ),
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.07,
                            width: MediaQuery.of(context).size.width * 0.88,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 3, 190, 150),
                              borderRadius: BorderRadius.circular(35),
                            ),
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Próximo ",
                                    style: GoogleFonts.inter(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      letterSpacing: 1,
                                    ),
                                  ),
                                  Icon(
                                    Icons.chevron_right,
                                    size: MediaQuery.sizeOf(context).width *
                                        0.06,
                                    color: Colors.white,
                                  )
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
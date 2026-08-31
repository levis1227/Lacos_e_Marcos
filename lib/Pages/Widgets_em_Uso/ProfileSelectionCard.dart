import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ProfileSelectionCard extends StatelessWidget {
  final String image;
  final String maintext;
  final String subtext;

  ProfileSelectionCard(
      {required this.image,
      required this.maintext,
      required this.subtext});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.12,
          width: MediaQuery.of(context).size.width * 0.9,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Color.fromARGB(255, 226, 226, 226)),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              const SizedBox(
                width: 10,
              ),
              //Doctor image Container
              Container(
                height: MediaQuery.of(context).size.height * 0.1000,
                width: MediaQuery.of(context).size.width * 0.2400,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage(image),
                        filterQuality: FilterQuality.high,
                        fit: BoxFit.contain)),
              ),
              const SizedBox(
                width: 10,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.1200,
                width: MediaQuery.of(context).size.width * 0.4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      maintext,
                      style: GoogleFonts.poppins(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      subtext,
                      style: GoogleFonts.poppins(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: Colors.black87),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

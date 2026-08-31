import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as flutter;
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class listIcons extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color cor;

  listIcons({required this.icon, required this.text,required this.cor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.07,
                width: MediaQuery.of(context).size.width * 0.15,
                decoration: BoxDecoration(
                  color: cor,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: const [
                    BoxShadow(
                        blurRadius: 10,
                        spreadRadius: 1,
                        color: Color.fromARGB(135, 238, 236, 236))
                  ],
                ),
                child: flutter.Icon(
                  icon,
                  size: 40,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                text,textAlign: TextAlign.center,
                style: GoogleFonts.inter(fontSize: 13.sp, color: Colors.black,fontWeight: FontWeight.w700,),
              )
            ],
          ),
        ],
      ),
    );
  }
}
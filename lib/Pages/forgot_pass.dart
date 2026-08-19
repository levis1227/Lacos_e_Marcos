import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class forgot_pass extends StatefulWidget {
  const forgot_pass({super.key});

  @override
  State<forgot_pass> createState() => _forgot_passState();
}

class _forgot_passState extends State<forgot_pass>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.black87,
            size: 20,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Text(
              "Forgot your password?",
              style: GoogleFonts.poppins(
                fontSize: 20.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              "Enter your email or your phone number, we\nwill send you confirmation code",
              style: GoogleFonts.poppins(
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 30),
            
            // Seletor de Abas (Email / Phone)
            Container(
              height: 50,
              decoration: BoxDecoration(
                border: Border.all(color: const Color.fromARGB(255, 235, 235, 235)),
                color: const Color.fromARGB(255, 241, 241, 241),
                borderRadius: BorderRadius.circular(30),
              ),
              child: TabBar(
                controller: tabController,
                indicator: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                ),
                indicatorSize: TabBarIndicatorSize.tab,
                dividerColor: Colors.transparent,
                unselectedLabelColor: Colors.grey,
                labelColor: const Color.fromARGB(255, 3, 190, 150),
                labelStyle: GoogleFonts.poppins(fontWeight: FontWeight.w600),
                tabs: const [
                  Tab(text: "Email"),
                  Tab(text: "Phone"),
                ],
              ),
            ),
            const SizedBox(height: 20),
            
            // Conteúdo das Abas
            Expanded(
              child: TabBarView(
                controller: tabController,
                children: [
                  _buildDummyTab(
                    hintText: "Enter your email",
                    icon: Icons.email_outlined,
                  ),
                  _buildDummyTab(
                    hintText: "Enter your phone number",
                    icon: Icons.phone_outlined,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget auxiliar para preencher o conteúdo de cada aba no teste
  Widget _buildDummyTab({required String hintText, required IconData icon}) {
    return Column(
      children: [
        TextField(
          decoration: InputDecoration(
            prefixIcon: Icon(icon, color: const Color.fromARGB(255, 3, 190, 150)),
            hintText: hintText,
            hintStyle: GoogleFonts.poppins(color: Colors.black38),
            filled: true,
            fillColor: const Color.fromARGB(255, 248, 248, 248),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide.none,
            ),
          ),
        ),
        const SizedBox(height: 30),
        SizedBox(
          width: double.infinity,
          height: 50,
          child: ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Código de verificação enviado!')),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 3, 190, 150),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            child: Text(
              "Reset Password",
              style: GoogleFonts.poppins(
                fontSize: 16.sp,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
import 'package:flutter/material.dart';
import 'package:projeto_atual/app/widgets/list_icons.dart';
import 'package:projeto_atual/app/widgets/profile_list.dart';
import 'package:projeto_atual/app/widgets/progresso_marcos_card.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'package:projeto_atual/app/core/theme/app_colors.dart';
import 'package:projeto_atual/app/routes/routes_names.dart';

// Imports mantidos para os widgets e páginas pendentes de refatoração


class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.background,
        elevation: 0,
        toolbarHeight: 90,
        leading: IconButton(
          icon: const Icon(Icons.menu, size: 32),
          onPressed: () {
            Navigator.pushNamed(context, RoutesName.selectProfile);
          },
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: IconButton(
              icon: const Icon(Icons.notifications_outlined, size: 32),
              onPressed: () {
                Navigator.pushNamed(context, RoutesName.selectProfile);
              },
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Olá, Mamãe!",
                style: textTheme.titleLarge?.copyWith(
                  fontSize: 20.sp,
                  color: AppColors.textPrimary,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                "Que bom ter você aqui!",
                style: textTheme.bodyMedium?.copyWith(
                  fontSize: 14.sp,
                  color: AppColors.textSecondary,
                ),
              ),
              const SizedBox(height: 24),
              
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Progresso dos marcos",
                    style: textTheme.titleMedium?.copyWith(
                      fontSize: 16.sp,
                      color: AppColors.textPrimary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, RoutesName.homepage);
                    },
                    child: Text(
                      "Ver todos",
                      style: textTheme.bodyMedium?.copyWith(
                        fontSize: 14.sp,
                        color: AppColors.primaryButton,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              ProgressoMarcosCard(
                chartSize: 150.0,
                onVerTodosTap: () {
                  Navigator.pushNamed(context, RoutesName.homepage);
                },
              ),
              const SizedBox(height: 16),

              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, RoutesName.selectProfile);
                },
                child: ProfileList(
                  image: "images/avatar.jpg",
                  title: "Log out",
                  color: AppColors.red,
                ),
              ),
              const SizedBox(height: 32),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, RoutesName.selectProfile);
                    },
                    child: const ListIcons(
                      icon: Icons.add,
                      text: "Registrar\nMarco",
                      cor: AppColors.green,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, RoutesName.selectProfile);
                    },
                    child: const ListIcons(
                      icon: Icons.bar_chart,
                      text: "Ver\ndesenvolvimento",
                      cor: AppColors.blue,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, RoutesName.selectProfile);
                    },
                    child: const ListIcons(
                      icon: Icons.calendar_month,
                      text: "Agenda",
                      cor: AppColors.orange,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, RoutesName.selectProfile);
                    },
                    child: const ListIcons(
                      icon: Icons.menu_book,
                      text: "Orientações",
                      cor: AppColors.purple,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
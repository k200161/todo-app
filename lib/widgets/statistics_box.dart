import 'package:flutter/material.dart';

import 'info_card.dart';

class StatisticsBox extends StatelessWidget {
  const StatisticsBox({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          children: [
            Expanded(
              child: InfoCard(
                title: 'Project',
                count: 5,
                icon: Icons.door_back_door_outlined,
                color: Color(0xFFB4C4FF),
              ),
            ),
            SizedBox(width: 15),
            Expanded(
              child: InfoCard(
                title: 'Work',
                count: 3,
                icon: Icons.car_crash_outlined,
                color: Color(0xFFCFF3E9),
              ),
            ),
          ],
        ),
        SizedBox(height: 15),
        Row(
          children: [
            Expanded(
              child: InfoCard(
                title: 'Daily Tasks',
                count: 2,
                icon: Icons.fitness_center_outlined,
                color: Color(0xFFAC71F9),
              ),
            ),
            SizedBox(width: 15),
            Expanded(
              child: InfoCard(
                title: 'Groceries',
                count: 5,
                icon: Icons.shopping_bag_outlined,
                color: Color(0xFFEDBE7D),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';

class InfoCard extends StatelessWidget {
  const InfoCard({
    super.key,
    required this.title,
    required this.count,
    required this.icon,
    required this.color,
  });

  final String title;
  final int count;
  final IconData icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    const borderRadius = BorderRadius.all(Radius.circular(12));
    const textStyle = TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
    );

    return Material(
      color: color,
      elevation: 1,
      borderRadius: borderRadius,
      child: InkWell(
        onTap: () {},
        borderRadius: borderRadius,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 15,
                backgroundColor: Colors.white,
                foregroundColor: color,
                child: Icon(icon, size: 20),
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: textStyle,
                  ),
                  Text(
                    count.toString(),
                    style: textStyle,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

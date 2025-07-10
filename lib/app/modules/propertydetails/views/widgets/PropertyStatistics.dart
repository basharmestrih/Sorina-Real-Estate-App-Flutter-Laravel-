import 'package:flutter/material.dart';

class Propertystatistics extends StatelessWidget {
  const Propertystatistics({super.key});

  @override
  Widget build(BuildContext context) {
    final features = [
      {'icon': Icons.bed, 'label': '4 Rooms'},
      {'icon': Icons.bathtub, 'label': '2 Bathrooms'},
      {'icon': Icons.home_filled, 'label': '2 Floors'},
      {'icon': Icons.square_foot, 'label': '230 m²'},
      {'icon': Icons.calendar_today, 'label': '3 Years ago'},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "What will you get",
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 120,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: features.length,
            separatorBuilder: (_, __) => const SizedBox(width: 12),
            itemBuilder: (context, index) {
              final item = features[index];
              return FeatureCard(
               icon: item['icon'] as IconData,
               label: item['label'] as String,

              );
            },
          ),
        ),
      ],
    );
  }
}

class FeatureCard extends StatelessWidget {
  final IconData icon;
  final String label;

  const FeatureCard({
    super.key,
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 200,
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
      decoration: BoxDecoration(
        //color: Colors.white,
        border: Border.all(
          color: const Color.fromARGB(255, 227, 223, 223),
          width: 3,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 38, color: Colors.black87),
          const SizedBox(height: 6),
          Text(
            label,
            style: Theme.of(context).textTheme.labelSmall,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

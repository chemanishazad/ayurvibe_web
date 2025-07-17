import 'package:flutter/material.dart';

class Service {
  final String title;
  final String description;
  final String imagePath;
  final IconData icon;

  Service({
    required this.title,
    required this.description,
    required this.imagePath,
    required this.icon,
  });
}

final List<Service> services = [
  Service(
    title: "The Shirodhara Therapy",
    description: "Experience the soothing and calming effects of Shirodhara.",
    imagePath: "assets/icons/2.png",
    icon: Icons.spa,
  ),
  Service(
    title: "Pranayama Breathing Techniques",
    description: "Enhance your life energy with Pranayama breathing exercises.",
    imagePath: "assets/icons/3.png",
    icon: Icons.self_improvement,
  ),
  Service(
    title: "Udvartana Herbal Ayurved Scrub",
    description:
        "Udvartana offers rejuvenation and vitality through herbal scrubs.",
    imagePath: "assets/icons/4.png",
    icon: Icons.local_florist,
  ),
  Service(
    title: "Ayurvedic Dietary Guidance",
    description: "Discover dietary guidance based on Ayurvedic principles.",
    imagePath: "assets/icons/5.png",
    icon: Icons.restaurant_menu,
  ),
];

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutTextBlock extends StatelessWidget {
  const AboutTextBlock({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'ABOUT US',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.5,
            color: Colors.black54,
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          'Rooted in Tradition,\nDriven by Care.',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 20),
        Text(
          'Sri Vinayaga Ayurvibe is your trusted partner in holistic wellness. '
          'We combine centuries-old Ayurvedic practices with modern techniques to bring balance, health, and rejuvenation to your life. '
          'Our experienced practitioners and curated therapies are here to guide you on your path to well-being.',
          style: GoogleFonts.poppins(
            fontSize: 14,
            color: Colors.black87,
            height: 1.6,
          ),
        ),
        const SizedBox(height: 24),
        ElevatedButton(
          onPressed: () {
            // Scroll or Navigate to Details
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green.shade700,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          child: const Text(
            'Learn More',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
      ],
    );
  }
}

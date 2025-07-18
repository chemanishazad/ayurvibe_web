import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FooterLinks extends StatelessWidget {
  const FooterLinks({super.key});

  @override
  Widget build(BuildContext context) {
    final links = ['Home', 'Services', 'About', 'Contact'];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Quick Links',
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 12),
        ...links.map(
          (link) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Text(
              link,
              style: GoogleFonts.poppins(color: Colors.white70, fontSize: 14),
            ),
          ),
        ),
      ],
    );
  }
}

class FooterBrand extends StatelessWidget {
  const FooterBrand({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const CircleAvatar(
              radius: 20,
              backgroundColor: Colors.white,
              backgroundImage: AssetImage('assets/icons/logo.png'),
            ),
            const SizedBox(width: 12),
            Text(
              'Sri Vinayaga Ayurvibe',
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Text(
          'Healing through time-tested Ayurvedic practices to promote your well-being naturally.',
          style: GoogleFonts.poppins(
            color: Colors.white70,
            fontSize: 13,
            height: 1.6,
          ),
        ),
      ],
    );
  }
}

class FooterContact extends StatelessWidget {
  const FooterContact({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Contact',
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          '📍 123 Ayur Street, Madurai\n📞 +91 98765 43210\n✉️ contact@ayurvibe.com',
          style: GoogleFonts.poppins(
            color: Colors.white70,
            fontSize: 13,
            height: 1.6,
          ),
        ),
        const SizedBox(height: 16),
        Row(
          children: const [
            Icon(Icons.facebook, color: Colors.white),
            SizedBox(width: 12),
            Icon(Icons.phone, color: Colors.white),
            SizedBox(width: 12),
            Icon(Icons.email, color: Colors.white),
          ],
        ),
      ],
    );
  }
}

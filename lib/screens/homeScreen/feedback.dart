import 'package:flutter/material.dart';

class TestimonialCard extends StatelessWidget {
  final Testimonial testimonial;
  const TestimonialCard({super.key, required this.testimonial});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Icon(Icons.format_quote, color: Colors.green, size: 30),
            const SizedBox(height: 16),
            Text(
              '"${testimonial.feedback}"',
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black87,
                fontStyle: FontStyle.italic,
                height: 1.6,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            Text(
              testimonial.name,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              testimonial.location,
              style: const TextStyle(fontSize: 13, color: Colors.black54),
            ),
          ],
        ),
      ),
    );
  }
}

class Testimonial {
  final String name;
  final String location;
  final String feedback;

  Testimonial({
    required this.name,
    required this.location,
    required this.feedback,
  });
}

final testimonials = [
  Testimonial(
    name: 'Pradeepa',
    location: 'Madurai',
    feedback:
        'I’ve never felt this energetic and balanced. Ayurvibe really changed my life!',
  ),
  Testimonial(
    name: 'Nalini Kumari',
    location: 'Chennai',
    feedback:
        'The team is very friendly and professional. Their treatments are truly effective.',
  ),
  Testimonial(
    name: 'Vijaya kumar.',
    location: 'Coimbatore',
    feedback:
        'After a few sessions, I feel healthier and more focused than ever.',
  ),
];

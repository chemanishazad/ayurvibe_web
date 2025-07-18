import 'package:animate_do/animate_do.dart';
import 'package:ayurvibe/gmail_form.dart';
import 'package:ayurvibe/screens/homeScreen/about.dart';
import 'package:ayurvibe/screens/homeScreen/feedback.dart';
import 'package:ayurvibe/screens/homeScreen/footer.dart';
import 'package:ayurvibe/screens/homeScreen/map_section.dart';
import 'package:ayurvibe/screens/homeScreen/service_card.dart';
import 'package:flutter/material.dart';
import 'package:ayurvibe/widgets/service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey _offerSectionKey = GlobalKey();

  void _scrollToOfferSection() {
    final RenderBox? box =
        _offerSectionKey.currentContext?.findRenderObject() as RenderBox?;
    if (box != null) {
      final offset =
          box.localToGlobal(Offset.zero, ancestor: null).dy +
          _scrollController.offset;
      _scrollController.animateTo(
        offset - 100, // adjust padding if needed
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.green.shade900,
      endDrawer: Drawer(
        backgroundColor: Colors.white,
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 24),
          children: const [
            Text(
              'Menu',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            Divider(),
            ListTile(title: Text('Home')),
            ListTile(title: Text('Services')),
            ListTile(title: Text('About')),
            ListTile(title: Text('Contact')),
          ],
        ),
      ),
      body: Builder(
        builder: (context) {
          return SingleChildScrollView(
            controller: _scrollController,

            child: Column(
              children: [
                Stack(
                  children: [
                    // Background Image
                    SizedBox(
                      height: screenHeight * 0.9,
                      width: double.infinity,
                      child: Image.asset(
                        'assets/icons/1.png',
                        fit: BoxFit.cover,
                      ),
                    ),

                    // Overlay
                    Container(
                      height: screenHeight * 0.9,
                      color: Colors.black.withOpacity(0.5),
                    ),

                    // ✅ App Bar
                    Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      child: LayoutBuilder(
                        builder: (context, constraints) {
                          bool isMobile = constraints.maxWidth < 700;

                          return Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 32,
                              vertical: 24,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                // Logo + Title
                                Row(
                                  children: [
                                    const CircleAvatar(
                                      radius: 20,
                                      backgroundColor: Colors.white,
                                      backgroundImage: AssetImage(
                                        'assets/icons/logo.png',
                                      ),
                                    ),
                                    const SizedBox(width: 12),
                                    const Text(
                                      'Sri Vinayaga Ayurvibe',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),

                                // Responsive Nav
                                isMobile
                                    ? Builder(
                                      builder:
                                          (context) => IconButton(
                                            icon: const Icon(
                                              Icons.menu,
                                              color: Colors.white,
                                            ),
                                            onPressed: () {
                                              Scaffold.of(
                                                context,
                                              ).openEndDrawer();
                                            },
                                          ),
                                    )
                                    : const Row(
                                      children: [
                                        _NavItem(title: 'Home'),
                                        SizedBox(width: 24),
                                        _NavItem(title: 'Services'),
                                        SizedBox(width: 24),
                                        _NavItem(title: 'About'),
                                        SizedBox(width: 24),
                                        _NavItem(title: 'Contact'),
                                      ],
                                    ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),

                    // ✅ Hero Text + CTA
                    Positioned.fill(
                      child: Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Text(
                              'Healing Through Ayurveda',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 42,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 12),
                            const Text(
                              'Natural wellness with ancient traditions.',
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 20,
                              ),
                            ),
                            const SizedBox(height: 24),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 24,
                                  vertical: 14,
                                ),
                                backgroundColor: Colors.green.shade700,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                              onPressed: _scrollToOfferSection,
                              child: const Text(
                                'Explore Services',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),

                // Offer Section
                Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Color(0xFFF9F7F3),
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(30),
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                    vertical: 48,
                  ),
                  child: Center(
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 1200),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'WHAT WE OFFER',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.5,
                              color: Colors.black54,
                            ),
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            'Discover Our\nHolistic Offerings',
                            style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 40),

                          // Services Grid
                          LayoutBuilder(
                            builder: (context, constraints) {
                              int columns =
                                  constraints.maxWidth > 900
                                      ? 3
                                      : constraints.maxWidth > 600
                                      ? 2
                                      : 1;

                              return FadeInUp(
                                duration: const Duration(milliseconds: 600),
                                child: GridView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: services.length,
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: columns,
                                        crossAxisSpacing: 24,
                                        mainAxisSpacing: 24,
                                        childAspectRatio: 1.2,
                                      ),
                                  itemBuilder: (context, index) {
                                    return ModernServiceCard(
                                      service: services[index],
                                    );
                                  },
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                // Footer
                Container(
                  color: const Color(0xFFFCFCFA),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 60,
                  ),
                  child: Center(
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 1200),
                      child: LayoutBuilder(
                        builder: (context, constraints) {
                          final isMobile = constraints.maxWidth < 800;
                          return isMobile
                              ? Column(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(16),
                                    child: Image.asset(
                                      'assets/icons/about.png',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  const SizedBox(height: 24),
                                  AboutTextBlock(),
                                ],
                              )
                              : Row(
                                children: [
                                  Expanded(
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(16),
                                      child: Image.asset(
                                        'assets/icons/about.png',
                                        fit: BoxFit.cover,
                                        height: 350,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 40),
                                  const Expanded(child: AboutTextBlock()),
                                ],
                              );
                        },
                      ),
                    ),
                  ),
                ),
                Container(
                  color: const Color(0xFFE8F5E9),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                    vertical: 48,
                  ),
                  width: double.infinity,
                  child: Center(
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 1000),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'CLIENT EXPERIENCES',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.green.shade900,
                              letterSpacing: 1.5,
                            ),
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            'What Our Clients Say',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                          const SizedBox(height: 40),

                          // Testimonials
                          LayoutBuilder(
                            builder: (context, constraints) {
                              bool isMobile = constraints.maxWidth < 600;

                              return Wrap(
                                spacing: 24,
                                runSpacing: 24,
                                alignment: WrapAlignment.center,
                                children: List.generate(testimonials.length, (
                                  index,
                                ) {
                                  final testimonial = testimonials[index];
                                  return SizedBox(
                                    width: isMobile ? double.infinity : 280,
                                    child: FadeInUp(
                                      delay: Duration(
                                        milliseconds: 300 * index,
                                      ),
                                      child: TestimonialCard(
                                        testimonial: testimonial,
                                      ),
                                    ),
                                  );
                                }),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                // form map
                Container(
                  color: const Color(0xFFF1F8E9),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 48,
                  ),
                  width: double.infinity,
                  child: Center(
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 1200),
                      child: LayoutBuilder(
                        builder: (context, constraints) {
                          final isMobile = constraints.maxWidth < 800;

                          return isMobile
                              ? Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  ContactMapSection(),
                                  SizedBox(height: 32),
                                  ContactFormPage(),
                                ],
                              )
                              : Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(child: ContactMapSection()),
                                  SizedBox(width: 32),
                                  Expanded(child: ContactFormPage()),
                                ],
                              );
                        },
                      ),
                    ),
                  ),
                ),
                // clinic info
                Container(
                  color: const Color(0xFF1B4332),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                    vertical: 48,
                  ),
                  child: Center(
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 1200),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Top Row
                          LayoutBuilder(
                            builder: (context, constraints) {
                              bool isMobile = constraints.maxWidth < 700;
                              return isMobile
                                  ? Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: const [
                                      FooterBrand(),
                                      SizedBox(height: 32),
                                      FooterLinks(),
                                      SizedBox(height: 32),
                                      FooterContact(),
                                    ],
                                  )
                                  : Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: const [
                                      Expanded(child: FooterBrand()),
                                      Spacer(),
                                      Expanded(child: FooterContact()),
                                    ],
                                  );
                            },
                          ),
                          const SizedBox(height: 40),
                          const Divider(color: Colors.white24),
                          const SizedBox(height: 20),
                          const Text(
                            '© 2025 Sri Vinayaga Ayurvibe. All rights reserved.',
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

// Navigation item for web-style top bar
class _NavItem extends StatelessWidget {
  final String title;
  const _NavItem({required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}

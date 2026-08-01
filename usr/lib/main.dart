import 'package:flutter/material.dart';

void main() {
  runApp(const FlyerApp());
}

class FlyerApp extends StatelessWidget {
  const FlyerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Digital Flyer',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(useMaterial3: true).copyWith(
        scaffoldBackgroundColor: const Color(0xFF0F172A), // Slate 900
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFF38BDF8), // Light Blue 400
          secondary: Color(0xFFC084FC), // Purple 400
          surface: Color(0xFF1E293B), // Slate 800
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const FlyerScreen(),
      },
    );
  }
}

class FlyerScreen extends StatelessWidget {
  const FlyerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 600),
              child: const FlyerContent(),
            ),
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 600),
                child: SizedBox(
                  width: double.infinity, // Need an expanding flex or explicit width strategy
                  height: 56,
                  child: ElevatedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Registration portal coming soon!')),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF38BDF8),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      elevation: 8,
                    ),
                    child: const Text(
                      'REGISTER NOW',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.2,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FlyerContent extends StatelessWidget {
  const FlyerContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Hero Image Placeholder (Gradient)
        Container(
          height: 250,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xFF2563EB), // Blue 600
                Color(0xFF9333EA), // Purple 600
              ],
            ),
          ),
          child: const Center(
            child: Icon(
              Icons.rocket_launch_rounded,
              size: 80,
              color: Colors.white,
            ),
          ),
        ),
        
        Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Event Type / Tag
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: const Color(0xFF38BDF8).withOpacity(0.2),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: const Color(0xFF38BDF8).withOpacity(0.5)),
                    ),
                    child: const Text(
                      'TECH CONFERENCE',
                      style: TextStyle(
                        color: Color(0xFF38BDF8),
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                        letterSpacing: 1.5,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              
              // Title
              const Text(
                'NEXUS AI\nSUMMIT 2026',
                style: TextStyle(
                  fontSize: 42,
                  fontWeight: FontWeight.w900,
                  height: 1.1,
                  letterSpacing: -1,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 16),
              
              // Description
              const Text(
                'Join the brightest minds in artificial intelligence for a three-day intensive exploration of the future. Discover next-generation algorithms, autonomous systems, and ethical AI frameworks.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white70,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 32),
              
              // Details Grid
              const InfoCard(
                icon: Icons.calendar_today_rounded,
                title: 'October 15-17, 2026',
                subtitle: 'Doors open at 9:00 AM',
              ),
              const SizedBox(height: 16),
              const InfoCard(
                icon: Icons.location_on_rounded,
                title: 'The Obsidian Center',
                subtitle: '100 Innovation Way, San Francisco',
              ),
              
              const SizedBox(height: 32),
              const Text(
                'KEYNOTE SPEAKERS',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5,
                  color: Colors.white54,
                ),
              ),
              const SizedBox(height: 16),
              
              // Speakers
              Wrap(
                spacing: 12,
                runSpacing: 12,
                children: const [
                  SpeakerChip(name: 'Dr. Elena Rostova', role: 'Head of Neural Networks'),
                  SpeakerChip(name: 'Marcus Chen', role: 'Chief AI Architect'),
                  SpeakerChip(name: 'Sarah Jenkins', role: 'Ethics & Policy Lead'),
                ],
              ),
              
              const SizedBox(height: 48), // Bottom padding
            ],
          ),
        ),
      ],
    );
  }
}

class InfoCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const InfoCard({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1E293B),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withOpacity(0.05)),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFFC084FC).withOpacity(0.2),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              icon,
              color: const Color(0xFFC084FC),
              size: 24,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SpeakerChip extends StatelessWidget {
  final String name;
  final String role;

  const SpeakerChip({super.key, required this.name, required this.role});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0xFF1E293B),
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: Colors.white.withOpacity(0.1)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            radius: 16,
            backgroundColor: const Color(0xFF38BDF8),
            child: Text(
              name.substring(0, 1),
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
              Text(
                role,
                style: const TextStyle(
                  color: Colors.white54,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

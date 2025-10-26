import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:google_fonts/google_fonts.dart';

class SmartiCareLanding extends StatelessWidget {
  const SmartiCareLanding({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SmartiCare',
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(),
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFFF6B6B)),
        useMaterial3: true,
      ),
      home: const LandingScreen(),
    );
  }
}

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 800;
    const primaryColor = Color(0xFFFF6B6B);
    final Uri githubApk = Uri.parse(
      'https://github.com/NicsMendezSuazo/smarticare-landing/releases/download/v1.0.2beta/app-arm64-v8a-release.apk',
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 60.0),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1000),
              child: Column(
                crossAxisAlignment: isMobile
                    ? CrossAxisAlignment.center
                    : CrossAxisAlignment.start,
                children: [
                  // Header
                  Row(
                    mainAxisAlignment: isMobile
                        ? MainAxisAlignment.center
                        : MainAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: primaryColor.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        padding: const EdgeInsets.all(10),
                        child: Image.asset(
                          'assets/images/icon.png',
                          height: 60,
                        ),
                      ),
                      const SizedBox(width: 14),
                      Text(
                        "SmartiCare",
                        style: GoogleFonts.poppins(
                          fontSize: 36,
                          fontWeight: FontWeight.w700,
                          color: primaryColor,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 32),

                  // Description
                  Text(
                    "SmartiCare is a community-based eye health application developed for "
                    "the Barangay Health Center of Brgy. Poblacion, Sta. Maria, Davao Occidental. "
                    "It uses AI-powered eye scanning to detect and monitor cataracts, "
                    "track progress, and connect residents with listed clinics.",
                    textAlign: isMobile ? TextAlign.center : TextAlign.start,
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      color: Colors.black87,
                      height: 1.6,
                    ),
                  ),

                  const SizedBox(height: 40),

                  // Features
                  Column(
                    crossAxisAlignment: isMobile
                        ? CrossAxisAlignment.center
                        : CrossAxisAlignment.start,
                    children: const [
                      FeatureItem(
                          text:
                              "👁️ AI-powered cataract detection via eye scan"),
                      FeatureItem(text: "📊 Progress monitoring over time"),
                      FeatureItem(text: "🏥 View listed clinics easily"),
                      FeatureItem(
                          text: "💾 Secure patient records and scan storage"),
                      FeatureItem(
                          text:
                              "🤝 Designed for Barangay Health Center operations"),
                    ],
                  ),

                  const SizedBox(height: 50),

                  // Buttons
                  Wrap(
                    alignment:
                        isMobile ? WrapAlignment.center : WrapAlignment.start,
                    spacing: 16,
                    runSpacing: 12,
                    children: [
                      ElevatedButton.icon(
                        onPressed: () async {
                          if (await canLaunchUrl(githubApk)) {
                            await launchUrl(githubApk,
                                mode: LaunchMode.externalApplication);
                          }
                        },
                        icon: const Icon(Icons.download),
                        label: const Text(
                          "Download APK (Android)",
                          style: TextStyle(fontSize: 16),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: primaryColor,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 24, vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                      OutlinedButton(
                        onPressed: () async {
                          final Uri email = Uri(
                            scheme: 'mailto',
                            path: 'support@smarticare.com',
                            query:
                                'subject=SmartiCare Support Request&body=Hello, I need help with...',
                          );
                          if (await canLaunchUrl(email)) {
                            await launchUrl(email);
                          }
                        },
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(color: primaryColor),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 24, vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Text(
                          "Contact / Support",
                          style: TextStyle(
                            fontSize: 16,
                            color: primaryColor,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 30),

                  // Footer
                  Text(
                    "Now in public beta — distributed securely via GitHub Releases. "
                    "SmartiCare is currently available for authorized Barangay Health Center staff and testers.",
                    textAlign: isMobile ? TextAlign.center : TextAlign.start,
                    style: GoogleFonts.poppins(
                      fontSize: 13,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class FeatureItem extends StatelessWidget {
  final String text;
  const FeatureItem({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xFFFF6B6B);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.check_circle, color: primaryColor, size: 20),
          const SizedBox(width: 8),
          Flexible(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 16,
                color: Colors.black87,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

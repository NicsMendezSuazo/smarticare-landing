import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:google_fonts/google_fonts.dart';

class SmartiCareLanding extends StatelessWidget {
  const SmartiCareLanding({super.key});

  final String downloadUrl =
      'https://appdistribution.firebase.google.com/testerapps/1:759640552636:android:bdf2444014f6076bb1ccb9/releases/0m4mq5ct5der8?utm_source=firebase-console';

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
                  // Header with logo and title
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

                  // App description
                  Text(
                    "SmartiCare is a community-based eye health application developed for "
                    "the Barangay Health Center of Brgy. Poblacion, Sta. Maria, Davao Occidental. "
                    "It uses advanced image scanning technology to detect and monitor cataracts, "
                    "track patient progress over time, and connect residents with nearby clinics.",
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
                              "👁️ Cataract detection using eye scan technology"),
                      FeatureItem(
                          text: "📊 Progress monitoring through scan history"),
                      FeatureItem(
                          text: "🏥 List of nearby and partner clinics"),
                      FeatureItem(
                          text: "💾 Secure record storage for each patient"),
                      FeatureItem(
                          text: "🤝 Designed for Barangay Health Center use"),
                    ],
                  ),

                  const SizedBox(height: 50),

                  // Download + Contact buttons
                  Wrap(
                    alignment:
                        isMobile ? WrapAlignment.center : WrapAlignment.start,
                    spacing: 16,
                    runSpacing: 12,
                    children: [
                      ElevatedButton.icon(
                        onPressed: () async {
                          final Uri url = Uri.parse(
                              'https://appdistribution.firebase.google.com/testerapps/1:759640552636:android:bdf2444014f6076bb1ccb9/releases/0m4mq5ct5der8?utm_source=firebase-console');
                          if (await canLaunchUrl(url)) {
                            await launchUrl(url,
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
                              horizontal: 20, vertical: 14),
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
                              horizontal: 20, vertical: 14),
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

                  // Footer note
                  Text(
                    "This app is distributed via Firebase App Distribution. "
                    "Only authorized testers and Barangay Health Center staff can access the APK.",
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
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.check_circle, color: Color(0xFFFF6B6B), size: 20),
          const SizedBox(width: 8),
          Flexible(
            child: Text(
              text,
              style: GoogleFonts.poppins(
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

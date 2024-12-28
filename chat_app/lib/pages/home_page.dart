import 'package:chat_app/components/my_drawer.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'find_hospital_page.dart';
import 'find_doctor_page.dart';
import 'notify_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Home",
          style: GoogleFonts.inter(),
        ),
      ),
      drawer: const MyDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Welcome message
              Text(
                "Welcome to HealthCare App!",
                style: GoogleFonts.inter(
                  textStyle: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Quick actions
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildQuickAction(
                    context,
                    icon: Icons.local_hospital,
                    label: "Find Hospital",
                    onTap: () {
                      // Navigate to find hospital page
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const FindHospitalPage()
                        ),
                      );
                    },
                  ),
                  _buildQuickAction(
                    context,
                    icon: Icons.person_search,
                    label: "Find Doctor",
                    onTap: () {
                      // Navigate to find doctor page
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const FindDoctorPage()
                        ),
                      );
                    },
                  ),
                  _buildQuickAction(
                    context,
                    icon: Icons.notification_important,
                    label: "Notify",
                    onTap: () {
                      // Navigate to notify page
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const NotifyPage()
                        ),
                      );
                    },
                  ),
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildQuickAction(BuildContext context, {required IconData icon, required String label, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: Theme.of(context).colorScheme.primary,
            child: Icon(icon, size: 30, color: Colors.white),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: GoogleFonts.inter(
              textStyle: TextStyle(color: Theme.of(context).colorScheme.primary),
            ),
          ),
        ],
      ),
    );
  }
}
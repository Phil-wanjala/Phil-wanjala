import 'package:flutter/material.dart';
import 'profile_settings_page.dart';
import 'notification_settings_page.dart';
import 'privacy_settings_page.dart';
import 'about_page.dart';
class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Settings")),
      body: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text("Profile Settings"),
            onTap: () {
              // navigate to profile settings page
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProfileSettingsPage(),
                ),
              );
            },
          ),

          const Divider(),
          ListTile(
            leading: const Icon(Icons.notifications),
            title: const Text("Notifications Settings"),
            onTap:() {
              // navigate to notification settings page
              Navigator.push(
                context,
                MaterialPageRoute(
                builder: (context) => NotificationSettingsPage(),
                ),
              );
            },
          ),

          const Divider(),
          ListTile(
            leading: const Icon(Icons.lock),
            title: const Text("Privacy Settings"),
            onTap: () {
              // navigate to privacy settings page
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PrivacySettingsPage(),
                ),
              );
            },
          ),

          const Divider(),
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text("About"),
            onTap: () {
              // navigate to about page
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AboutPage(),
                ),
              );
            },
          ),
        ],
      ),
      );
  }
}
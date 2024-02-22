import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

class PrivacyPolicyButton extends StatelessWidget {
  const PrivacyPolicyButton({super.key});

  @override
  Widget build(BuildContext context) {
    final Uri _privacyPolicyUri = Uri.parse(
        'https://nagi-hobbies.github.io/memopize/PrivacyPolicy/Android/English');

    Future<void> _launchPrivacyPolicy() async {
      if (!await launchUrl(_privacyPolicyUri)) {
        throw 'Could not launch $_privacyPolicyUri';
      }
    }

    return TextButton(
        onPressed: _launchPrivacyPolicy,
        child: Text('show', style: TextStyle(fontSize: 15.h)));
  }
}

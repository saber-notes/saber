
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:saber/components/settings/privacy_policy.dart';
import 'package:url_launcher/url_launcher.dart';

class LoginInputGroup extends StatefulWidget {
  const LoginInputGroup({Key? key}) : super(key: key);

  @override
  State<LoginInputGroup> createState() => _LoginInputGroupState();
}

class _LoginInputGroupState extends State<LoginInputGroup> {
  bool _showPassword = false;

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    return Column(
      children: [
        const TextField(
          decoration: InputDecoration(
            labelText: "Username or email",
            prefixIcon: Icon(Icons.person),
            filled: true,
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          obscureText: !_showPassword,
          decoration: InputDecoration(
            labelText: "Password",
            prefixIcon: const Icon(Icons.lock),
            suffixIcon: IconButton(
              icon: Icon(_showPassword ? Icons.visibility : Icons.visibility_off),
              iconSize: 18,
              onPressed: () { setState(() { _showPassword = !_showPassword; }); },
            ),
            filled: true,
          ),
        ),
        const SizedBox(height: 16),

        RichText(
          text: TextSpan(
            style: TextStyle(color: colorScheme.onBackground),
            children: [
              const TextSpan(text: "By logging in, you agree to the "),
              TextSpan(
                text: "Privacy Policy",
                style: TextStyle(color: colorScheme.primary),
                recognizer: TapGestureRecognizer()..onTap = () {
                  launchUrl(
                    PrivacyPolicy.privacyPolicyUrl,
                    mode: LaunchMode.externalApplication,
                  );
                },
              ),
              const TextSpan(text: "."),
            ],
          ),
        ),

        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: () {},
          child: const Text("Log in")
        ),
      ],
    );
  }
}

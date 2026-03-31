import 'package:flutter/material.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // DEVILS BOOK: The Obsidian Tome
            const Icon(
              Icons.menu_book_sharp,
              size: 160,
              color: Color(0xFFD4AF37), // Gold
            ),
            const SizedBox(height: 48),
            Text(
              'THE BOOK IS EMPTY',
              style: TextStyle(
                color: const Color(0xFFD4AF37), // Gold
                fontSize: 24,
                fontWeight: FontWeight.w900,
                letterSpacing: 4.0,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              'COMMENCE YOUR FIRST RITUAL',
              style: TextStyle(
                color: const Color(0x88D4AF37), // Dim Gold
                fontSize: 12,
                fontWeight: FontWeight.bold,
                letterSpacing: 2.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

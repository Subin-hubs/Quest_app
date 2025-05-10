import 'package:flutter/material.dart';
import 'quote_screen.dart';

class LanguageSelection extends StatelessWidget {
  const LanguageSelection({Key? key}) : super(key: key);

  void navigateToQuotes(BuildContext context, String language) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => QuoteScreen(language: language)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFB3E5FC), // Tranquil background
      appBar: AppBar(
        backgroundColor: const Color(0xFF4B3F72), // Twilight AppBar
        title: const Text('Select Language'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Choose your quote language:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () => navigateToQuotes(context, 'English'),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF4B3F72), // Twilight button
                foregroundColor: Colors.black, // Make text black
                minimumSize: const Size(double.infinity, 50),
              ),
              child: const Text('English Quotes'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => navigateToQuotes(context, 'Nepali'),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF4B3F72), // Twilight button
                foregroundColor: Colors.black, // Make text black
                minimumSize: const Size(double.infinity, 50),
              ),
              child: const Text('Nepali Quotes'),
            ),
          ],
        ),
      ),
    );
  }
}

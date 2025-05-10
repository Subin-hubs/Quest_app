// lib/screens/quote_screen.dart

import 'package:flutter/material.dart';
import '../data/quote_data.dart'; // Import the quote_data.dart file
import 'dart:math';
import 'package:google_fonts/google_fonts.dart';

class QuoteScreen extends StatefulWidget {
  final String language;

  const QuoteScreen({Key? key, required this.language}) : super(key: key);

  @override
  State<QuoteScreen> createState() => _QuoteScreenState();
}

class _QuoteScreenState extends State<QuoteScreen> {
  late List<String> quotes;
  late String currentQuote;

  @override
  void initState() {
    super.initState();
    // Access quotes based on the selected language
    quotes = widget.language == 'English' ? englishQuotes : nepaliQuotes;
    currentQuote = getRandomQuote();
  }

  String getRandomQuote() {
    final random = Random();
    return quotes[random.nextInt(quotes.length)];
  }

  void showNextQuote() {
    setState(() {
      currentQuote = getRandomQuote();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF6A11CB), Color(0xFF2575FC)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                centerTitle: true,
                title: Text(
                  '${widget.language} Quotes',
                  style: GoogleFonts.poppins(fontSize: 20),
                ),
              ),
              const SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Card(
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Text(
                      currentQuote,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.lobster(
                        fontSize: 24,
                        color: Colors.deepPurple,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 40),
              ElevatedButton.icon(
                onPressed: showNextQuote,
                icon: const Icon(Icons.refresh),
                label: const Text('Next Quote'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.deepPurple,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                    vertical: 12,
                  ),
                  textStyle: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
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

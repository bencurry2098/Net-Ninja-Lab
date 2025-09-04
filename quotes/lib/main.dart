import 'package:flutter/material.dart';
import 'quote.dart';
import 'quote_card.dart';

void main() => runApp(MaterialApp(home: QuoteList()));

class QuoteList extends StatefulWidget {
  @override
  _QuoteListState createState() => _QuoteListState();
}

class _QuoteListState extends State<QuoteList> {
  List<Quote> quotes = [
    Quote(
      author: 'Ricky Bobby',
      text: 'If you ain\'t first, you\'re last',
      category: 'Motivation',
      createdAt: DateTime(2025, 1, 15),
    ),
    Quote(
      author: 'Albert Einstein',
      text: 'The measure of intelligence is the ability to change.',
      category: 'Science',
      createdAt: DateTime(2025, 1, 20),
    ),
    Quote(
      author: 'Albert Einstein',
      text: 'In the middle of every difficulty lies opportunity',
      category: 'Philosophy',
      createdAt: DateTime(2025, 2, 2),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text(
          'Awesome Quotes',
          style: TextStyle(
            fontSize: 28.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'serif',
            letterSpacing: 1.5,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: Column(
        children: quotes
            .map(
              (quote) => QuoteCard(
                quote: quote,
                onDelete: () {
                  setState(() {
                    quotes.remove(quote);
                  });
                },
              ),
            )
            .toList(),
      ),
    );
  }
}

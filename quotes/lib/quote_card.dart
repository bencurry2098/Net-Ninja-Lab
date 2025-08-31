import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'quote.dart';

class QuoteCard extends StatelessWidget {
  final Quote quote;
  // Constructor
  QuoteCard({required this.quote});

  @override
  // Build method
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Quote text
            Text(
              quote.text,
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.grey[600],
              ),
            ),
            SizedBox(height: 6.0),
            // Author text
            Text(
              '- ${quote.author}',
              style: TextStyle(
                fontSize: 14.0,
                color: Colors.grey[800],
              ),
            ),
            SizedBox(height: 6.0),
            // Category chip
            Chip(label: Text(quote.category ?? 'General')),
            SizedBox(height: 6.0),
            // Creation date
            Align(
              alignment: Alignment.bottomRight,
              child: Text(
                DateFormat('MMM d, yyyy').format(quote.createdAt),
                style: TextStyle(color: Colors.grey[700]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

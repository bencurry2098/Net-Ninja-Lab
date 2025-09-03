import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'quote.dart';

class QuoteCard extends StatefulWidget {
  final Quote quote;
  QuoteCard({required this.quote});

  @override
  _QuoteCardState createState() => _QuoteCardState();
}

class _QuoteCardState extends State<QuoteCard> {
  late int likes;

  @override
  void initState() {
    super.initState();
    likes = widget.quote.likes;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              widget.quote.text,
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.grey[600],
              ),
            ),
            SizedBox(height: 6.0),
            Text(
              '- ${widget.quote.author}',
              style: TextStyle(
                fontSize: 14.0,
                color: Colors.grey[800],
              ),
            ),
            SizedBox(height: 6.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Chip(label: Text(widget.quote.category)),
                Text(
                  DateFormat('MMM d, yyyy').format(widget.quote.createdAt),
                  style: TextStyle(color: Colors.grey[700]),
                ),
                Column(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.blueAccent,
                      radius: 16,
                      child: Text(
                        '$likes',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    SizedBox(height: 4),
                    FloatingActionButton(
                      mini: true,
                      onPressed: () {
                        setState(() {
                          likes += 1;
                          widget.quote.likes = likes;
                        });
                      },
                      child: Icon(Icons.thumb_up),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
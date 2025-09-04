import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'quote.dart';

class QuoteCard extends StatefulWidget {
  final Quote quote;
  // callback to delete the quote
  final VoidCallback onDelete;

  QuoteCard({required this.quote, required this.onDelete});

  @override
  _QuoteCardState createState() => _QuoteCardState();
}

class _QuoteCardState extends State<QuoteCard> {
  // This means the likes count is mutable and can be updated
  late int likes;
  Color card_color = Colors.white;

  @override
  void initState() {
    super.initState();
    likes = widget.quote.likes;
    setCardColor(); // Call the method to set the card color
  }

  // Set the color of the card based on the category
  void setCardColor() {
    switch (widget.quote.category.toLowerCase()) {
      case 'motivation':
        card_color = Colors.lightGreen.shade100;
        break;
      case 'science':
        card_color = Colors.lightBlue.shade100;
        break;
      case 'philosophy':
        card_color = Colors.amber.shade100;
        break;
      default:
        card_color = Colors.white;
    }
  }


  @override
  Widget build(BuildContext context) {
    return Card(
      // Set card color based on category
      color: card_color,
      margin: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Row with delete button in top right
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    widget.quote.text,
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.grey[600],
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.delete, color: Colors.red),
                  // Wait for user confirmation before deleting
                  onPressed: () async {
                    final confirm = await showDialog<bool>(
                      context: context,
                      builder: (ctx) => AlertDialog(
                        title: Text('Delete Quote'),
                        content:
                            Text('Are you sure you want to delete this quote?'),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.of(ctx).pop(false),
                            child: Text('Cancel'),
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red,
                            ),
                            onPressed: () => Navigator.of(ctx).pop(true),
                            child: Text('Delete'),
                          ),
                        ],
                      ),
                    );

                    if (confirm == true) {
                      widget.onDelete();
                    }
                  },
                ),
              ],
            ),
            SizedBox(height: 6.0),
            // Author text
            Text(
              '- ${widget.quote.author}',
              style: TextStyle(
                fontSize: 14.0,
                color: Colors.grey[800],
              ),
            ),
            SizedBox(height: 6.0),
            // Row with category, date, likes, and like button
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Category chip
                Chip(label: Text(widget.quote.category)),
                // Date text
                Text(
                  DateFormat('MMM d, yyyy').format(widget.quote.createdAt),
                  style: TextStyle(color: Colors.grey[700]),
                ),
                Column(
                  children: [
                    // Likes count in a CircleAvatar
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
                    // Like button
                    IconButton(
                      icon: Icon(Icons.thumb_up, color: Colors.blueAccent),
                      onPressed: () {
                        setState(() {
                          likes += 1;
                          widget.quote.likes = likes;
                        });
                      },
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

import 'package:flutter/material.dart';
import 'package:learn_flutter/models/chat_message_entity.dart';

class ChatBubble extends StatelessWidget {
  const ChatBubble({super.key, required this.alignment, required this.entity});
  final ChatMessageEntity entity;
  final Alignment alignment;

  @override
  Widget build(BuildContext context) {
    bool isAuthor = entity.author.userName == 'duminda';
    return Align(
      alignment: alignment,
      child: Container(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.6,
        ),
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.all(50),
        decoration: BoxDecoration(
          color: isAuthor ? Colors.blue : Colors.grey,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12),
            bottomLeft: Radius.circular(12),
            topRight: Radius.circular(12),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              entity.text,
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            if (entity.imageUrl != null)
              Container(
                height: 200,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  image: DecorationImage(image: NetworkImage(entity.imageUrl!)),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

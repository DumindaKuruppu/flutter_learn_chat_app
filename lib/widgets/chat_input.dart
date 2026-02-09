import 'package:flutter/material.dart';
import 'package:learn_flutter/models/chat_message_entity.dart';
import 'package:learn_flutter/widgets/network_image_picker_body.dart';

class ChatInput extends StatelessWidget {
  final Function(ChatMessageEntity) onSubmit;
  ChatInput({super.key, required this.onSubmit});

  final chatMessageController = TextEditingController();
  void onSendButtonPressed() {
    print(chatMessageController.text);
    final newChatMessage = ChatMessageEntity(
      text: chatMessageController.text,
      id: '244',
      createdAt: DateTime.now().microsecondsSinceEpoch,
      author: Author(userName: 'duminda'),
    );

    onSubmit(newChatMessage);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () => {
              showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return NetworkImagePickerBody();
                },
              ),
            },
            icon: Icon(Icons.add, color: Colors.white),
          ),
          Expanded(
            child: TextField(
              keyboardType: TextInputType.multiline,
              maxLines: 5,
              minLines: 1,
              textCapitalization: TextCapitalization.sentences,
              controller: chatMessageController,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: "Type your message",
                hintStyle: TextStyle(color: Colors.blueGrey),
                border: InputBorder.none,
              ),
            ),
          ),
          IconButton(
            onPressed: onSendButtonPressed,
            icon: Icon(Icons.send, color: Colors.white),
          ),
        ],
      ),
    );
  }
}

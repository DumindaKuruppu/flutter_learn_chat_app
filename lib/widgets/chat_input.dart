import 'package:flutter/material.dart';
import 'package:learn_flutter/models/chat_message_entity.dart';
import 'package:learn_flutter/widgets/network_image_picker_body.dart';
import 'package:provider/provider.dart';

import '../services/auth_service.dart';

class ChatInput extends StatefulWidget {
  final Function(ChatMessageEntity) onSubmit;
  ChatInput({super.key, required this.onSubmit});

  @override
  State<ChatInput> createState() => _ChatInputState();
}

class _ChatInputState extends State<ChatInput> {
  String _selectedImageUrl = '';

  final chatMessageController = TextEditingController();

  void onSendButtonPressed() {
    print(chatMessageController.text);
    final newChatMessage = ChatMessageEntity(
      text: chatMessageController.text,
      id: '244',
      createdAt: DateTime.now().microsecondsSinceEpoch,
      author: Author(userName: context.read<AuthService>().getUserName()),
    );

    if (_selectedImageUrl.isNotEmpty) {
      newChatMessage.imageUrl = _selectedImageUrl;
    }

    widget.onSubmit(newChatMessage);
    chatMessageController.clear();
    _selectedImageUrl = '';
  }

  void onImagePicked(String newImageUrl) {
    setState(() {
      _selectedImageUrl = newImageUrl;
    });
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
                  return NetworkImagePickerBody(onImageSelected: onImagePicked);
                },
              ),
            },
            icon: Icon(Icons.add, color: Colors.white),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
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
                if (_selectedImageUrl.isNotEmpty)
                  Image.network(_selectedImageUrl, height: 100),
              ],
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

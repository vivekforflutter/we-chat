import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:we_chat/Model/chat_user.dart';

class ChatUserCard extends StatefulWidget {
  final ChatUserModel chatUserModel;
  const ChatUserCard({super.key, required this.chatUserModel});

  @override
  State<ChatUserCard> createState() => _ChatUserCardState();
}

class _ChatUserCardState extends State<ChatUserCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.5,
      // color: Colors.blue.shade100,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      margin: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
      child: InkWell(
        onTap: () {},
        child: ListTile(
          leading: const CircleAvatar(
            child: Icon(CupertinoIcons.person),
          ),
          title: Text(widget.chatUserModel.name.toString()),
          subtitle: Text(widget.chatUserModel.about.toString()),
          trailing: Text(widget.chatUserModel.createdAt.toString()),
        ),
      ),
    );
  }
}

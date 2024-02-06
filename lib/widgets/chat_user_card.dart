import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:our_chat/main.dart';
import 'package:our_chat/models/chat_user.dart';

class ChatUserCard extends StatefulWidget {
  final ChatUser users;
  const ChatUserCard({super.key, required this.users});

  @override
  State<ChatUserCard> createState() => _ChatUseracardState();
}

class _ChatUseracardState extends State<ChatUserCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: mq.width * .04, vertical: 4),
      //color: Colors.blue.shade100,
      elevation: 0.5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: InkWell(
          onTap: () {},
          child: ListTile(
            //user profile picture
            leading: const CircleAvatar(child: Icon(CupertinoIcons.person)),

            //user name
            title: Text(widget.users.name), //last message
            subtitle: Text(
              widget.users.about,
              maxLines: 1,
            ),

            // last message time
            trailing: const Text(
              '12:00 PM',
              style: TextStyle(color: Colors.black54),
            ),
          )),
    );
  }
}

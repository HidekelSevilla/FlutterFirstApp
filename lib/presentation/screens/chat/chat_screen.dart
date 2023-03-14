import 'package:flutter/material.dart';
import 'package:yes_no_app/presentation/widgets/chat/her_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/chat/my_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/shared/message_field_box.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(2.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
                'https://scontent.fcvj2-1.fna.fbcdn.net/v/t39.30808-6/246964913_1141112679752707_4261925246230600527_n.jpg?_nc_cat=111&ccb=1-7&_nc_sid=8bfeb9&_nc_eui2=AeGhcqgRW_NeTwukMY84iPgpdq8KkOy4olV2rwqQ7LiiVTifvD6PIDsheoNP7iRQYA8xo7G2-frPNO5mX5--pUib&_nc_ohc=8M7Sd4mtNJsAX-Bx4WD&_nc_ht=scontent.fcvj2-1.fna&oh=00_AfB0zsmZMgi_6bIy5pdgDcsO4UsSxjtyokYhqXTXSG4Rig&oe=64143351'),
          ),
        ),
        title: const Text('Mi Amor<3'),
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
                child: ListView.builder(
              itemCount: 100,
              itemBuilder: (context, index) {
                return (index % 2 == 0)
                    ? const HerMessageBubble()
                    : const MyMessageBubble();
              },
            )),

            ///Caja De Texto
            const MessageFieldBox(),
          ],
        ),
      ),
    );
  }
}

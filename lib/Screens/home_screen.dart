
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:we_chat/FirebaseProvider/firebase_provider.dart';
import 'package:we_chat/Model/chat_user.dart';
import 'package:we_chat/Widget/chat_card_tile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<ChatUserModel> list = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("We Chat"),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 1,
        leading: const Icon(CupertinoIcons.home),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))
        ],
      ),
      body: StreamBuilder(
        stream:
            FirebaseProvider.firebaseFirestore.collection("user").snapshots(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
            case ConnectionState.none:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case ConnectionState.done:
            case ConnectionState.active:
              final data = snapshot.data?.docs;
              list =
                  data?.map((e) => ChatUserModel.fromJson(e.data())).toList() ??
                      [];
              if (list.isNotEmpty) {
                return ListView.builder(
                    padding: const EdgeInsets.only(top: 5),
                    itemCount: list.length,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return ChatUserCard(
                        chatUserModel: list.first,
                      );
                    });
              } else {
                return const Center(
                    child: Text(
                  "No connection found!",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ));
              }
          }
        },
      ),
    );
  }
}

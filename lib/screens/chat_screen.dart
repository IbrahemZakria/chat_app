import 'package:chat_app/Constant.dart';
import 'package:chat_app/component/UserMessage.dart';
import 'package:chat_app/component/chat_bubel.dart';
import 'package:chat_app/component/custome_text_form_field.dart';
import 'package:chat_app/model/message_model.dart';
import 'package:chat_app/servise/firebaseServise/CloudFirestore/add_message_fire_store.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

// ignore: must_be_immutable
class ChatScreen extends StatelessWidget {
  ChatScreen({super.key});
  static String id = 'dfgerfgwfwgwfc';
  final Stream<QuerySnapshot> messages =
      FirebaseFirestore.instance.collection(kcollectionmessage).snapshots();
  final ScrollController _scrollController = ScrollController();

  TextEditingController messageController = TextEditingController();
  String? message;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('messages')
            .orderBy('timestamp', descending: false) // تصاعدي (أقدم إلى أحدث)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            List<MessageModel> messageslist = [];

            for (var item in snapshot.data!.docs) {
              // تحويل كل عنصر JSON إلى كائن MessageModel
              MessageModel message = MessageModel.fromJson(
                item.data(),
              );

              messageslist.add(message);
              if (_scrollController.hasClients) {
                _scrollController.animateTo(
                  _scrollController.position.maxScrollExtent,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                );
              }
            }

            return Scaffold(
                appBar: AppBar(
                  backgroundColor: kprimaryColor,
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/images/scholar.png',
                          height: 70, width: 70),
                      Text(
                        'Chat ',
                        style: TextStyle(fontSize: 30, color: Colors.white),
                      ),
                    ],
                  ),
                ),
                body: Form(
                  key: formKey,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Expanded(
                          child: ListView.builder(
                              reverse: true,
                              controller: _scrollController,
                              itemCount: messageslist.length,
                              itemBuilder: (context, index) {
                                if (messageslist[index].userEmail ==
                                    FirebaseAuth.instance.currentUser!.email) {
                                  print(
                                      "??????????????????${messageslist[index].userEmail}");
                                  return ChatBubel.chatBubelSender(
                                    message: messageslist[index].message,
                                    color: kprimaryColor,
                                  );
                                } else {
                                  print(
                                      "??????????????????${messageslist.length}");
                                  return ChatBubel.chatBubelReciver(
                                    message: messageslist[index].message,
                                    color: ksecodaryColor,
                                  );
                                }
                              }),
                        ),
                        CustomeTextFormField.CustomeTextformField(
                          validator: (data) {
                            if (data!.isEmpty) {
                              return 'Please enter your message';
                            }
                            return null;
                          },
                          onSaved: (data) {
                            message = data;
                          },
                          controller: messageController,
                          bordercolor: kprimaryColor,
                          textColor: kprimaryColor,
                          hintText: 'Type your message',
                          suffixIcon: IconButton(
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                AddMessageFireStore.addMessageToFireStore(
                                    message: message!,
                                    colectionName: kcollectionmessage);

                                messageController.clear();
                              }
                            },
                            icon: Icon(Icons.send),
                          ),
                        ),
                      ],
                    ),
                  ),
                ));
          }
        });
  }
}

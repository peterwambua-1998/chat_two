import 'package:flutter/material.dart';
import 'package:flutter_firebase_chat/modals/message.dart';
import 'package:flutter_firebase_chat/pages/discussions/group_info.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';

class SchoolLevelChat extends StatefulWidget {
  const SchoolLevelChat({super.key, required this.level});

  final String level;

  @override
  State<SchoolLevelChat> createState() => _SchoolLevelChatState();
}

class _SchoolLevelChatState extends State<SchoolLevelChat> {
  final _formKey = GlobalKey<FormState>();
  String textMessage = '';
  final TextEditingController _controller = TextEditingController();

  List<Message> messages = [
    Message(
        text: 'come through',
        date: DateTime.now().subtract(const Duration(minutes: 1)),
        isSentByMe: false),
    Message(
        text: 'i will come through',
        date: DateTime.now().subtract(const Duration(minutes: 1)),
        isSentByMe: true),
    Message(
        text: 'i will to',
        date: DateTime.now().subtract(const Duration(minutes: 1)),
        isSentByMe: false),
    Message(
        text: 'same i will',
        date: DateTime.now().subtract(const Duration(minutes: 1)),
        isSentByMe: false),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[50],
      appBar: AppBar(
        backgroundColor: Colors.purple[700],
        title: Text(widget.level),
        actions: [
          Container(
            decoration: BoxDecoration(
                color: Colors.purple[100], shape: BoxShape.circle),
            width: 30,
            height: 30,
            child: FittedBox(
              fit: BoxFit.fill,
              child: IconButton(
                  color: Colors.black,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                GroupInformation(groupName: 'Discussion One')));
                  },
                  icon: Icon(Icons.list_alt, size: 40,)),
            ),
          ),
          SizedBox(
            width: 10,
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: GroupedListView<Message, DateTime>(
              padding: EdgeInsets.all(8),
              reverse: true,
              order: GroupedListOrder.DESC,
              elements: messages,
              groupBy: (message) => DateTime(
                  message.date.year, message.date.month, message.date.day),
              groupHeaderBuilder: (message) => SizedBox(
                height: 40,
                child: Center(
                  child: Card(
                    color: Colors.purple[300],
                    child: Padding(
                      padding: EdgeInsets.all(8),
                      child: Text(
                        DateFormat.yMMMd().format(message.date),
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
              itemBuilder: (context, Message message) => ChatBubble(
                message: message,
              ),
            ),
          ),
          Container(
            color: Color.fromRGBO(184, 148, 179, 0.231),
            padding: const EdgeInsets.only(left: 5.0, bottom: 5.0, top: 5.0),
            child: Form(
              key: _formKey,
              child: Row(
                children: [
                  SizedBox(
                    width: 300,
                    child: TextFormField(
                      controller: _controller,
                      decoration: const InputDecoration(
                          contentPadding: EdgeInsets.all(12),
                          hintText: 'Type your message here...',
                          fillColor: Colors.white,
                          filled: true,
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius:
                                BorderRadius.all(Radius.circular(40.0)),
                          )),
                      onChanged: (val) {
                        if (val != 'empty') {
                          textMessage = val;
                        }
                      },
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        final message = Message(
                            text: textMessage,
                            date: DateTime.now(),
                            isSentByMe: true);
                        setState(() {
                          messages.add(message);
                        });
                        _controller.clear();
                        textMessage = '';
                      }
                    },
                    icon: const Icon(Icons.send),
                    color: Colors.white,
                    style: IconButton.styleFrom(
                        backgroundColor: Colors.purple[700]),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class ChatBubble extends StatelessWidget {
  const ChatBubble({super.key, required this.message});

  final Message message;

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment:
            message.isSentByMe ? Alignment.centerRight : Alignment.centerLeft,
        child: message.isSentByMe
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Card(
                        elevation: 1.0,
                        color: Colors.purple[200],
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(left: 12, top: 2),
                              child: Text(
                                'Peter',
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.w500),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: 12, top: 2, bottom: 12, right: 12),
                              child: Text(message.text),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                        width: 30,
                        child: CircleAvatar(
                          backgroundImage:
                              const AssetImage('assets/profile.jpg'),
                          radius: 48,
                        ),
                      ),
                    ],
                  ),
                  const Text(
                    '12:30',
                    style: TextStyle(fontSize: 10, fontWeight: FontWeight.w400),
                  )
                ],
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const SizedBox(
                        height: 30,
                        width: 30,
                        child: CircleAvatar(
                          backgroundImage:
                              const AssetImage('assets/profile.jpg'),
                          radius: 48,
                        ),
                      ),
                      Card(
                        elevation: 1.0,
                        color: Colors.white,
                        child: Padding(
                          padding: EdgeInsets.all(12),
                          child: Text(message.text),
                        ),
                      ),
                    ],
                  ),
                  const Text(
                    '12:30',
                    style: TextStyle(fontSize: 10, fontWeight: FontWeight.w400),
                  )
                ],
              ));
  }
}

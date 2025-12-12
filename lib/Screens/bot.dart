import 'package:dialog_flowtter/dialog_flowtter.dart';
import 'package:flutter/material.dart';

import 'messages.dart';

class BotScreen extends StatefulWidget {
  const BotScreen({super.key});

  @override
  State<BotScreen> createState() => _BotScreenState();
}

class _BotScreenState extends State<BotScreen> {

  late DialogFlowtter dialogFlowtter;
  final TextEditingController _controller= TextEditingController();

  List<Map<String,dynamic>> messages= [];

  @override
  void initState() {
    DialogFlowtter.fromFile().then((instance) => dialogFlowtter=instance);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "TWIGG BOT",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF0A4D2E),
              Color(0xFF1A5F3F),
              Color(0xFF0D3D25),
            ],
          ),
        ),
        child: Column(
          children: [
            Expanded(child: MessageScreen(messages: messages)),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 12
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: TextField(
                        controller: _controller,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          hintText: "What is on your mind?",
                          hintStyle: TextStyle(color: Colors.white70),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 12
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: Color(0xFF4CAF50),
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: (){
                        sendMessage(_controller.text);
                        _controller.clear();
                      },
                      icon: Icon(Icons.arrow_upward, color: Colors.white, size: 24),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  sendMessage(String text) async{
    if(text.isEmpty){
      print("Message is empty");
    }
    setState((){
      addMessage(Message(text: DialogText(text: [text])),true);
    });

    DetectIntentResponse response = await dialogFlowtter.detectIntent(
      queryInput: QueryInput(text: TextInput(text: text))
    );

    if(response.message==null) return;
    setState((){
      addMessage(response.message!);
    });
  }

  addMessage(Message message, [bool isUserMessage=false])
  {
    messages.add({'message':message,'isUserMessage':isUserMessage});
  }

}

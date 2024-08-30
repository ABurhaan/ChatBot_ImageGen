import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:ChatBot_ImageGen/image_generator/services/ai_handler.dart';
import 'package:ChatBot_ImageGen/image_generator/widgets/description_field.dart';
import 'package:ChatBot_ImageGen/image_generator/widgets/image_download_button.dart';
import 'package:ChatBot_ImageGen/image_generator/widgets/image_container.dart';
import 'package:ChatBot_ImageGen/chat_Bot/intro.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final aiHandler = AIHandler();
  String? _imageUrl;
  bool _isGenerating = false;
  String _displayMessage = 'Input a description to generate an image';

  @override
  void dispose() {
    aiHandler.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: darkTheme,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Image Generator'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => IntroductionPage(),
                ),
              );
            },
          ),
          actions: [
            ImageDownloadButton(
              imageUrl: _imageUrl,
              isGenerating: _isGenerating,
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                ImageContainer(
                  isGenerating: _isGenerating,
                  imageUrl: _imageUrl,
                  displayMessage: _displayMessage,
                ),
                const SizedBox(height: 14),
                DescriptionField(
                  isGenerating: _isGenerating,
                  onSubmitted: generateImage,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void generateImage(String prompt) async {
    setState(() => _isGenerating = true);
    final result = await aiHandler.generateImage(prompt);
    setState(() {
      _isGenerating = false;
      _imageUrl = result ?? _imageUrl;
      _displayMessage = result == null
          ? 'An error occurred. Please try again.'
          : _displayMessage;
    });
  }
}

final darkTheme = ThemeData.dark().copyWith(
  scaffoldBackgroundColor: Color.fromARGB(255, 54, 52, 52),
  appBarTheme: AppBarTheme(
    backgroundColor: Color.fromARGB(255, 53, 52, 52),
    foregroundColor: Colors.white,
  ),
);

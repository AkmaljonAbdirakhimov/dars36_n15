import 'package:dars36_n15/screens/settings_screen.dart';
import 'package:flutter/material.dart';

//! StatefulWidget yaratish uchun bizga 2 ta class kerak

//? Bulardan biri asosiy StatefulWidget klasi - bu esa public (ochiq) bo'lishi kerak
//? va State klasi - bu private (yopiq) _ klasi bo'lishi kerak

class HomeScreen extends StatefulWidget {
  final String login;
  final String password;

  HomeScreen({
    required this.login,
    required this.password,
  });

  @override
  State<StatefulWidget> createState() {
    print("Salom men create State");
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  bool isLoggedIn = false;

  //? State klasini boshlanyotganini bildiradi
  // initState() funksiyasi build()  funksiyasidan oldin ishlaydi
  // initState() funksiyasi faqat 1 marta ishlaydi
  @override
  void initState() {
    super.initState();

    print("Salom men initState");

    isLoggedIn = widget.login == "admin" && widget.password == "123456";
  }

  void hello() {
    final width = MediaQuery.of(context).size.width;
  }

  //! dispose() funksiyasi qachonki ushbu widgetimiz yopilsa ya'ni Widget daraxtidan yuqolsa
  @override
  void dispose() {
    print("Dispose funksiyasi ishladi va widget o'ldi");
    super.dispose();
  }

  //? build funksiyasini vazifasi Widgetlarni qurish
  // build() funksiyasi esa bir necha marta ishlayveradi
  @override
  Widget build(BuildContext context) {
    print("Salom men build");
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text("Mahsulotlar"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (ctx) {
                    return SettingsScreen();
                  },
                ),
              );
            },
            icon: Icon(Icons.settings),
          ),
        ],
      ),
      body: Center(
        child: Text(
          isLoggedIn ? "Tizimga kirgan" : "Tizimga kirmagan",
          style: TextStyle(fontSize: 40),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //! setState() funksiyasini vazifasi build() funksiyasini qayta ishga tushirish
          setState(() {});
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

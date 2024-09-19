import 'package:flutter/material.dart';
import 'package:trip_app/fade_animation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>with SingleTickerProviderStateMixin {
  late PageController pageController;
  int currentPage = 0;
// Track current page
  int totalPage = 4;

  @override
  void initState() {
    super.initState();
    pageController = PageController(
      initialPage: 2,
    )..addListener(onScroll);
  }

  void onScroll() {
    setState(() {
      currentPage = pageController.page!.round(); // Update current page index
    });
  }

  @override
  void dispose() {
    pageController.dispose(); // Dispose the controller to prevent memory leaks
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        children: [
          makePage(
              'images/a.jpg',
              'élégance du silence',
              'In deep stillness, the soul finds a subtle and soothing beauty."',
              4),
          makePage(
              'images/b.jpg',
              'Un nouvel horizon',
              'Every sunrise offers us a chance to discover new beginnings."',
              2),
          makePage(
              'images/c.jpg',
              'Un voyage dans le temps ',
              'Between past and present, every moment unveils forgotten stories."',
              3),
          makePage(
              'images/d.jpg',
              'À la découverte du monde',
              'Travel opens the mind to hidden wonders and fascinating cultures."',
              4),
        ],
      ),
    );
  }

  Widget makePage(image, title, description, page) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover)),
      child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  FadeAnimation(2, Text(
                    page.toString(),
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),),),
                  Text(
                    '/' + totalPage.toString(),
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  )
                ],
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     Text(
                      title,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 40),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 3),
                          child:
                              Icon(Icons.star, color: Colors.yellow, size: 15),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 3),
                          child:
                              Icon(Icons.star, color: Colors.yellow, size: 15),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 3),
                          child:
                              Icon(Icons.star, color: Colors.yellow, size: 15),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 3),
                          child:
                              Icon(Icons.star, color: Colors.yellow, size: 15),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 3),
                          child: Icon(Icons.star, color: Colors.grey, size: 15),
                        ),
                        Text(
                          '4.0',
                          style: TextStyle(
                            color: Colors.white70,
                          ),
                        ),
                        Text(
                          '(2300)',
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 10,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                   FadeAnimation(2,  Padding(
                      padding: const EdgeInsets.only(right: 50),
                      child: Text(
                        description,
                        style: TextStyle(
                            color: Colors.white70.withOpacity(.7),
                            height: 1.9,
                            fontSize: 15),
                      ),
                    ),),
                    SizedBox(
                      height: 20,
                    ),
                   FadeAnimation(2.5,  Text('READ MORE',
                        style: TextStyle(
                          color: Colors.white,
                        ))),
                  ],
                ),
              )
            ],
          )),
    );
  }
}

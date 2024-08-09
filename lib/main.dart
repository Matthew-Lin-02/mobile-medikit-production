import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'color.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
   
      create: (context) => MyAppState(),
      
      child: MaterialApp(
        title: 'medi_kit',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: AppColors.cream),
          scaffoldBackgroundColor: AppColors.cream, 
        ),
        home: MyHomePage(),
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {
  var currentPageNum = 0;
  
  var pages = <Widget>[];

  MyAppState() {
    _initializePages();
  }

  void _initializePages() {
    // Initialize your pages here
    pages = [
      // insert page 1 here

      // page 2
      Page2()
      // Add more pages as needed
    ];
    notifyListeners();
  }

  void incrementPageNum(){
    currentPageNum ++;
    notifyListeners();
  }

  void decrementPageNum(){
    currentPageNum --;
    notifyListeners();
  }

  void setPageNum(pageNumber){
    currentPageNum = pageNumber;
    notifyListeners();
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    // final theme = Theme.of(context);

    return Scaffold(
      body:  appState.pages[appState.currentPageNum],
    );
  
  }
}

class Page2 extends StatelessWidget {
  const Page2({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 50,
        left:65,
        right: 75
    
      ),
      child:Column(
        children: [
          BackArrowWelcomeRow(),
          Text(
            "Wayiwa-n feeling today?",
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 70,),
          FittedBox(child: RowOfButtons()),
          SizedBox(height: 70,),
          Align(
            alignment:Alignment.bottomRight,
            child: RedActionButton(iconData: Icons.check_circle,label: "Submit"),
            
          ),
          // minimumSize: WidgetStateProperty.all<Size>(Size(95, 95)), // Width, Height
        
        
      
        ],
      ),
    );
  }
}

class RedActionButton extends StatelessWidget {
  const RedActionButton({
    super.key,
    this.iconData,
    required this.label,
  });

  final IconData? iconData;
  final String label;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {
        print("Submit button pressed, go to next page");
      },
      icon: iconData != null ? Icon(iconData) : SizedBox.shrink(), // Conditionally show the icon
      label: Text(
        label,
        style: TextStyle(color: Colors.white, fontSize: 20),
      ),
      style: ButtonStyle(
        iconColor: WidgetStateProperty.all(Colors.white),
        backgroundColor: WidgetStateProperty.all(AppColors.red),
        minimumSize: WidgetStateProperty.all<Size>(Size(200, 80)),
      ),
    );
  }
}

class BackArrowWelcomeRow extends StatelessWidget {
  const BackArrowWelcomeRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
       
        bottom:35,
 
      ),
      child: Row(
        children:[
          
          BackArrow(),
          WelcomeColumn(),
    
       
        ]
      ),
    );
  }
}

class WelcomeColumn extends StatelessWidget {
  const WelcomeColumn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start ,
      mainAxisSize: MainAxisSize.min,
      children: [                    
        Padding(
          padding: const EdgeInsets.only(left: 85),
          child: ColoredWelcome(),
        ),               
        Transform.translate(
          offset:  Offset(0, -20),
          child: Text(
            'Karratanyju Olivia!',
            style: TextStyle(
              fontSize: 60,
              fontWeight: FontWeight.bold,
            )          
          ),
        ),
      ],
    );
  }
}

class BackArrow extends StatelessWidget {
  const BackArrow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 0,
        right: 20,
        left: 20,
        bottom: 25,
      ),
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Color.fromRGBO(15, 13, 11, 1.0), width: 2.5), 
        ),
        child: IconButton(
          onPressed: () {
            // appState.placeHolde();
          },
          color: Color.fromRGBO(15, 13, 11, 1.0),
          icon: Icon(Icons.arrow_back),
        ),
      ),
    );
  }
}

class ColoredWelcome extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        RichText(
          text: TextSpan(
              text: 'Welcome',
              style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.normal,
              foreground: Paint()
                ..style = PaintingStyle.stroke
                ..strokeWidth = 3
                ..color = Colors.black,
            ),
          ),
        ),
        RichText(
          text: TextSpan(
            children: <TextSpan>[
              TextSpan(
                text: 'W',
                style: TextStyle(color: AppColors.red),
              ),
              TextSpan(
                text: 'e',
                style: TextStyle(color: AppColors.green),
              ),
              TextSpan(
                text: 'l',
                style: TextStyle(color: AppColors.orange),
              ),
              TextSpan(
                text: 'c',
                style: TextStyle(color: AppColors.blue),
              ),
              TextSpan(
                text: 'o',
                style: TextStyle(color: AppColors.red),
              ),
              TextSpan(
                text: 'm',
                style: TextStyle(color: AppColors.green),
              ),
              TextSpan(
                text: 'e',
                style: TextStyle(color: AppColors.orange),
              ),
            ],
            style: TextStyle(fontSize:40 ,fontWeight: FontWeight.normal),
          ),
        ),

      ]
    );
  }
}


class RowOfButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Widget> buttons = []; // Create an empty list of widgets

    for (int i = 0; i < 5; i++) {
      buttons.add(
        Container(
       
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            
          ),
          child: TextButton(
            onPressed: () {
              print('Button $i pressed');
            },
            style: ButtonStyle(
              // to remove the hover effect
              overlayColor: WidgetStateProperty.all(Colors.transparent),
              minimumSize: WidgetStateProperty.all<Size>(Size(95, 95)), // Width, Height
            
            ),
            
            child: Text(''),
          ),
        ),
      );
    }

    return 
      Container(
        width: 660,
        height: 95,
    
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.png'),  // Replace with your image path
            fit: BoxFit.contain,  // This fits the image to cover the entire container
          ),
        ),
        
        child: Row(
          
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: buttons, // Pass the list to the Row widget
        ),
      );
  }
}
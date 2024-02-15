import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        
        colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 53, 159, 221)),
        useMaterial3: true,
      ),
      home: const LedMatrix(),
    );
  }
}

class LedMatrix extends StatefulWidget {
  const LedMatrix({super.key});

  @override
  State<LedMatrix> createState() => _LedMatrixState();
}

class _LedMatrixState extends State<LedMatrix> {
  int num = 0;
  int num2 = 0;
  List<List<List<int>>> dotsList = [
    [
      [0, 1, 1, 1, 0],
      [1, 0, 0, 0, 1],
      [1, 0, 0, 0, 1],
      [1, 0, 0, 0, 1],
      [1, 0, 0, 0, 1],
      [1, 0, 0, 0, 1],
      [0, 1, 1, 1, 0],
    ],
    // Digit 1
    [
      [0, 0, 1, 0, 0],
      [0, 1, 1, 0, 0],
      [0, 0, 1, 0, 0],
      [0, 0, 1, 0, 0],
      [0, 0, 1, 0, 0],
      [0, 0, 1, 0, 0],
      [0, 1, 1, 1, 0],
    ],
    // Digit 2
    [
      [0, 1, 1, 1, 0],
      [1, 0, 0, 0, 1],
      [0, 0, 0, 0, 1],
      [0, 0, 0, 1, 0],
      [0, 0, 1, 0, 0],
      [0, 1, 0, 0, 0],
      [1, 1, 1, 1, 1],
    ],
    // Digit 3
    [
      [0, 1, 1, 1, 0],
      [1, 0, 0, 0, 1],
      [0, 0, 0, 0, 1],
      [0, 1, 1, 1, 0],
      [0, 0, 0, 0, 1],
      [1, 0, 0, 0, 1],
      [0, 1, 1, 1, 0],
    ],
    // Digit 4
    [
      [0, 0, 0, 1, 0],
      [0, 0, 1, 1, 0],
      [0, 1, 0, 1, 0],
      [1, 0, 0, 1, 0],
      [1, 1, 1, 1, 1],
      [0, 0, 0, 1, 0],
      [0, 0, 0, 1, 0],
    ],
    // Digit 5
    [
      [1, 1, 1, 1, 1],
      [1, 0, 0, 0, 0],
      [1, 1, 1, 1, 0],
      [0, 0, 0, 0, 1],
      [0, 0, 0, 0, 1],
      [1, 0, 0, 0, 1],
      [0, 1, 1, 1, 0],
    ],
    // Digit 6
    [
      [0, 1, 1, 1, 0],
      [1, 0, 0, 0, 1],
      [1, 0, 0, 0, 0],
      [1, 1, 1, 1, 0],
      [1, 0, 0, 0, 1],
      [1, 0, 0, 0, 1],
      [0, 1, 1, 1, 0],
    ],
    // Digit 7
    [
      [1, 1, 1, 1, 1],
      [0, 0, 0, 0, 1],
      [0, 0, 0, 1, 0],
      [0, 0, 1, 0, 0],
      [0, 1, 0, 0, 0],
      [0, 1, 0, 0, 0],
      [0, 1, 0, 0, 0],
    ],
    // Digit 8
    [
      [0, 1, 1, 1, 0],
      [1, 0, 0, 0, 1],
      [1, 0, 0, 0, 1],
      [0, 1, 1, 1, 0],
      [1, 0, 0, 0, 1],
      [1, 0, 0, 0, 1],
      [0, 1, 1, 1, 0],
    ],
    // Digit 9
    [
      [0, 1, 1, 1, 0],
      [1, 0, 0, 0, 1],
      [1, 0, 0, 0, 1],
      [0, 1, 1, 1, 1],
      [0, 0, 0, 0, 1],
      [1, 0, 0, 0, 1],
      [0, 1, 1, 1, 0],
    ]
  ];

  Widget _buildDot(int num, int i, int j) {
    var dot = dotsList[num];
    return Container(
    width: 20,
    height: 20,
    margin: const EdgeInsets.all(3),
    decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: dot[i][j] == 1 
        ? const Color.fromARGB(255, 255, 56, 56) 
        : const Color.fromARGB(255, 29, 24, 24)),  
    );
  }

  Widget _buildMatrix(int num) {
    List<Widget> rows = [];
    for(int i =0 ; i<dotsList[num].length; i++){
      List<Widget> columns = [];
      for(int j =0 ; j<dotsList[num][i].length; j++){
        columns.add(_buildDot(num, i, j));
      }
      rows.add(Row(mainAxisAlignment: MainAxisAlignment.center,
        children: columns
      ));
    }
    return Column(mainAxisAlignment: MainAxisAlignment.center,
      children: rows
    );
    
  }

  Widget _buildDotIncrease() {
    return RawMaterialButton(
      onPressed: () {
        setState(() {
          if(num2 < 9){
            num2++;
          }else{
            num2 = 0;
            if(num < 9){
              num++;
            }else {
              num = 0;
            }
          }
        });
      },
      elevation: 10.0,
      fillColor: Colors.green,
      child: Icon(Icons.arrow_drop_up,size: 80,),
      shape: CircleBorder(),
    );
  }

  Widget _buildDotDecrease() {
    return RawMaterialButton(
      onPressed: () {
        setState(() {
          if(num2 > 0){
            num2--;
          }else{
            num2 = 9;
            if(num > 0){
              num--;
            }else {
              num = 9;
            }
          }
        });
      },
      elevation: 5.0,
      fillColor: Colors.green,
      child: Icon(Icons.arrow_drop_down,size: 80,),
      shape: CircleBorder(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'CP-SU LED MATRIX',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 0, 0, 0),
      ),
      body: Container(
        color: Color.fromARGB(255, 48, 205, 226),
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          _buildDotIncrease(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                width: 400,
                height: 300,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      blurRadius: 30.0,
                      spreadRadius: 1,
                    )
                  ],
                  border: Border.all(color: Colors.white, width: 5),
                  color: Colors.black,
                ),
                child: Row(
                  children: [
                    _buildMatrix(num),
                    SizedBox(width: 20),
                    _buildMatrix(num2)
                  ],
                ),
              ),
            ],
          ),
          _buildDotDecrease(),
        ]),
      ),
    );
  }
}

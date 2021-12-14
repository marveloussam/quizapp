
import 'package:exp/model/question.dart';
import 'package:flutter/material.dart';

class Quiz extends StatefulWidget {
  const Quiz({Key? key}) : super(key: key);

  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> {

  int currentQuestionIndex = 0;



  List questionBank = [
    Question.name(' The name of the object is tv?', true),
    Question.name(' It is an input device', false),
    Question.name(' The name of the object is printer', false),
    Question.name(' It is an output device', true),
    
  ];

  @override
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: Text('True Citizen'),
      ),
      body:

      
       Builder(builder: (BuildContext context) =>
         Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(
                child: Image.asset(
                  'image/tv.jpg',
                  width: 500,
                  height: 240,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(14.4),
                      border: Border.all(
                        color: Colors.blueGrey.shade400,
                        style: BorderStyle.solid,
                      )),
                  height: 120.0,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        questionBank[currentQuestionIndex].questionText,
                        style: TextStyle(
                          fontSize: 16.9,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blueGrey.shade900,
                      onPrimary: Colors.white,
                    ),
                    onPressed: () => _checkAnswer(true, context),
                    child: Text(
                      ' TRUE ',
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blueGrey.shade900,
                      onPrimary: Colors.white,
                    ),
                    onPressed:  () => _checkAnswer(false, context),
                    child: Text(
                      ' FALSE ',
                    ),
                  ),

                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      
                      primary: Colors.blueGrey.shade900
       
                    ),
                    onPressed: _previousQuestion,
                    child: Icon(Icons.arrow_back, color: Colors.white,)
       
                    
                  ),
       
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      
                      primary: Colors.blueGrey.shade900
       
                    ),
                    onPressed: _nextQuestion,
                    child: Icon(Icons.arrow_forward, color: Colors.white,)
       
                    
                  ),
       
       
       
                ],
       
                  
                  
              ),
       
              
              Spacer(),
            ]),
       ),
    ),
     
    
    
    
    );

  
  }

      _updateQuestion () {

       setState(() {

        currentQuestionIndex = (currentQuestionIndex + 1) % questionBank.length ;
        
      });

      }



      _nextQuestion() { 
      
      _updateQuestion();

    }

    _previousQuestion() {

      setState(() {


        currentQuestionIndex = (currentQuestionIndex - 1) % questionBank.length;


        
      });




    }

    _checkAnswer( bool userChoice, context) {

      if( userChoice == questionBank[currentQuestionIndex].isCorrect) {

        debugPrint('You are correct');


        final snackbar = SnackBar(
          
          backgroundColor: Colors.green,
          duration: Duration(milliseconds: 500),
          content: Text('You are Correct', textAlign: TextAlign.center));



        
        ScaffoldMessenger.of(context).showSnackBar(snackbar);
          
      
          
        



      } else {

       debugPrint('You are wrong');

        
         
                

        final snackbar = SnackBar(

          backgroundColor: Colors.red,          
          duration: Duration(milliseconds: 500),          
          content: Text('You are wrong', textAlign: TextAlign.center,));

       
        ScaffoldMessenger.of(context).showSnackBar(snackbar);

      
       


      } 

      _updateQuestion();



    }
}

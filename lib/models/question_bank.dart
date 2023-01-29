import 'package:twr/models/questions_answers.dart';

class QuestionBank {
  int questionNumber = 0;
  int answerNumber = 0;
  String? inputAnswer;

  final List<QuestionAnswers> _questionBank = [
    QuestionAnswers(
      question:
          'How easy was it to find the service(s) you were looking for on TWR?',
      answer: ['Very Easy', 'Easy', 'Neutral', 'Difficult', 'Very Difficult'],
    ),
    QuestionAnswers(
      question:
          'Were you able to get the support you needed from the organisation(s)?',
      answer: ['Yes', 'No', 'Maybe', 'I dont know', 'Prefer not to say'],
    ),
    QuestionAnswers(
      question:
          'Which service(s) areas have you used the most on TWR? E.g. Mental Health, Supporting Families',
      answer: [''],
    ),
    QuestionAnswers(
      question: 'If any, what other services would you like to see on TWR?',
      answer: [''],
    ),
    QuestionAnswers(
      question: 'How easy was it to find your way around the site?',
      answer: ['Very Easy', 'Easy', 'Neutral', 'Difficult', 'Very Difficult'],
    ),
    QuestionAnswers(
      question:
          'If you have shared any of the services, please tell us which sharing options you chose',
      answer: ['Text', 'Email', 'Twitter', 'Linkedin', 'Facebook'],
    ),
    QuestionAnswers(
      question: 'Did you use the language translate feature?',
      answer: ['Yes', 'No', 'Maybe', 'I dont know', 'Prefer not to say'],
    ),
    QuestionAnswers(
      question: 'How did you hear about TWR?',
      answer: [
        'Word of mouth',
        'The App',
        'Online search',
        'From a professional',
        'Advertisement'
      ],
    ),
    QuestionAnswers(
      question: 'How could we improve TWR?',
      answer: [''],
    ),
    QuestionAnswers(
      question: 'Would you recommend TWR to your friends and family?',
      answer: ['Yes', 'No', 'Maybe', 'I dont know', 'Prefer not to say'],
    ),
    QuestionAnswers(
      question: 'How many times have you used TWR?',
      answer: [
        '1 - 5 times',
        '5 -10 times',
        '10 - 20 times',
        '20 - 30 times',
        'More than 30 times'
      ],
    ),
  ];

  int newQuestionNumber() {
    return (questionNumber);
  }

  String getQuestion() {
    return _questionBank[questionNumber].question;
  }

  String getAnwser(int answerNumber) {
    return _questionBank[questionNumber].answer[answerNumber];
  }

  List allAnwser() {
    return _questionBank[questionNumber].answer;
  }

  void nextQuestion() {
    if (questionNumber < _questionBank.length - 1) {
      questionNumber++;
    }
  }

  double questionLen() {
    return _questionBank.length.toDouble();
  }

  bool finishedQuestion() {
    return questionNumber == (_questionBank.length - 1);
  }

  void numberOfOptions() {
    // return _questionBank[questionNumber].answer[answerNumber].isEmpty;
    if (_questionBank[questionNumber].answer[answerNumber].isEmpty) {
      _questionBank[questionNumber].answer[answerNumber] = inputAnswer;
    }
  }

  bool noAnwser() {
    return _questionBank[questionNumber].answer[answerNumber].isNotEmpty;
  }
}

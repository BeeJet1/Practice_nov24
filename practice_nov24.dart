import 'dart:io';

import 'package:practice_nov24/practice_nov24.dart' as practice_nov24;

void main() {
  //print(taxApp()); // Task 1
  //print(calcApp()); // Task 2
  // print(docType()); // Task 3

  double initialBalance = 100.000;
  double currentBalance = initialBalance;
  print('Welcome to X-Bank App');
  bankApp(currentBalance); //Additional task
}

String? taxApp() {
  print('Enter your income:');
  double income = double.parse(stdin.readLineSync()!);
  double taxPercent;

  if (income <= 10000) {
    taxPercent = 0;
  } else if (income <= 50000) {
    taxPercent = 0.1;
  } else {
    taxPercent = 0.12;
  }

  double taxAmount = income * taxPercent;

  print('Income amount: \$${income.toStringAsFixed(2)}');
  print('Tax percent: ${(taxPercent * 100).toStringAsFixed(2)}%');
  print('Tax amount: \$${taxAmount.toStringAsFixed(2)}');
}

String? calcApp() {
  print('Enter number:');
  double num1 = double.parse(stdin.readLineSync()!);

  print('Choose your calculation (+, -, *, /):');
  String calc = stdin.readLineSync()!;

  print('Enter number:');
  double num2 = double.parse(stdin.readLineSync()!);

  double result;

  switch (calc) {
    case '+':
      result = num1 + num2;
      break;
    case '-':
      result = num1 - num2;
      break;
    case '*':
      result = num1 * num2;
      break;
    case '/':
      if (num2 != 0) {
        result = num1 / num2;
      } else {
        print('error: diving to 0');
        return 'try again';
      }
      break;
    default:
      print('error: incorrect calculation');
      return 'try again';
  }

  print('Result: $result');
}

String? docType() {
  print('Enter document type (Ex.: ".txt", ".jpg", ".pdf"):');
  String fileExtension = stdin.readLineSync()!;
  String fileType;

  switch (fileExtension) {
    case '.txt':
      break;
      fileType = 'Text file';
    case '.jpg':
    case '.jpeg':
    case '.png':
      fileType = 'Image';
    case '.pdf':
      fileType = 'PDF document';
      break;
    default:
      fileType = 'Unknown document';
      break;
      break;
      print('Documnet type: $fileType');
  }
}

void bankApp(double currentBalance) {
  print('\n Choose option:');
  print('1. Deposit');
  print('2. Get cash');
  print('3. Request balance');
  print('4. Close bank balance');
  print('0. Exit');

  String? userChoice = stdin.readLineSync() ?? '';

  switch (userChoice) {
    case '1':
      print('Enter deposit amount:');

      double depositAmount = double.parse(stdin.readLineSync() ?? '');
      depositAmount += currentBalance;
      print('Deposit accepted. Current balance: $currentBalance');
      if(depositAmount <= currentBalance) {
        depositAmount += currentBalance; 
      } else {
        print('Not enough amount: $currentBalance');
      }
      break;
    case '2':
      print('Enter amount to get cash:');
      double withdrawalAmount = double.parse(stdin.readLineSync() ?? '');
      if (withdrawalAmount <= currentBalance) {
        currentBalance -= withdrawalAmount;
        print('Withdrawal was successful. Curent balance: $currentBalance');
      } else {
        print('Error: Insufficient funds in the account.');
      }
      break;
    case '3':
      print('Current balance: $currentBalance');
      break;
    case '4':
      print('Account closed. Exiting operation.');
      exit(0);
      // ignore: dead_code
      break;
    case '0':
      print('Exit');
      exit(0);
      // ignore: dead_code
      break;
    default:
      print('Error: incorrect operation. Please, try again.');
  }
  bankApp(currentBalance);

}

import 'dart:io';
import './encryptor.dart';

void main(List<String> args) {
  print(
      'Welcome to Ogudu Jonathan Stage 1 Task (Encryption & Decryption Program)');

  while (true) {
    stdout.write(
        'Enter D to initiate Decryption, E to initiate Encryption or Q to Quit: ');
    String? plainText = stdin.readLineSync();

    if (plainText == 'E' || plainText == 'e') {
      stdout.write('Enter the text to encrypt: ');
      String? textToEncrypt = stdin.readLineSync();
      stdout.write('Enter the key: ');
      String? key = stdin.readLineSync();

      if (textToEncrypt != null && key != null) {
        final encryptor = Encryptor(key: key);
        String encryptedText = encryptor.encrypt(textToEncrypt);
        print('Encrypted Text: $encryptedText');
      }
    } else if (plainText == 'D' || plainText == 'd') {
      stdout.write('Enter the text to decrypt: ');
      String? textToDecrypt = stdin.readLineSync();
      stdout.write('Enter the key: ');
      String? key = stdin.readLineSync();

      if (textToDecrypt != null && key != null) {
        final encryptor = Encryptor(key: key);
        String decryptedText = encryptor.decrypt(textToDecrypt);
        print('Decrypted Text: $decryptedText');
      }
    } else if (plainText == 'Q' || plainText == 'q') {
      print('Goodbye!');
      break;
    } else {
      print('Invalid Input');
    }
  }
}

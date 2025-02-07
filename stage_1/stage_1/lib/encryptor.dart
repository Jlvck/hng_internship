import 'dart:convert';
import 'dart:io';

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

class Encryptor {
  final String key;

  Encryptor({required this.key});

  //Encrypt the plain text
  String encrypt(String plainInputText) {
    List<int> textInputBytes =
        utf8.encode(plainInputText); //Encode  Text input to utf8
    List<int> keyBytes = utf8.encode(key); //Encode Key to utf8
    List<int> encryptedBytes = _xor(textInputBytes, keyBytes); //XOR operation

    return base64.encode(encryptedBytes);
  }

  //Decrypt the encrypted text
  String decrypt(String encryptedInputText) {
    List<int> encryptedBytes =
        base64.decode(encryptedInputText); //Decode encrypted text to base64
    List<int> keyBytes = utf8.encode(key); //Encode Key to utf8
    List<int> decryptedBytes = _xor(encryptedBytes, keyBytes); //XOR operation

    return utf8.decode(decryptedBytes);
  }

  // XOR operation
  List<int> _xor(List<int> text, List<int> key) {
    int keyLength = key.length;

    return List.generate(
      text.length,
      (i) =>
          text[i] ^
          key[i %
              keyLength], //ensures the key is repeated to match the length of the text
    );
  }
}

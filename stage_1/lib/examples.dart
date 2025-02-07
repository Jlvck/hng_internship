import './encryptor.dart';

void main(List<String> args) {
  String plainTextExample1 = 'Jonathan is a Manchester United Fan';
  final key1 = 'Football';

  final encryptor1 = Encryptor(key: key1);

  String encryptedTextExample1 = encryptor1.encrypt(plainTextExample1);
  String decryptedTextExample1 = encryptor1.decrypt(encryptedTextExample1);

  print('Example 1. Plain Text: $plainTextExample1, Key: $key1');
  print('Example 1. Encrypted Text: $encryptedTextExample1');
  print('Example 1. Decrypted Text: $decryptedTextExample1');

  print('-----------------------------------');

  String encryptedTextExample2 =
      'GzomRyxORTYGDxQNSUFzHRJHEUhUcxYEFBEAWD1UFQ8AAEY8Bg0D';
  final key2 = 'Stage 1';

  final encryptor2 = Encryptor(key: key2);

  String decryptedTextExample2 = encryptor2.decrypt(encryptedTextExample2);

  print('Example 2. Encrypted Text: $encryptedTextExample2, Key: $key2');
  print('Example 2. Decrypted Text: $decryptedTextExample2');
}

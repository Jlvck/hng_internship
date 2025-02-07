import './encryptor.dart';

void main(List<String> args) {
  final key1 = 'Jonathan Secret Key';
  final key2 = 'Stage 1 HNG internship';

  final encryptor1 = Encryptor(key: key1);

  final encryptor2 = Encryptor(key: key2);

  String plainTextExample1 = 'Jonathan is a Manchester United Fan';
  String plainTextExample2 = 'HNG is the best in the world';

  String encryptedTextExample1 = encryptor1.encrypt(plainTextExample1);
  String decryptedTextExample1 = encryptor1.decrypt(encryptedTextExample1);

  String encryptedTextExample2 = encryptor2.encrypt(plainTextExample2);
  String decryptedTextExample2 = encryptor2.decrypt(encryptedTextExample2);

  print('Example 1. Plain Text: $plainTextExample1, Key: $key1');
  print('Example 1. Encrypted Text: $encryptedTextExample1');
  print('Example 1. Decrypted Text: $decryptedTextExample1');

  print('-----------------------------------');

  print('Example 2. Plain Text: $plainTextExample2, Key: $key2');
  print('Example 2. Encrypted Text: $encryptedTextExample2');
  print('Example 2. Decrypted Text: $decryptedTextExample2');
}

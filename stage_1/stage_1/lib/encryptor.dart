import 'dart:convert';

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
      (i) => text[i] ^ key[i % keyLength],
    );
  }
}

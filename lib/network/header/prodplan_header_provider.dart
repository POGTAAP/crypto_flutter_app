class CryptoHeaderProvider {
  static String apiKey = "8d6654c4-4ff4-4b6f-96d6-41b392a67246";

  CryptoHeaderProvider();

  Map<String, String> getHeaders() {
    final headers = {"X-CMC_PRO_API_KEY":apiKey};
    return headers;
  }
}

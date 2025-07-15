class RestClientMultipart {
  final String fileKey;
  final String fileName;
  final String path;
  final String? urlSuffix;
  final List<int>? fileBytes;

  RestClientMultipart({
    required this.fileKey,
    required this.fileName,
    required this.path,
    this.urlSuffix,
    required this.fileBytes,
  });
}

class ReceiptUploadResponseDto {
  final String path;
  final String url;
  final String originalName;
  final int size;
  final String mimeType;

  const ReceiptUploadResponseDto({
    required this.path,
    required this.url,
    required this.originalName,
    required this.size,
    required this.mimeType,
  });

  factory ReceiptUploadResponseDto.fromJson(Map<String, dynamic> json) {
    return ReceiptUploadResponseDto(
      path: json['path'] as String,
      url: json['url'] as String,
      originalName: json['original_name'] as String,
      size: json['size'] as int,
      mimeType: json['mime_type'] as String,
    );
  }
}
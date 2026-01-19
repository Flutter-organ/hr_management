class VerifyOtpDto {
    VerifyOtpDto({
        required this.identifier,
        required this.code,
        required this.type,
    });

    String identifier;
    String code;
    String type;
}

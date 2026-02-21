import 'package:equatable/equatable.dart';

enum WarrantyStatus {
  active,
  expired,
  off;
  bool get isActive => this == WarrantyStatus.active;
}

class OfficeAsset extends Equatable {
  final int id;
  final String name;
  final String brand;
  final String? model;
  final String? serialNumber;
  final WarrantyStatus warrantyStatus;
  final DateTime? warrantyExpireDate;
  final DateTime buyingDate;
  final DateTime receivedOn;
  final String? imageUrl;
  final String? description;
  final String? category;

  const OfficeAsset({
    required this.id,
    required this.name,
    required this.brand,
    this.model,
    this.serialNumber,
    required this.warrantyStatus,
    this.warrantyExpireDate,
    required this.buyingDate,
    required this.receivedOn,
    this.imageUrl,
    this.description,
    this.category,
  });

  static const months =[
    'January', 'February', 'March', 'April', 'May', 'June',
    'July', 'August', 'September', 'October', 'November', 'December'
  ];

  /// Formatted buying date: "12 September 2020"
  String get formattedBuyingDate {
    return '${buyingDate.day} ${months[buyingDate.month - 1]} ${buyingDate.year}';
  }

  /// Formatted received date: "14 September 2020"
  String get formattedReceivedDate {
    return '${receivedOn.day} ${months[receivedOn.month - 1]} ${receivedOn.year}';
  }

  String get fullName {
    if (model != null && model!.isNotEmpty) {
      return '$name $model';
    }
    return name;
  }

  @override
  List<Object?> get props => [
    id,
    name,
    brand,
    model,
    serialNumber,
    warrantyStatus,
    warrantyExpireDate,
    buyingDate,
    receivedOn,
    imageUrl,
    description,
    category,
  ];
}
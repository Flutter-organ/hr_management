import 'package:easy_localization/easy_localization.dart';

import '../../domain/entity/gender.dart';

extension GenderExtension on Gender {
  String toDisplayString() {
    switch (this) {
      case Gender.male:
        return 'male'.tr();
      case Gender.female:
        return 'female'.tr();
    }
  }
}
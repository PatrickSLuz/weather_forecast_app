class AddressModel {
  final String? city;
  final String? state;
  final String? postalCode;
  final String? country;
  final String? isoCountryCode;

  AddressModel({
    this.city,
    this.state,
    this.postalCode,
    this.country,
    this.isoCountryCode,
  });

  String get stateWithIsoCountryCode {
    String result = '';
    if (state != null && state!.isNotEmpty) {
      result = state!;
    }
    if (isoCountryCode != null && isoCountryCode!.isNotEmpty) {
      if (result.isNotEmpty) {
        result += ', $isoCountryCode';
      } else {
        result = isoCountryCode!;
      }
    }
    return result;
  }

  @override
  String toString() {
    String address = '';
    if (city != null && city!.isNotEmpty) {
      address = city!;
    }
    if (stateWithIsoCountryCode.isNotEmpty) {
      if (address.isNotEmpty) {
        address += ', $stateWithIsoCountryCode';
      } else {
        address = stateWithIsoCountryCode;
      }
    }
    return address;
  }
}

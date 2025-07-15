class CloudinessModel {
  /// (all) Cloudiness, %
  final num percent;

  CloudinessModel({
    required this.percent,
  });

  CloudinessModel copyWith({
    num? percent,
  }) {
    return CloudinessModel(
      percent: percent ?? this.percent,
    );
  }
}

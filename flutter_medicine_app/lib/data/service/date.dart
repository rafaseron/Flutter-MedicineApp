String getNowDate() {
  final now = DateTime.now().toString().toDBModelData();
  return now;
}

extension ToDBModelData on String {
  String toDBModelData() {
    return '${this}Z';
  }
}

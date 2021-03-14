class Disease {
  String _diseaseName;
  String _causes;
  String _treatment;
  String _dimage;

  Disease(
      {String diseaseName, String causes, String treatment, String dimage}) {
    this._diseaseName = diseaseName;
    this._causes = causes;
    this._treatment = treatment;
    this._dimage = dimage;
  }

  String get diseaseName => _diseaseName;
  set diseaseName(String diseaseName) => _diseaseName = diseaseName;
  String get causes => _causes;
  set causes(String causes) => _causes = causes;
  String get treatment => _treatment;
  set treatment(String treatment) => _treatment = treatment;
  String get dimage => _dimage;
  set dimage(String dimage) => _dimage = dimage;

  Disease.fromJson(Map<String, dynamic> json) {
    _diseaseName = json['disease_name'];
    _causes = json['causes'];
    _treatment = json['treatment'];
    _dimage = json['dimage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['disease_name'] = this._diseaseName;
    data['causes'] = this._causes;
    data['treatment'] = this._treatment;
    data['dimage'] = this._dimage;
    return data;
  }
}
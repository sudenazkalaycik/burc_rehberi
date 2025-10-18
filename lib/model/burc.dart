class Burc {
  final String _burcAdi;
  final String _burc_Tarihi;
  final String _burcDetayi;
  final String _burcKucukResim;
  final String _burcBuyukResim;

  // getter methodlar -->gizli değişkenlere ulaşılabilmesi için
  get burcAdi => this._burcAdi;

  get burcTarihi => this._burc_Tarihi;

  get burcDetayi => this._burcDetayi;

  get burcKucukResim => this._burcKucukResim;

  get burcBuyukResim => this._burcBuyukResim;

  Burc(
    this._burcAdi,
    this._burc_Tarihi,
    this._burcDetayi,
    this._burcKucukResim,
    this._burcBuyukResim,
  );

  @override
  String toString() {
    return '$_burcAdi - $_burcBuyukResim';
  }
}

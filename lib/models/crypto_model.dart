class Crypto{
    String coinName;
    String acronym;
    double marketPrice;
    double daylow;
    double dayhigh;
    String img;

    Crypto({required this.coinName, required this.acronym, required this.marketPrice, required this.daylow, required this.dayhigh, required this.img});
    
    factory Crypto.fromJson(Map<String, dynamic> json) {
    return Crypto(
      coinName: json['coins'][0]['coinName'],
      acronym: json['coins'][0]['coin'],
      marketPrice: json['coins'][0]['regularMarketPrice'],
      daylow: json['coins'][0]['regularMarketDayLow'],
      dayhigh: json['coins'][0]['regularMarketDayhigh'],
      img: json['coins'][0]['coinImageUrl'],
    );
  }
}
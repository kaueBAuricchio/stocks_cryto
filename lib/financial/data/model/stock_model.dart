import 'package:equatable/equatable.dart';

class StockModel extends Equatable {
  final String symbol;
  final String name;

  const StockModel({this.symbol = '', this.name = ''});

  factory StockModel.fromJson(Map<String, dynamic> map) {
    return StockModel(
      symbol: map['trading_symbol'] ?? '',
      name: map['registrant_name'] ?? '',
    );
  }

  static List<StockModel> fromListMap(List maps) {
    return maps.map((map) => StockModel.fromJson(map)).toList();
  }

  @override
  List<Object?> get props => [symbol, name];
}

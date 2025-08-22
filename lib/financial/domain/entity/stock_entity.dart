import 'package:equatable/equatable.dart';

class StockEntity extends Equatable {
  final String symbol;
  final String name;

  const StockEntity({this.symbol = '', this.name = ''});

  @override
  List<Object?> get props => [symbol, name];
}

enum HistoryType {
  card(type: 'CARD'),
  jackpot(type: 'JACKPOT');

  const HistoryType({required this.type});

  final String type;
}

class HistoryEntity {
  final int limit;
  final int offset;
  final HistoryType historyType;
  HistoryEntity({
    required this.limit,
    required this.offset,
    required this.historyType,
  });
}

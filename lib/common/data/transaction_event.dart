// 트랜잭션 데이터를 날짜별로 매핑
import 'dart:collection';

import 'package:flutter_moneybag_2024/data/data_source/sample_transaction_data_source.dart';
import 'package:flutter_moneybag_2024/domain/model/transaction_detail.dart';
import 'package:table_calendar/table_calendar.dart';

final Map<DateTime, List<TransactionDetail>> kTransactionEvents = LinkedHashMap<DateTime, List<TransactionDetail>>(
  equals: isSameDay,
  hashCode: (DateTime key) => key.day * 1000000 + key.month * 10000 + key.year,
)..addAll(generateSampleTransactions());

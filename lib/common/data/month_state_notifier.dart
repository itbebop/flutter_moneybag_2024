import 'package:flutter_moneybag_2024/common/data/month_list.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final monthStateProvider = StateNotifierProvider<MonthStateNotifier, MonthList>((ref) {
  return MonthStateNotifier();
});

class MonthStateNotifier extends StateNotifier<MonthList> {
  MonthStateNotifier() : super(MonthList.values[DateTime.now().month - 1]);

  DateTime setMonth(MonthList month) {
    state = month;
    return DateTime.utc(DateTime.now().year, month.month, DateTime.now().day);
  }

  Future<void> setMonthAndFetchEvents(WidgetRef ref, MonthList month) async {
    setMonth(month);
  }
}

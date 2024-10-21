import 'package:flutter_moneybag_2024/common/data/month_list.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final monthStateProvider = StateNotifierProvider<MonthStateNotifier, MonthList>((ref) {
  return MonthStateNotifier();
});

class MonthStateNotifier extends StateNotifier<MonthList> {
  MonthStateNotifier() : super(MonthList.jan);

  void setMonth(MonthList month) {
    state = month;
  }

  // 새로운 메서드 추가: 월을 설정하고 이벤트를 가져오는 메서드
  Future<void> setMonthAndFetchEvents(WidgetRef ref, MonthList month) async {
    setMonth(month);
    // 현재 월에 대한 이벤트를 가져오는 로직 추가

    // 이벤트를 처리하는 로직 추가 (예: 상태 업데이트 등)
  }
}

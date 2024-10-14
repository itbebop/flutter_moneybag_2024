import 'package:flutter_moneybag_2024/common/common_component/floating_add_button/floating_daangn_button.state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final floatingButtonStateProvider = StateNotifierProvider<FloatingButtonStateNotifier, FloatingButtonState>(
  (ref) => FloatingButtonStateNotifier(
    const FloatingButtonState(false, false, false),
  ),
);

class FloatingButtonStateNotifier extends StateNotifier<FloatingButtonState> {
  FloatingButtonStateNotifier(super.state);

  bool needToMakeButtonBigger = false;

  @override
  bool updateShouldNotify(old, current) {
    // statte에 할당할 때 넘겨주는 새로운 state와 기존의 value에 들어있는 state를 비교하는 함수
    return super.updateShouldNotify(old, current); // 같지 않다면 true
    // 이렇게 쓰려면 실제로 다른 값이 내려오게 해야함
    // return true; // 무조건 바뀌었다고 알려주는 것(편법)
  }

  void toggleCategoryMenu() {
    final isExpanded = state.isExpanded;
    final isSmall = state.isSmall;
    state = state.copyWith(isExpanded: !isExpanded, isSmall: needToMakeButtonBigger ? false : true);

    // 초기화
    if (needToMakeButtonBigger) {
      needToMakeButtonBigger = false;
    }
    // 버튼 커져있는 상태 && expand되지 않은 (layer 띄운) 상태
    if (!isSmall && !isExpanded) {
      needToMakeButtonBigger = true;
    }
    if (isSmall) state = state.copyWith(isClassified: !isSmall);
  }

  void changeButtonSize(bool isSmall) {
    // state = state..isSmall = isSmall;

    // state = FloatingButtonState(state.isExpanded, isSmall);

    state = state.copyWith(isSmall: isSmall);
  }

  void toggleTransactionMenu() {
    final isClassified = state.isClassified;

    state = state.copyWith(isClassified: !isClassified);
  }
}

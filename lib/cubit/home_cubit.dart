part of 'home_states.dart';




class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitialState()) {
    getUsers();
  }
  CurrencyService currencyService = CurrencyService();
  Future<void> getUsers() async {
    emit(HomeLoadingState());
    await currencyService.getCurrency().then((dynamic response) => {
          if (response is List<Course>)
            {emit(HomeCompleteState(response))}
          else
            {emit(HomeErrorState(response))}
        });
  }
}

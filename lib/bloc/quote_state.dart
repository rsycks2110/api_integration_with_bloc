import '../model/data_model.dart';

abstract class QuoteState {
}
class QuotesInitialState extends QuoteState{}
class QuotesLoadingState extends QuoteState{}
class QuotesLoadedState extends QuoteState{
  DataModel mData;
  QuotesLoadedState({required this.mData});
}
class QuotesErrorState extends QuoteState{
  String errorMsg;
  QuotesErrorState({required this.errorMsg});
}

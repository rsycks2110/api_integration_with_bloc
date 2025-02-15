

import 'dart:convert';

import 'package:api_integration_with_bloc/api/api_helper.dart';
import 'package:api_integration_with_bloc/api/url.dart';
import 'package:api_integration_with_bloc/bloc/quote_event.dart';
import 'package:api_integration_with_bloc/bloc/quote_state.dart';
import 'package:api_integration_with_bloc/exception_handling/app_exceptions.dart';
import 'package:api_integration_with_bloc/model/data_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class QuoteBloc extends Bloc<QuoteEvent,QuoteState>{

  ApiHelper apiHelper;
  QuoteBloc({required this.apiHelper}):super(QuotesInitialState()){
    on<GetQuoteEvent>((event,state) async{
      emit(QuotesLoadingState());

        var mResponseData = await apiHelper.getApi(Url: Urls.getQuotesUrl);
        try{
        if (mResponseData != null) {
          var jsonResponse = DataModel.fromJson(mResponseData);
          emit(QuotesLoadedState(mData: jsonResponse));
        } else {
          emit(QuotesErrorState(errorMsg: 'Oh Error Ocuured'));
        }
      } catch (e){
        throw((e as AppExceptions).toErrorMsg());
      }
    });
    
    
}
}

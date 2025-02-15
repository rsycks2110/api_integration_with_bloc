import 'package:api_integration_with_bloc/bloc/quote_bloc.dart';
import 'package:api_integration_with_bloc/bloc/quote_event.dart';
import 'package:api_integration_with_bloc/bloc/quote_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserPage extends StatefulWidget{

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
@override
  void initState() {
    super.initState();
    BlocProvider.of<QuoteBloc>(context).add(GetQuoteEvent());

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Quotes"),
      ),
      body: BlocBuilder<QuoteBloc,QuoteState>(builder: (context,state){
        if(state is QuotesLoadingState){
          return Center(
            child: CircularProgressIndicator(),
          );

        } else if(state is QuotesErrorState){
          return Text(state.errorMsg);
        }
       else if(state is QuotesLoadedState){
          return ListView.builder(
              itemCount: 5,
              itemBuilder: (context,index){
            //    var mDataModel=state.mData!.quotes![index];
                return ListTile(
                  titleAlignment: ListTileTitleAlignment.top,
                  leading: Text("${state.mData.quotes![index].id} . " ,style: TextStyle(fontWeight: FontWeight.bold,color: Colors.orange,fontSize: 15),),
                  title: Text("${state.mData.quotes![index].quote}",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.green)),
                subtitle: Text("${state.mData.quotes![index].author}",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.red)),
                //  subtitle: Text("${mDataModel.author}"),
                );
          });
        }
         return Container();

      }),
    );
  }
}
class DataModel{
  int? limit;
  int? skip;
  int? total;
  List<QuotesModel>? quotes;

  DataModel({required this.limit,required this.skip,required this.total,required this.quotes});

  factory DataModel.fromJson(Map<String,dynamic> json){

    List<QuotesModel> mQuotes=[];

    for(Map<String,dynamic> eachQuote in json["quotes"]){
      var eachModel= QuotesModel.fromJson(eachQuote);
      mQuotes.add(eachModel);
    }
    return DataModel(limit: json["limit"], skip: json["skip"], total: json["total"],
        quotes: mQuotes);
  }
}
class QuotesModel{
  String? author;
  int? id;
  String? quote;

  QuotesModel({required this.author,required this.id , required this.quote});

  factory QuotesModel.fromJson(Map<String,dynamic> json){
    return QuotesModel(author: json["author"], id: json["id"], quote: json["quote"]);
  }
}


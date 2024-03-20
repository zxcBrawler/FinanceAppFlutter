class TransactionModel {
  String? title;
  int? amount;
  String? type;
  String? date;
  String? timestamp;

  TransactionModel(
      {this.title, this.amount, this.type, this.date, this.timestamp});

  TransactionModel.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        amount = json['amount'],
        type = json['type'],
        date = json['date'],
        timestamp = json['timestamp'];

  Map<String, dynamic> toJson() => {
        'title': title,
        'amount': amount,
        'type': type,
        'date': date,
        'timestamp': timestamp,
      };
}

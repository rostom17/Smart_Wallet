import 'package:smart_wallet/features/common/data/models/base_model.dart';
import 'package:smart_wallet/features/expense/domain/entities/expense_entity.dart';

class ExpenseModel extends BaseModel<ExpenseEntity> {
  final int? id;
  final String? title;
  final double? amount;
  final DateTime? date;

  ExpenseModel({
    required this.id,
    required this.title,
    required this.amount,
    required this.date,
  });

  factory ExpenseModel.fromJson(Map<String, dynamic> json) {
    return ExpenseModel(
      id: json['id'],
      title: json['title'],
      amount: json['amount'].toDouble(),
      date: DateTime.parse(json['date']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id ?? 0,
      'title': title ?? 'Unknown Expense',
      'amount': amount ?? 0.0,
      'date': date?.toIso8601String(),
    };
  }

  @override
  ExpenseEntity toEntity() {
    return ExpenseEntity(
      id: id ?? 0,
      title: title ?? 'Unknown Expense',
      amount: amount ?? 0.0,
      date: date ?? DateTime.now(),
    );
  }
}

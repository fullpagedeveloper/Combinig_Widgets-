import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transaction;

  TransactionList(this.transaction);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: transaction.map((txt) {
            return Card(
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(
                      10,
                    ),
                    margin: EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 15,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                        width: 2,
                      ),
                    ),
                    child: Text(
                      txt.amount.toString(),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(txt.title),
                      Text(
                        DateFormat.yMMMEd().format(txt.date),
                      ),
                    ],
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      )
    );
  }
}

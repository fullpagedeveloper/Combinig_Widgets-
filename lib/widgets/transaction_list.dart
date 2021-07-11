import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transaction;

  TransactionList(this.transaction);

  ///[ListView.builder(itemBuilder: null)] hanya memuat apa yang terlihat
  ///ListView menampilkan semuany

  ///[ListView]
  // @override
  // Widget build(BuildContext context) {
  //   return Container(
  //     height: 300,
  //     child: ListView(
  //         children: transaction.map((txt) {
  //           return Card(
  //             child: Row(
  //               children: [
  //                 Container(
  //                   padding: EdgeInsets.all(
  //                     10,
  //                   ),
  //                   margin: EdgeInsets.symmetric(
  //                     vertical: 10,
  //                     horizontal: 15,
  //                   ),
  //                   decoration: BoxDecoration(
  //                     border: Border.all(
  //                       color: Colors.black,
  //                       width: 2,
  //                     ),
  //                   ),
  //                   child: Text(
  //                     txt.amount.toString(),
  //                   ),
  //                 ),
  //                 Column(
  //                   crossAxisAlignment: CrossAxisAlignment.start,
  //                   children: [
  //                     Text(txt.title),
  //                     Text(
  //                       DateFormat.yMMMEd().format(txt.date),
  //                     ),
  //                   ],
  //                 ),
  //               ],
  //             ),
  //           );
  //         }).toList(),
  //       ),
  //     );
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: ListView.builder(
        itemBuilder: (ctx, index) {
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
                      color: Theme.of(context).primaryColor,
                      width: 2,
                    ),
                  ),
                  child: Text(
                    ///toStringAsFixed(2) membulatkan bilangan
                    '\$${transaction[index].amount.toStringAsFixed(2)}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(transaction[index].title),
                    Text(
                      DateFormat.yMMMEd().format(transaction[index].date),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
        itemCount: transaction.length,
      ),
    );
  }
}

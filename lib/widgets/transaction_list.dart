import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';
import 'transaction_item.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transaction;
  final Function deleteTxt;

  TransactionList(this.transaction, this.deleteTxt);

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
    return transaction.isEmpty
        ? LayoutBuilder(
            builder: (txt, constrain) {
              return Column(
                children: [
                  Text(
                    "No Transactions added yet!",
                    style: Theme.of(context).textTheme.title,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: constrain.maxHeight * 0.6,
                    child: Image.asset(
                      'assets/images/waiting.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              );
            },
          )
        : ListView(
            children: transaction
                .map((txt) => TransactionItem(
                    key: ValueKey(txt.id), transaction: txt, deleteTxt: deleteTxt))
                .toList()
            //  itemBuilder: (ctx, index) {
            // return Card(
            //   child: Row(
            //     children: [
            //       Container(
            //         padding: EdgeInsets.all(
            //           10,
            //         ),
            //         margin: EdgeInsets.symmetric(
            //           vertical: 10,
            //           horizontal: 15,
            //         ),
            //         decoration: BoxDecoration(
            //           border: Border.all(
            //             color: Theme.of(context).primaryColor,
            //             width: 2,
            //           ),
            //         ),
            //         child: Text(
            //           ///toStringAsFixed(2) membulatkan bilangan
            //           '\$${transaction[index].amount.toStringAsFixed(2)}',
            //           style: TextStyle(
            //             fontWeight: FontWeight.bold,
            //             fontSize: 20,
            //             color: Theme.of(context).primaryColor,
            //           ),
            //         ),
            //       ),
            //       Column(
            //         crossAxisAlignment: CrossAxisAlignment.start,
            //         children: [
            //           Text(transaction[index].title),
            //           Text(
            //             DateFormat.yMMMEd().format(transaction[index].date),
            //           ),
            //         ],
            //       ),
            //     ],
            //   ),
            // );
            //     return TransactionItem(transaction: transaction[index], deleteTxt: deleteTxt);
            //   },
            //   itemCount: transaction.length,
            );
  }
}

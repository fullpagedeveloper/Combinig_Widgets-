import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

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
        : ListView.builder(
            itemBuilder: (ctx, index) {
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
              return Card(
                elevation: 5,
                margin: EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 5,
                ),
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: FittedBox(
                          child: Text('\$${transaction[index].amount}')),
                    ),
                  ),
                  title: Text(
                    transaction[index].title,
                    style: Theme.of(context).textTheme.title,
                  ),
                  subtitle:
                      Text(DateFormat.yMMMEd().format(transaction[index].date)),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    color: Theme.of(context).errorColor,
                    onPressed: () => deleteTxt(transaction[index].id),
                  ),
                ),
              );
            },
            itemCount: transaction.length,
          );
  }
}

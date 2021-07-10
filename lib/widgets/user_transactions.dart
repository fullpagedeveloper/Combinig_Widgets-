import 'package:flutter/material.dart';
import 'new_transaction.dart';
import 'transaction_list.dart';
import '../models/transaction.dart';

class UserTransactions extends StatefulWidget {
  @override
  _UserTransactionState createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransactions> {
  // final List<Transaction> _uerTransactions = [
  //   Transaction(
  //     id: 't1',
  //     title: 'New Shoes',
  //     amount: 69.99,
  //     date: DateTime.now(),
  //   ),
  //   Transaction(
  //     id: 't2',
  //     title: 'Waaaao Oooo',
  //     amount: 69.99,
  //     date: DateTime.now(),
  //   )
  // ];
  //
  // ///[addNewTransaction]
  // void _addNewTransaction(String txTitle, double txAmount) {
  //   final newTx = Transaction(
  //       id: DateTime.now().toString(),
  //       title: txTitle,
  //       amount: txAmount,
  //       date: DateTime.now());
  //
  //   setState(() {
  //     _uerTransactions.add(newTx);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // NewTransaction(
        //   _addNewTransaction,
        // ),
        // TransactionList(_uerTransactions),
      ],
    );
  }
}

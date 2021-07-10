import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  void submitedData() {
    final entredTitle = titleController.text;
    final entredAmount = double.parse(amountController.text);

    //dummy validation
    if(entredTitle.isEmpty || entredAmount <= 0) {
      return;
    }

    widget.addTx(
        entredTitle,
        entredAmount,
    );

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: titleController,
              onSubmitted: (_) => submitedData,
              // onChanged: (val) {
              //   titleInput = val;
              // },
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submitedData,
              // onChanged: (val) => amountInput = val
            ),
            FlatButton(
              //onPressed: () {
                // print(titleInput);
                // print(amountInput);
                // print(titleController.text);
                // addTx(
                //   titleController.text,
                //   double.parse(amountController.text),
                // );

              //},
              onPressed: submitedData,
              child: Text('Add transaction'),
              textColor: Colors.purple,
            ),
          ],
        ),
      ),
    );
  }
}

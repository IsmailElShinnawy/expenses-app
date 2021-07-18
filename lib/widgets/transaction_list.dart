import 'package:flutter/material.dart';

import './transaction_item.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTransaction;

  TransactionList(this.transactions, this.deleteTransaction);

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? LayoutBuilder(
            builder: (ctx, constraints) {
              return Column(
                children: <Widget>[
                  Text(
                    'There are no transactions yet',
                    style: Theme.of(context).textTheme.title,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: constraints.maxHeight * 0.6,
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
            children: transactions
                .map((transaction) => TransactionItem(
                      key: ValueKey(transaction.id),
                      transaction: transaction,
                      deleteTransaction: deleteTransaction,
                    ))
                .toList(),
          );
    // : ListView.builder(
    //     itemCount: transactions.length,
    //     itemBuilder: (ctx, index) {
    //       return TransactionItem(
    //           transaction: transactions[index],
    //           deleteTransaction: deleteTransaction);
    //     },
    //   );
  }
}

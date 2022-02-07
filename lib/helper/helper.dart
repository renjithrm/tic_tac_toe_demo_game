import 'package:flutter/material.dart';

class Helper {
  static List<Widget> builder<M>(
          List<M> model, Widget Function(int index, M model) build) =>
      model
          .asMap()
          .map<int, Widget>(
              (index, model) => MapEntry(index, build(index, model)))
          .values
          .toList();

  static isWinner(int x, int y, List<List<String>> matrix, int countMatrix) {
    var col = 0, row = 0, diag = 0, rdiag = 0;
    final player = matrix[x][y];
    final n = countMatrix;

    for (int i = 0; i < n; i++) {
      if (matrix[x][i] == player) col++;
      if (matrix[i][y] == player) row++;
      if (matrix[i][i] == player) diag++;
      if (matrix[i][n - i - 1] == player) rdiag++;
    }

    return row == n || col == n || diag == n || rdiag == n;
  }
}

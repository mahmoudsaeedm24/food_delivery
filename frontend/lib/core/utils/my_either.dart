// class MyEither<L, M, R> {
//   C match<C>(C Function(L l) onLeft,C Function(M m) onMiddle ,C Function(R r) onRight) {
//     return 
//   }

// }

// class Left<L, M, R> extends MyEither<L, M, R> {
//   final L? left;

//   Left({required this.left});

//   bool get isLeft => left != null;
// }

// class Middle<L, M, R> extends MyEither<L, M, R> {
//   final M? middle;

//   Middle({required this.middle});

//   bool get isMiddle => middle != null;
// }

// class Right<L, M, R> extends MyEither<L, M, R> {
//   final R? right;

//   Right({required this.right});

//   bool get isright => right != null;
// }

// class Help {
//   MyEither<int, String, bool> either(int x) {
//     if (x == -1) {
//       return Left(left: x);
//     } else if (x == 0) {
//       return Middle(middle: "Ok man");
//     } else {
//       return Right(right: true);
//     }
//   }

//   box() {
//     final b = either(5);

//     b.
//   }
// }

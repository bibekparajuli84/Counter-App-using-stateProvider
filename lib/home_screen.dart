import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod/legacy.dart';

//to read value for both stateful and stateless widget
// final helo = Provider<String>((ref) {
//   return 'subscribe';
// });
// final age = Provider<int>((ref) => 25);

final counter = StateProvider<int>((ref) => 0);

// EXAMPLE FOR STATEFUL WIDGET

// class HomeScreen extends ConsumerStatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   ConsumerState<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends ConsumerState<HomeScreen> {
//   @override
//   Widget build(BuildContext context) {
//     final helo1 = ref.watch(helo);
//     final age1 = ref.watch(age);
//     return Scaffold(
//       appBar: AppBar(title: Text('helo')),
//       body: Center(child: Text("$helo1 $age1")),
//     );
//   }
// }

// EXAMPLE FOR STATELESS WIDGET
// class HomeScreen extends ConsumerWidget {
//   const HomeScreen({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final helo1 = ref.watch(helo);
//     final age1 = ref.watch(age);
//     return Scaffold(
//       appBar: AppBar(title: Text('helo')),
//       body: Center(child: Text(helo1 + age1.toString())),
//     );
//   }
// }
// STATEPROVIDER USED IN STATELESS WIDGET
class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print("build");
    return Scaffold(
      appBar: AppBar(title: Text("Counter app")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Counter app'),
            SizedBox(width: 10),
            Consumer(
              builder: (context, ref, child) {
                final count = ref.watch(counter);
                return Center(child: Text(count.toString()));
              },
            ),
            SizedBox(width: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    ref.read(counter.notifier).state++;
                  },
                  child: Text('+'),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    ref.read(counter.notifier).state--;
                  },
                  child: Text('-'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

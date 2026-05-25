import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:state_sample/product_list_screen.dart';
import 'package:state_sample/provider_types/list_manager_changeNotifier.dart';
import 'package:state_sample/provider_types/provider_sample.dart';

void main() {
  // PlatformDispatcher.instance.onBeginFrame = (timestamp) {
  //   final recorder = PictureRecorder();
  //   final canvas = Canvas(recorder);
  //   canvas.drawCircle(Offset(200, 200), 50, Paint()..color = Color(0xFF2DBD3A));
  //   final picture = recorder.endRecording();
  //   final scene = SceneBuilder()..addPicture(Offset.zero, picture);
  //   PlatformDispatcher.instance.views.first.render(scene.build());
  // };
  // PlatformDispatcher.instance.scheduleFrame();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (context) => UserService()),
        ChangeNotifierProvider(create: (context) => ListManager()),
      ],
      child: MaterialApp(

          home: Scaffold(body: const Test())),
    );
  }
}

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  static const int count = 0;
  void update() {
    setState(() {});
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    debugPrint('initState');
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final media = MediaQuery.sizeOf(context);
    debugPrint('DID CHANGE DEPENDENCIES CALLED');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(child: Text(context.read<UserService>().userName)),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (routeContext) {
                  return
                    FutureProvider<List<String>>(
                        key: UniqueKey(),
                        lazy: false,
                        create: (routeContext) => routeContext.read<UserService>().getProductList(),
                        initialData: [],
                        child:

                    ProductListScreen());
                },
              ),
            );
          },
          child: Text('Product list'),
        ),
        Expanded(
          child: Consumer<ListManager>(
            builder: (context, value, child) {
              return ListView.builder(
                itemCount: context.read<ListManager>().x.length,
                itemBuilder: (context, index) {
                  return B(value: context.read<ListManager>().x[index]);
                },
              );
            },
          ),
        ),
      ],
    );
  }

  @override
  void didUpdateWidget(covariant Test oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    debugPrint('did update widget');
  }
  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
    debugPrint("deactivate");
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    debugPrint("dispose");
  }
}

class A extends StatelessWidget {
  final int count;
  const A({super.key, required this.count});

  @override
  Widget build(BuildContext context) {
   // print('build a');
    return const Text('A');
  }
}

class B extends StatelessWidget {
  final int value;
  const B({super.key, required this.value});

  @override
  Widget build(BuildContext context) {
    // debugPrint('b');
    return Container(
      color: Colors.yellow,
      padding: EdgeInsets.all(12.0),
      margin: EdgeInsets.all(12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('$value'),
          ElevatedButton(
            onPressed: () {
              context.read<ListManager>().removeItem(value);
            },
            child: Text('Remove'),
          ),
        ],
      ),
    );
  }
}

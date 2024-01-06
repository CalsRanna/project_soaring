import 'package:flutter/material.dart';
import 'package:project_soaring/router/router.dart';

class Toolbar extends StatelessWidget {
  const Toolbar({super.key});

  static const pages = ['角色', '洞府', '战斗', '地宫', '试炼'];

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        for (var page in pages)
          ToolbarTile(
            label: page,
            onTap: () => replace(context, page),
          ),
      ],
    );
  }

  void replace(BuildContext context, String page) {
    var _ = switch (page) {
      '角色' => const CharacterPageRoute().replace(context),
      '洞府' => const CharacterPageRoute().replace(context),
      '装备' => const EquipmentPageRoute().push(context),
      '背包' => const BackpackPageRoute().push(context),
      '地图' => const AreasPageRoute().push(context),
      '地宫' => const DungeonsPageRoute().push(context),
      '试炼' => const TrialsPageRoute().push(context),
      _ => null,
    };
  }
}

class ToolbarTile extends StatefulWidget {
  const ToolbarTile({
    super.key,
    required this.label,
    this.onTap,
  });

  final String label;
  final void Function()? onTap;

  @override
  State<ToolbarTile> createState() => _ToolbarTileState();
}

class _ToolbarTileState extends State<ToolbarTile> {
  @override
  Widget build(BuildContext context) {
    // return GestureDetector(
    //   behavior: HitTestBehavior.opaque,
    //   onTap: widget.onTap,
    //   child: SizedBox(
    //     height: 80,
    //     width: 80,
    //     child: Stack(
    //       children: [
    //         Center(
    //           child: Transform.rotate(
    //             angle: pi / 4,
    //             child: Container(
    //               alignment: Alignment.center,
    //               decoration: BoxDecoration(
    //                 border: Border.all(
    //                   color: Theme.of(context).colorScheme.onSurface,
    //                 ),
    //               ),
    //               height: 48,
    //               padding: const EdgeInsets.symmetric(vertical: 8),
    //               width: 48,
    //             ),
    //           ),
    //         ),
    //         Center(child: Text(widget.label))
    //       ],
    //     ),
    //   ),
    // );
    return RhombusContainer();
  }
}

class RhombusContainer extends StatelessWidget {
  const RhombusContainer({super.key, this.size, this.child});

  final Size? size;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: const _RhombusContainerPainter(),
      size: size ?? const Size.square(80),
      child: child,
    );
  }
}

class _RhombusContainerPainter extends CustomPainter {
  const _RhombusContainerPainter();

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    paint.color = Colors.white;
    paint.strokeWidth = 1;
    paint.style = PaintingStyle.stroke;
    final path = Path();
    path.moveTo(size.width / 2, 0);
    path.lineTo(size.width, size.height / 2);
    path.lineTo(size.width / 2, size.height);
    path.lineTo(0, size.height / 2);
    path.close();
    canvas.drawPath(path, paint);
    final fillPath = Path();
    fillPath.moveTo(size.width / 2, 1);
    fillPath.lineTo(size.width - 1, size.height / 2);
    fillPath.lineTo(size.width / 2, size.height - 1);
    fillPath.lineTo(1, size.height / 2);
    paint.style = PaintingStyle.fill;
    paint.color = Colors.blue;
    canvas.drawPath(fillPath, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

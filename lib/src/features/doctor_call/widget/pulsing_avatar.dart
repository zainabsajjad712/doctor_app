import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PulsingAvatar extends StatefulWidget {
  const PulsingAvatar({super.key, required this.imageUrl});
  final String imageUrl;

  @override
  State<PulsingAvatar> createState() => _PulsingAvatarState();
}

class _PulsingAvatarState extends State<PulsingAvatar>
    with SingleTickerProviderStateMixin {
  late final AnimationController _c;

  @override
  void initState() {
    super.initState();
    _c = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1400),
    )..repeat();
  }

  @override
  void dispose() {
    _c.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = 140.w;

    return AnimatedBuilder(
      animation: _c,
      builder: (_, __) {
        // 0..1
        final t = _c.value;

        // rings: scale + opacity (beautiful soft pulse)
        double ringScale(double base) => base + (t * 0.55);
        double ringOpacity(double base) => (1 - t) * base;

        return SizedBox(
          width: 220.w,
          height: 220.w,
          child: Stack(
            alignment: Alignment.center,
            children: [
              // Ring 3 (outer)
              Transform.scale(
                scale: ringScale(1.25),
                child: _Ring(opacity: ringOpacity(0.10)),
              ),
              // Ring 2
              Transform.scale(
                scale: ringScale(1.05),
                child: _Ring(opacity: ringOpacity(0.16)),
              ),
              // Ring 1 (inner)
              Transform.scale(
                scale: ringScale(0.88),
                child: _Ring(opacity: ringOpacity(0.22)),
              ),

              // Avatar base circle
              Container(
                width: size,
                height: size,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.14),
                  shape: BoxShape.circle,
                ),
              ),

              // Avatar image (close-up like your 2nd image)
              Container(
                width: (size - 24.w),
                height: (size - 24.w),
                decoration: const BoxDecoration(shape: BoxShape.circle),
                child: ClipOval(
                  child: CachedNetworkImage(
                    imageUrl: widget.imageUrl,
                    fit: BoxFit.cover,
                    placeholder: (_, __) => Container(
                      color: Colors.white.withOpacity(0.12),
                      child: const Center(
                        child: CircularProgressIndicator(strokeWidth: 2),
                      ),
                    ),
                    errorWidget: (_, __, ___) => Container(
                      color: Colors.white.withOpacity(0.12),
                      child: const Icon(Icons.person, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _Ring extends StatelessWidget {
  const _Ring({required this.opacity});
  final double opacity;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170.w,
      height: 170.w,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white.withAlpha((opacity * 255).toInt()),
      ),
    );
  }
}

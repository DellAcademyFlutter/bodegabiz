import 'package:bodegabiz/app/controllers/user_settings_controller.dart';
import 'package:bodegabiz/app/shared/utils/math_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

/// Esta classe retorna um widget referente a configuracao do tamanho da fonte.
class TextSizeWidget extends StatelessWidget {
  final settings = Modular.get<UserSettingsController>();

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.topLeft,
              child: Text(
                'Tamanho da fonte',
              ),
            ),
            Container(child: TextSizeSlider()),
          ],
        ),
      ),
    );
  }
}

/// Esta classe retorna um widget com slider referente ao tamanho da fonte.
class TextSizeSlider extends StatelessWidget {
  final settings = Modular.get<UserSettingsController>();

  @override
  Widget build(BuildContext context) {
    return Consumer<UserSettingsController>(
      builder: (context, value) {
        return Container(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SliderTheme(
              data: SliderTheme.of(context).copyWith(
                activeTrackColor: Theme.of(context).cardColor.withOpacity(0),
                inactiveTrackColor: Theme.of(context).cardColor.withOpacity(0),
                trackHeight: 14,
                trackShape: RoundedRectSliderTrackShape(),
                tickMarkShape: RoundSliderTickMarkShape(),
                activeTickMarkColor:
                    Theme.of(context).floatingActionButtonTheme.backgroundColor,
                inactiveTickMarkColor:
                    Theme.of(context).floatingActionButtonTheme.backgroundColor,
              ),
              child: Slider(
                value: settings.fontSize,
                min: 14,
                max: 25,
                divisions: 6,
                label:
                    "${MathUtils.round(number: settings.fontSize, decimalPlaces: 0)}",
                onChanged: (newSliderValue) {
                  settings.fontSize = newSliderValue;
                },
              ),
            ),
            RaisedButton(
              child: Text('Tamanho padrão'),
              onPressed: settings.fontSize == settings.defaultFontSize
                  ? null
                  : () {
                      settings.fontSize = settings.defaultFontSize;
                    },
            )
          ],
        ));
      },
    );
  }
}

import "dart:html" as dom;

import 'package:logging/logging.dart';
import 'package:console_log_handler/console_log_handler.dart';

import 'package:wsk_material/wskcomponets.dart';
import 'package:wsk_material/wskdemo.dart';

main() {
    configLogging();

    registerAllWskComponents();

    upgradeAllRegistered().then((_) {
        MaterialRadio.widget(dom.querySelector("#wifi2comp")).disable();
    });
}

void configLogging() {
    hierarchicalLoggingEnabled = false; // set this to true - its part of Logging SDK

    // now control the logging.
    // Turn off all logging first
    Logger.root.level = Level.INFO;
    Logger.root.onRecord.listen(new LogConsoleHandler());
}
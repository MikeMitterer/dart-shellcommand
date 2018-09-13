// @TestOn("browser")
// unit
@TestOn("vm")
library test.unit.shellcommand;

import 'package:test/test.dart';
import 'package:console_log_handler/print_log_handler.dart';

import 'package:shellcommand/shellcommand.dart';

class LS extends ShellCommand {
    LS() : super("ls");
}

class Git extends ShellCommand {
    Git() : super("git");
}

class FakeCommand extends ShellCommand {
    FakeCommand() : super("fakecommand");
}


final FakeCommand fake = new FakeCommand();
final ls = LS();
final git = Git();

main() async {
    final Logger _logger = new Logger("test.unit.shellcommand");
    configLogging();

    group('Commands', () {
        setUp(() {});

        test('> Installed command', () async {
            expect(await ls.exists, isTrue);
            expect(await git.exists, isTrue);
        }); // end of 'Installed command' test

        test('> Missing command', () async {
            expect(await fake.exists, isFalse);
        });
    });

}

// - Helper --------------------------------------------------------------------------------------

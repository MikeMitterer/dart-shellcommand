library shellcommand.app;

import 'dart:io';
import 'dart:async';

import 'package:where/where.dart';
import 'package:shellcommand/shellcommand.dart';

class LS extends ShellCommand {
    LS() : super("ls");
}

class Git extends ShellCommand {
    Git() : super("git");
}

class Pwd extends ShellCommand {
    Pwd() : super("pwd");
}

class MsgInit extends ShellCommand {
    MsgInit() : super("msginit");
}

class XGetText extends ShellCommand {
    XGetText() : super("xgettext");
}

class FakeCommand extends ShellCommand {
    FakeCommand() : super("fakecommand");
}


final MsgInit msginit = new MsgInit();
final XGetText xgettext = new XGetText();
final FakeCommand fake = new FakeCommand();
final ls = LS();
final git = Git();
final pwd = Pwd();


void main(List<String> arguments) async {
    final commands = <String,ShellCommand>{
        "msginit" : msginit,
        "xgettext" : xgettext,
        "ls" : ls,
        "git" : git,
        "fakecommand" : fake
    };

    print("Testing commands:");

    if(!(await fake.exists)) {
        print("Does not exists!");
        return;
    }
    
    await Future.forEach(commands.values, (final ShellCommand command) async {
        String exe = "not installed";

        try {
            exe = await command.executable;

        } on StateError catch(_) {}
        on FinderException catch(_) {}

        print("    Command: ${(command.name + ':').padRight(15)} ${exe}");

    });
    print("");

    if(arguments.isNotEmpty && commands.containsKey(arguments.first)) {
        ProcessResult result;
        try {
            if (arguments.length > 1) {
                result = await commands[arguments.first].run(
                    arguments.getRange(1, arguments.length).toList());
            }
            else {
                result = await commands[arguments.first].run([]);
            }
            if(result.exitCode != 0) {
                print("ExitCode: ${exitCode}!");
                print(result.stderr);
            } else {
                print(result.stdout);
            }
        } on FinderException catch(_) {
            print("Execution of ${arguments.first} failed because it is not installed or does not exist!");
        }

    } else {
        print("Usage:");
        print("    dart bin/runCommands.dart <command> [params]");
    }
}


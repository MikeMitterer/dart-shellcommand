# shellcommand
> Helper for executing commands on the commandline

## Usage

```dart
class Git extends ShellCommand {
    Git() : super("git");
}

void main(List<String> arguments) async {
    final git = Git();
    
    if(!(await git.exists)) {
        print("git is not installed - please install it via 'apt install git'!");
        return;
    }

    final result = await git.run([ "--help" ]);
    if(result.exitCode != 0) {
        print("ExitCode: ${exitCode}!");
        print(result.stderr);
    } else {
        print(result.stdout);
    }
}
``` 

Another example can be found on [GitHub](https://github.com/MikeMitterer/dart-shellcommand/blob/master/bin/runCommands.dart)


## If you have problems
* [Issues](https://github.com/MikeMitterer/dart-shellcommand/issues)

### License

    Copyright 2018 Michael Mitterer (office@mikemitterer.at), 
    IT-Consulting and Development Limited, Austrian Branch

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, 
    software distributed under the License is distributed on an 
    "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, 
    either express or implied. See the License for the specific language 
    governing permissions and limitations under the License.
    
    
[1]: https://raw.githubusercontent.com/MikeMitterer/dart-l10n-gettext/master/doc/_resources/screenshot.png
[2]: https://github.com/MikeMitterer/dart-l10n-gettext/issues


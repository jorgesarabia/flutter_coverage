# flutter_coverage
Inspired by the great work of [Annyce Davis](https://github.com/adavis).
It was created to automate tasks when testing [Flutter](https://flutter.dev/) applications.

## Why was it created?
The problem was that I got an error when I ran the command `genhtml -o coverage coverage/lcov.info`.
Apparently it is a fairly common error and has to do with the way the command manages the `path`.
It threw the following error.

```
Processing file <file>.dart
genhtml: ERROR: cannot read <file>.dart
```

I was unsuccessfully testing several ways to generate the report.
So, in order to avoid wasting time I decided to create this script.
If there is a better way to solve this error, any suggestions are welcome.

## Script tasks
This project is based on this [script](https://gist.github.com/adavis/c003d435d9633253483bc64d6ffade8b). 
A detailed explanation about how it works appears in this [article](http://adavis.info/2019/03/bash-scripting-for-flutter-tests-and-code-coverage-reports.html).

I added the following: 
- The `ch_dir` function, which replaces the path in the lcov.info file.
- The `open_cov` function, which just opens the browser. I separated this task in another function to be easier to adjust to the needs of those who download this project. So, if you don’t have google-chrome just change the line `google-chrome coverage/index-sort-l.html` in the `open_cov` function.
- The `-o` or `--open` flag, to open the browser automatically, and to prevent to open the browser everytime you run the tests.
- The `-f` or `--filename` flag, to run the test of a particular file or directory with tests.


# To test the script (Tested in a Debian 8 environment)

- Clone this project

`git clone https://github.com/jorgesarabia/flutter_coverage.git`


## Instructions to run the script:

- Just run:

```
cd path_to_flutter_project
bash path_to_this_project/test_with_coverage.sh <flags>
```

## I recommend to create an alias (instruction tested in a Debian environment).

- Open the file bash_aliases:

```
vim ~/.bash_aliases
```

- Add the alias:

```
alias <your_alias>='bash ~/path_to_this_project/tests_with_coverage.sh'
```

## Run the script and open the report in the browser(`-o` flag):

```
cd path_to_flutter_project
<your_alias> -o
```

- After that, you can run only `<your alias>` and refresh the report page in the browser.

## Run a particular test file(`-f` flag):

Suppose you have this structure

```
- test
    |_ User
        |_ one_test.dart
        |_ two_test.dart
    |_ Other
        |_ three_test.dart
        |_ four_test.dart

```

- You can run a particular file

```
cd path_to_flutter_project
<your_alias> -f test/User/one_test.dart
```

- Or you can run all the test in a particular directory:

This command 

```
<your_alias> -f test/User -o
```

Will run all the tests in the files `one_test.dart` and `two_test.dart`. Also, it will open the report in the browser.

# flutter_coverage
Inspired by the great work of [Annyce Davis](https://github.com/adavis).
It was created to automate tasks when testing [Flutter](https://flutter.dev/) applications.

## Why was it created?
The problem was that I had an error with the command `genhtml -o coverage coverage/lcov.info`.
Apparently it is a fairly common error and has to do with the way the command takes the `path`.
It throws the following error.

```
Processing file <file>.dart
genhtml: ERROR: cannot read <file>.dart
```

I was testing several ways to generate the report but without success.
So, in order not to keep wasting time, I decided to make this script.
If there is a better way to solve this problem, the suggestion is welcome.

## Script tasks
This work is based on this [script](https://gist.github.com/adavis/c003d435d9633253483bc64d6ffade8b). 
A detailed explanation of how it works is found in this [article](http://adavis.info/2019/03/bash-scripting-for-flutter-tests-and-code-coverage-reports.html).

The new here is the following: 
- The `ch_dir` function, what it does is replace the path in the lcov.info file
- The `open_cov`function, what it does is open the file in the browser.
It was put into a new function to be easier to adjust to the needs of those who download this script.

# To test the script

Tested in a Debian 8 environment

- Clone this project

`git clone https://github.com/jorgesarabia/flutter_coverage.git`

## You can copy the file into your Flutter environment, or create an alias.

### To copy

`cp path_to_repo/test_with_coverage.sh path_to_project/` 

- Test the script:

```
cd path_to_flutter_project
bash test_with_coverage.sh
```

### Create an alias (Debian)
- To define an alias, open bash_aliases:

```
vim ~/.bash_aliases
```
- Add the alias:

```
alias <your_alias>='bash ~/path_to_this/tests_with_coverage.sh'
```

- Test the script:

```
cd path_to_flutter_project
<your_alias>
```

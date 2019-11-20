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
- The `open_cov`function, which just opens the browser. I separated this task in another function to be easier to adjust to the needs of those who download this project. So, if you don’t have google-chrome just change the line 67 in the `open_cov`.


# To test the script (Tested in a Debian 8 environment)

- Clone this project

`git clone https://github.com/jorgesarabia/flutter_coverage.git`

## You can copy the file into your Flutter environment, or create an alias.


### Instructions to copy and run:

- To copy, run:

`cp path_to_repo/test_with_coverage.sh path_to_project/` 

- Run the script:

```
cd path_to_flutter_project
bash test_with_coverage.sh
```

### Instructions to create an alias (Debian).
- Open the file bash_aliases:


```
vim ~/.bash_aliases
```
- Add the alias:

```
alias <your_alias>='bash ~/path_to_this_project/tests_with_coverage.sh'
```

- Run the script:

```
cd path_to_flutter_project
<your_alias>
```

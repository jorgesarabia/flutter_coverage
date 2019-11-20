#!/usr/bin/env bash

red=$(tput setaf 1)
none=$(tput sgr0)

show_help() {
    printf "usage: $0 [--help] [--report] [--test] [<path to package>]

Script for running all unit and widget tests with code coverage.
(run from root of repo)

where:
    <path to package>
        runs all tests with coverage and reports
    -t, --test
        runs all tests with coverage, but no report
    -r, --report
        generate a coverage report
        (requires lcov, install with Homebrew)
    -o, --open
        run this line (google-chrome coverage/index-sort-l.html)
        you can change this in the line 67.
    -h, --help
        print this message
"
}

run_tests() {
    if [[ -f "pubspec.yaml" ]]; then
        rm -f coverage/lcov.info
        rm -f coverage/lcov-final.info
        flutter test --coverage
        ch_dir
    else
        printf "\n${red}Error: this is not a Flutter project${none}\n"
        exit 1
    fi
}

run_report() {
    if [[ -f "coverage/lcov.info" ]]; then
        lcov -r coverage/lcov.info lib/resources/l10n/\* lib/\*/fake_\*.dart \
             -o coverage/lcov-final.info
        genhtml -o coverage coverage/lcov-final.info
    else
        printf "\n${red}Error: no coverage info was generated${none}\n"
        exit 1
    fi
}

ch_dir(){
    dir=$(pwd)
    input="$dir/coverage/lcov.info"
    output="$dir/coverage/lcov_new.info"
    echo "$input"
    while read line
    do
        secondString="SF:$dir/"
        echo "${line/SF:/$secondString}" >> $output
    done < "$input"

    mv $output $input
}

open_cov(){
    # This depends on your system, I use Debian, with Google Chrome (as you can see)
    google-chrome coverage/index-sort-l.html
}

case $1 in
    -h|--help)
        show_help
        ;;
    -t|--test)
        run_tests
        ;;    
    -r|--report)
        run_report
        ;;
    -o|--open)
        run_tests
        run_report
        open_cov
        ;;
    *)
        run_tests
        run_report
        ;;
esac
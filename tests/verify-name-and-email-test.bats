#!/usr/bin/env bats

LOG="./tests.log"

teardown() {
    if [[ "$(git config user.name)" != "Lauren Stephenson" ]]; then
        $(git config user.name Lauren Stephenson)
    fi

    if [[ "$(git config user.email)" != "compscilauren@gmail.com" ]]; then
        $(git config user.email compscilauren@gmail.com)
    fi
}

@test "incorrect name throws error" {
    testName="First Last"
    $(git config user.name $testName)

    { # try
        runGitCommit="$(git commit -m 'Failed commit')"
    } || { # catch
        date >> "$LOG"
        echo "incorrect name throws error test: PASS" >> "$LOG"
        echo "" >> "$LOG"
        echo "--------------------------------------------" >> "$LOG"
        echo "" >> "$LOG"
    }
}

@test "incorrect email throws error" {
    testEmail="first.last@gmail.com"
    $(git config user.email $testEmail)

    { # try
        runGitCommit="$(git commit -m 'Failed commit')"
    } || { # catch
        date >> "$LOG"
        echo "incorrect email throws error test: PASS" >> "$LOG"
        echo "" >> "$LOG"
        echo "--------------------------------------------" >> "$LOG"
        echo "" >> "$LOG"
    }
}

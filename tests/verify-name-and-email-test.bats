#!/usr/bin/env bats

LOG="./tests.log"

teardown() {
    echo "$BATS_TEST_NAME" >> "$LOG"
    if [[ "$(git config user.name)" != "Lauren Stephenson" ]]; then
        $(git config user.name Lauren Stephenson)
    fi
}

@test "correct name" {
    testName="Lauren Stephenson"
 
    [[ "$(git config user.name)" == $testName ]]
}

@test "incorrect name" {
    testName="First Last"

    [[ "$(git config user.name)" != $testName ]]
}

@test "correct email" {
    testEmail="compscilauren@gmail.com"

    [[ "$(git config user.email)" == $testEmail ]]
}

@test "incorrect email" {
    testEmail="first.last@gmail.com"

    [[ "$(git config user.email)" != $testEmail ]]
}

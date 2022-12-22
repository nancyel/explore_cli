#!/bin/bash

red=$'\e[1;31m'
grn=$'\e[1;32m'
yel=$'\e[1;33m'
blu=$'\e[1;34m'
mag=$'\e[1;35m'
cyn=$'\e[1;36m'
end=$'\e[0m'

#set -e

if [ -z "$1" ]; then
    echo "Please provide a topic that you'd like to explore!"
    exit 1
fi


result=$(echo "$*" | tr " " "+")

echo "${blu}Which platform would you like to use?${end} "
echo ""

declare -A map=( [D]="https://www.google.com/search?q=" [P]="https://podcasts.google.com/search/" [Y]="https://www.youtube.com/results?search_query=" [M]="https://medium.com/search?q=" [G]="https://github.com/search?q=" )

function selectPlatform() {
    PS3="${blu}Your choice:${end} ${yel}(Choose number) "

    select pf in google podcasts youtube medium github All Quit
    do
        case $pf in
            "google")
                open "${map[D]}$1"
                break;;
            "podcasts")
                open "${map[P]}$1"
                break;;
            "youtube")
                open "${map[Y]}$1"
                break;;
            "medium")
                open "${map[M]}$1"
                break;;
            "github")
                open "${map[G]}$1"
                break;;
            "All")
                for key in "${!map[@]}"; do
                    value=${map[$key]}
                    open "$value$1"
                done
                break;;
            "Quit")
                echo "Bye!"
                exit 0;;
            *)
                echo "${red}Invalid option. Please try again."}
                ;;
        esac
    done
}
selectPlatform "$result"

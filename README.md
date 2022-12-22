# Explore

- Run a simple bash script to support your search.

- Add the following snippet to your ~/.zprofile file.

```
explore() {
  bash $HOME/<PROJECT_PARENT_DIR>/explore_cli/explore.sh $1
}
```

- Then run the script as follows:

```
❯ explore germany
Which platform would you like to use?

1) google
2) podcasts
3) youtube
4) medium
5) github
6) All
7) Quit
Your choice: (Choose number)

```

- Result: Depending on your input, it will open web pages containing your search keyword.



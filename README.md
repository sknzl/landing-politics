# Landing.politics challenge
Demo of app [landing-politics](https://landing-politics.herokuapp.com/)

## Getting started

After cloning/downloading the app run the following:

```bash
$ yarn install
$ rails db:create db:migrate db:seed
```
## Explanation

Criminal politicians are organized in 4 different political parties:
  - The Red Party
  - The Green Party
  - The Blue Party
  - The Brown Party

Each party consists of corrupt politicians, one party leader and several subordinates.
If the leader goes to prison another politician becomes temporarily the leader until the imprisoned leader is released.
If all politicians are in prison for a given year the oldest subordinate becomes temporarily the leader.

## How to use

With the slider a specific year can be selected. An overview shows the current leader of each party, subordinates and politicians, which are not in prison. For the leaders, politicians and subordinates the details can be shown and their
corresponding time as leader and prisoner is visualized. Parties that reach a critical number of people >= 20 are marked in the overview page.

## Remarks

Predefined seeds exist. However database entries can be created, edited and destroyed in the "Administration" menu.

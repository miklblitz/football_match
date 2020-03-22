# Документация по проекту

Инструкция по запуску:
1. git clone https://github.com/miklblitz/football_match
2. cd football_match
3. rails db:drop && rails db:create && rails db:migrate && rails db:seed
4. rails s

Актуальные роуты:
* Получить список футбольных команд: GET ```localhost:3000/teams```
* Получить список всех игроков: GET ```localhost:3000/gamers```
* Получить список всех показателей: GET ```localhost:3000/features```
* Получить список матчей: GET ```localhost:3000/matches```

По задаче:
* игрок выполнил такой-то показатель в матче:  ```localhost:3000/gamers/:id_игрока/done_feature/:id_способности/in_match/:id_матча```
* выполнил ли игрок конкретный показатель хотя бы 1 раз за предыдущие 5 матчей команды: ```localhost:3000/gamers/:id_игрока/feature_for_last_five```
* Top-5 игроков по конкретному показателю в конкретной команде: ```localhost:3000/features/:id_показателя/top_btw_gamers/:id_команды```
* Top-5 игроков по конкретному показателю по всем командам в целом: ```localhost:3000/features/:id_показателя/top_btw_teams```
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# добавить матчи
match_one = Match.create({name: '"Manchester United-Arsenal" Oxford (2 june 2020)'})
match_two = Match.create({name: '"Manchester United-Arsenal" Liverpool (1 september 2020)'})
match_three = Match.create({name: '"Manchester United-Arsenal" Newcastle (21 october 2020)'})
match_four = Match.create({name: '"Manchester United-Arsenal" London (30 november 2020)'})
match_five = Match.create({name: '"Arsenal-Manchester United" Bristol (25 december 2020)'})
match_six = Match.create({name: '"Manchester United-Arsenal" London (3 february 2021)'})
match_seven = Match.create({name: '"Arsenal-Manchester United" Bristol (4 mart 2021)'})
match_eight = Match.create({name: '"Manchester United-Arsenal" Liverpool (11 april 2021)'})

# добавить команды
team_one = Team.create({name: 'Arsenal'})
team_two = Team.create({name: 'Manchester United'})

# добавить игроков первой команды
gamer1_1 = Gamer.create({name: 'Gabriel Martinelli', age: 25, team_id: team_one.id})
gamer1_2 = Gamer.create({name: 'Alexandre Lacazette', age: 25, team_id: team_one.id})
gamer1_3 = Gamer.create({name: 'Shkodran Mustafi', age: 27, team_id: team_one.id})
gamer1_4 = Gamer.create({name: 'Dani Ceballos', age: 26, team_id: team_one.id})
gamer1_5 = Gamer.create({name: 'Kieran Tierney', age: 24, team_id: team_one.id})
gamer1_6 = Gamer.create({name: 'Bernd Leno', age: 24, team_id: team_one.id})

# добавить игроков второй команды
gamer2_1 = Gamer.create({name: 'Bruno Fernandes', age: 29, team_id: team_two.id})
gamer2_2 = Gamer.create({name: 'Harry Maguire', age: 26, team_id: team_two.id})
gamer2_3 = Gamer.create({name: 'Andreas Pereira', age: 24, team_id: team_two.id})
gamer2_4 = Gamer.create({name: 'David de Gea', age: 22, team_id: team_two.id})
gamer2_5 = Gamer.create({name: 'Juan Mata', age: 25, team_id: team_two.id})
gamer2_6 = Gamer.create({name: 'Sergio Romero', age: 23, team_id: team_two.id})

# добавить показатели
feature_one = Feature.create({name: 'Забил гол'})
feature_two = Feature.create({name: 'Точно передал пас'})

# добавить показатели для первой команды первой игры
Tag.create({feature: feature_one, gamer: gamer1_1, match: match_one})
Tag.create({feature: feature_two, gamer: gamer1_3, match: match_one})
Tag.create({feature: feature_two, gamer: gamer1_1, match: match_one})
Tag.create({feature: feature_one, gamer: gamer1_2, match: match_one})
Tag.create({feature: feature_two, gamer: gamer1_2, match: match_one})
Tag.create({feature: feature_two, gamer: gamer1_3, match: match_one})
Tag.create({feature: feature_two, gamer: gamer1_3, match: match_one})

# добавить показатели для второй команды первой игры
Tag.create({feature: feature_two, gamer: gamer2_1, match: match_one})
Tag.create({feature: feature_two, gamer: gamer2_3, match: match_one})
Tag.create({feature: feature_two, gamer: gamer2_1, match: match_one})
Tag.create({feature: feature_one, gamer: gamer2_2, match: match_one})
Tag.create({feature: feature_two, gamer: gamer2_2, match: match_one})


# добавить показатели для первой команды второй игры
Tag.create({feature: feature_two, gamer: gamer1_1, match: match_two})
Tag.create({feature: feature_two, gamer: gamer1_3, match: match_two})
Tag.create({feature: feature_two, gamer: gamer1_1, match: match_two})
Tag.create({feature: feature_one, gamer: gamer1_2, match: match_two})
Tag.create({feature: feature_two, gamer: gamer1_2, match: match_two})
Tag.create({feature: feature_two, gamer: gamer1_2, match: match_two})
Tag.create({feature: feature_two, gamer: gamer1_2, match: match_two})
Tag.create({feature: feature_two, gamer: gamer1_1, match: match_two})
Tag.create({feature: feature_two, gamer: gamer1_3, match: match_two})
Tag.create({feature: feature_one, gamer: gamer1_1, match: match_two})

# добавить показатели для второй команды второй игры
Tag.create({feature: feature_one, gamer: gamer2_1, match: match_two})
Tag.create({feature: feature_two, gamer: gamer2_3, match: match_two})
Tag.create({feature: feature_two, gamer: gamer2_1, match: match_two})
Tag.create({feature: feature_two, gamer: gamer2_2, match: match_two})
Tag.create({feature: feature_two, gamer: gamer2_2, match: match_two})
Tag.create({feature: feature_one, gamer: gamer2_3, match: match_two})
Tag.create({feature: feature_two, gamer: gamer2_2, match: match_two})
Tag.create({feature: feature_two, gamer: gamer2_3, match: match_two})
Tag.create({feature: feature_two, gamer: gamer2_1, match: match_two})


# добавить показатели для первой команды третьей игры
Tag.create({feature: feature_two, gamer: gamer1_1, match: match_three})
Tag.create({feature: feature_two, gamer: gamer1_1, match: match_three})
Tag.create({feature: feature_two, gamer: gamer1_4, match: match_three})

# добавить показатели для второй команды третьей игры
Tag.create({feature: feature_two, gamer: gamer2_3, match: match_three})
Tag.create({feature: feature_one, gamer: gamer2_2, match: match_three})
Tag.create({feature: feature_two, gamer: gamer2_4, match: match_three})


# добавить показатели для первой команды четвертой игры
Tag.create({feature: feature_one, gamer: gamer1_1, match: match_four})
Tag.create({feature: feature_two, gamer: gamer1_3, match: match_four})

# добавить показатели для второй команды четвертой игры
Tag.create({feature: feature_two, gamer: gamer2_1, match: match_four})
Tag.create({feature: feature_two, gamer: gamer2_3, match: match_four})
Tag.create({feature: feature_two, gamer: gamer2_4, match: match_four})
Tag.create({feature: feature_two, gamer: gamer2_5, match: match_four})


# добавить показатели для первой команды пятой игры
Tag.create({feature: feature_one, gamer: gamer1_2, match: match_five})
Tag.create({feature: feature_two, gamer: gamer1_2, match: match_five})
Tag.create({feature: feature_two, gamer: gamer1_6, match: match_five})

# добавить показатели для второй команды пятой игры
Tag.create({feature: feature_two, gamer: gamer2_3, match: match_five})
Tag.create({feature: feature_one, gamer: gamer2_1, match: match_five})
Tag.create({feature: feature_one, gamer: gamer2_6, match: match_five})


# добавить показатели для первой команды шестой игры
Tag.create({feature: feature_one, gamer: gamer1_2, match: match_six})
Tag.create({feature: feature_two, gamer: gamer1_2, match: match_six})

# добавить показатели для второй команды шестой игры
Tag.create({feature: feature_two, gamer: gamer2_3, match: match_six})
Tag.create({feature: feature_one, gamer: gamer2_1, match: match_six})
Tag.create({feature: feature_two, gamer: gamer2_4, match: match_six})
Tag.create({feature: feature_two, gamer: gamer2_5, match: match_six})


# добавить показатели для первой команды седьмой игры
Tag.create({feature: feature_one, gamer: gamer1_1, match: match_seven})
Tag.create({feature: feature_two, gamer: gamer1_3, match: match_seven})
Tag.create({feature: feature_two, gamer: gamer1_5, match: match_seven})

# добавить показатели для второй команды седьмой игры
Tag.create({feature: feature_two, gamer: gamer2_3, match: match_seven})
Tag.create({feature: feature_two, gamer: gamer2_3, match: match_seven})
Tag.create({feature: feature_one, gamer: gamer2_1, match: match_seven})


# добавить показатели для первой команды восьмой игры
Tag.create({feature: feature_one, gamer: gamer1_2, match: match_eight})
Tag.create({feature: feature_two, gamer: gamer1_3, match: match_eight})
Tag.create({feature: feature_two, gamer: gamer1_5, match: match_eight})

# добавить показатели для второй команды восьмой игры
Tag.create({feature: feature_two, gamer: gamer2_1, match: match_eight})
Tag.create({feature: feature_two, gamer: gamer2_3, match: match_eight})
Tag.create({feature: feature_two, gamer: gamer2_4, match: match_eight})
Tag.create({feature: feature_one, gamer: gamer2_1, match: match_eight})

match_one.teams << team_one
match_one.teams << team_two

match_two.teams << team_one
match_two.teams << team_two

match_three.teams << team_one
match_three.teams << team_two

match_four.teams << team_one
match_four.teams << team_two

match_five.teams << team_one
match_five.teams << team_two

match_six.teams << team_one
match_six.teams << team_two

match_seven.teams << team_one
match_seven.teams << team_two

match_eight.teams << team_one
match_eight.teams << team_two
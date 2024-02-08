const players = [
  {
    "player": {
      "id": 874,
      "name": "Cristiano Ronaldo",
      "firstname": "Cristiano Ronaldo",
      "lastname": "dos Santos Aveiro",
      "age": 39,
      "birth": {
        "date": "1985-02-05",
        "place": "Funchal",
        "country": "Portugal"
      },
      "nationality": "Portugal",
      "height": "187 cm",
      "weight": "83 kg",
      "injured": false,
      "photo": "https://media.api-sports.io/football/players/874.png"
    },
    "statistics": [
      {
        "team": {
          "id": 2939,
          "name": "Al-Nassr",
          "logo": "https://media.api-sports.io/football/teams/2939.png"
        },
        "league": {
          "id": 307,
          "name": "Pro League",
          "country": "Saudi-Arabia",
          "logo": "https://media.api-sports.io/football/leagues/307.png",
          "flag": "https://media.api-sports.io/flags/sa.svg",
          "season": 2023
        },
        "games": {
          "appearences": 18,
          "lineups": 18,
          "minutes": 1616,
          "number": null,
          "position": "Attacker",
          "rating": "8.011111",
          "captain": false
        },
        "substitutes": {"in": 0, "out": 2, "bench": 0},
        "shots": {"total": 91, "on": 49},
        "goals": {"total": 20, "conceded": 0, "assists": 9, "saves": null},
        "passes": {"total": 557, "key": 23, "accuracy": 27},
        "tackles": {"total": 6, "blocks": null, "interceptions": 1},
        "duels": {"total": 109, "won": 42},
        "dribbles": {"attempts": 29, "success": 11, "past": null},
        "fouls": {"drawn": 16, "committed": 11},
        "cards": {"yellow": 1, "yellowred": 0, "red": 0},
        "penalty": {
          "won": null,
          "commited": null,
          "scored": 6,
          "missed": 0,
          "saved": null
        }
      },
      {
        "team": {
          "id": 2939,
          "name": "Al-Nassr",
          "logo": "https://media.api-sports.io/football/teams/2939.png"
        },
        "league": {
          "id": null,
          "name": "King's Cup",
          "country": null,
          "logo": null,
          "flag": null,
          "season": "2023-2024"
        },
        "games": {
          "appearences": 2,
          "lineups": 2,
          "minutes": 202,
          "number": null,
          "position": "Attacker",
          "rating": null,
          "captain": false
        },
        "substitutes": {"in": 0, "out": 1, "bench": 0},
        "shots": {"total": null, "on": null},
        "goals": {"total": 1, "conceded": null, "assists": null, "saves": null},
        "passes": {"total": null, "key": null, "accuracy": null},
        "tackles": {"total": null, "blocks": null, "interceptions": null},
        "duels": {"total": null, "won": null},
        "dribbles": {"attempts": null, "success": null, "past": null},
        "fouls": {"drawn": null, "committed": null},
        "cards": {"yellow": 1, "yellowred": 0, "red": 0},
        "penalty": {
          "won": null,
          "commited": null,
          "scored": null,
          "missed": null,
          "saved": null
        }
      },
      {
        "team": {
          "id": 2939,
          "name": "Al-Nassr",
          "logo": "https://media.api-sports.io/football/teams/2939.png"
        },
        "league": {
          "id": 17,
          "name": "AFC Champions League",
          "country": "World",
          "logo": "https://media.api-sports.io/football/leagues/17.png",
          "flag": null,
          "season": 2023
        },
        "games": {
          "appearences": 5,
          "lineups": 5,
          "minutes": 438,
          "number": null,
          "position": "Attacker",
          "rating": null,
          "captain": false
        },
        "substitutes": {"in": 0, "out": 2, "bench": 0},
        "shots": {"total": null, "on": null},
        "goals": {"total": 3, "conceded": null, "assists": null, "saves": null},
        "passes": {"total": null, "key": null, "accuracy": null},
        "tackles": {"total": null, "blocks": null, "interceptions": null},
        "duels": {"total": null, "won": null},
        "dribbles": {"attempts": null, "success": null, "past": null},
        "fouls": {"drawn": null, "committed": null},
        "cards": {"yellow": 0, "yellowred": 0, "red": 0},
        "penalty": {
          "won": null,
          "commited": null,
          "scored": null,
          "missed": null,
          "saved": null
        }
      },
      {
        "team": {
          "id": 2939,
          "name": "Al-Nassr",
          "logo": "https://media.api-sports.io/football/teams/2939.png"
        },
        "league": {
          "id": 768,
          "name": "Arab Club Champions Cup",
          "country": "World",
          "logo": "https://media.api-sports.io/football/leagues/768.png",
          "flag": null,
          "season": 2023
        },
        "games": {
          "appearences": 6,
          "lineups": 5,
          "minutes": 503,
          "number": null,
          "position": "Attacker",
          "rating": "7.516666",
          "captain": false
        },
        "substitutes": {"in": 1, "out": 1, "bench": 1},
        "shots": {"total": 22, "on": 14},
        "goals": {"total": 6, "conceded": 0, "assists": null, "saves": null},
        "passes": {"total": 150, "key": 5, "accuracy": 20},
        "tackles": {"total": 2, "blocks": null, "interceptions": 3},
        "duels": {"total": 44, "won": 24},
        "dribbles": {"attempts": 10, "success": 7, "past": null},
        "fouls": {"drawn": 8, "committed": 4},
        "cards": {"yellow": 0, "yellowred": 0, "red": 0},
        "penalty": {
          "won": null,
          "commited": null,
          "scored": 1,
          "missed": 0,
          "saved": null
        }
      },
      {
        "team": {
          "id": 2939,
          "name": "Al-Nassr",
          "logo": "https://media.api-sports.io/football/teams/2939.png"
        },
        "league": {
          "id": 667,
          "name": "Friendlies Clubs",
          "country": "World",
          "logo": "https://media.api-sports.io/football/leagues/667.png",
          "flag": null,
          "season": 2023
        },
        "games": {
          "appearences": 2,
          "lineups": 2,
          "minutes": 112,
          "number": null,
          "position": "Attacker",
          "rating": null,
          "captain": false
        },
        "substitutes": {"in": 0, "out": 2, "bench": 0},
        "shots": {"total": null, "on": null},
        "goals": {"total": 0, "conceded": null, "assists": null, "saves": null},
        "passes": {"total": null, "key": null, "accuracy": null},
        "tackles": {"total": null, "blocks": null, "interceptions": null},
        "duels": {"total": null, "won": null},
        "dribbles": {"attempts": null, "success": null, "past": null},
        "fouls": {"drawn": null, "committed": null},
        "cards": {"yellow": 0, "yellowred": 0, "red": 0},
        "penalty": {
          "won": null,
          "commited": null,
          "scored": null,
          "missed": null,
          "saved": null
        }
      },
      {
        "team": {
          "id": 27,
          "name": "Portugal",
          "logo": "https://media.api-sports.io/football/teams/27.png"
        },
        "league": {
          "id": 960,
          "name": "Euro Championship - Qualification",
          "country": "World",
          "logo": "https://media.api-sports.io/football/leagues/960.png",
          "flag": null,
          "season": 2023
        },
        "games": {
          "appearences": 9,
          "lineups": 9,
          "minutes": 726,
          "number": null,
          "position": "Attacker",
          "rating": "7.600000",
          "captain": false
        },
        "substitutes": {"in": 0, "out": 4, "bench": 0},
        "shots": {"total": 35, "on": 19},
        "goals": {"total": 10, "conceded": 0, "assists": 2, "saves": null},
        "passes": {"total": 213, "key": 9, "accuracy": 18},
        "tackles": {"total": 2, "blocks": 1, "interceptions": 1},
        "duels": {"total": 42, "won": 19},
        "dribbles": {"attempts": 11, "success": 3, "past": null},
        "fouls": {"drawn": 6, "committed": 7},
        "cards": {"yellow": 3, "yellowred": 0, "red": 0},
        "penalty": {
          "won": null,
          "commited": null,
          "scored": 3,
          "missed": 0,
          "saved": null
        }
      }
    ]
  }
];

/* [
  {
    "id": 20319,
    "name": "N. Bishop",
    "age": 22,
    "number": 30,
    "position": "Goalkeeper",
    "photo": "https://media.api-sports.io/football/players/20319.png"
  },
  {
    "id": 882,
    "name": "David de Gea",
    "age": 31,
    "number": 1,
    "position": "Goalkeeper",
    "photo": "https://media.api-sports.io/football/players/882.png"
  },
  {
    "id": 883,
    "name": "L. Grant",
    "age": 38,
    "number": 13,
    "position": "Goalkeeper",
    "photo": "https://media.api-sports.io/football/players/883.png"
  },
  {
    "id": 2931,
    "name": "T. Heaton",
    "age": 35,
    "number": null,
    "position": "Goalkeeper",
    "photo": "https://media.api-sports.io/football/players/2931.png"
  },
]; */

final playerId = {
  "get": "players",
  "parameters": {"id": "18487", "season": "2023"},
  "errors": [],
  "results": 1,
  "paging": {"current": 1, "total": 1},
  "response": [
    {
      "player": {
        "id": 18487,
        "name": "S. Quigley",
        "firstname": "Scott David",
        "lastname": "Quigley",
        "age": 32,
        "birth": {
          "date": "1992-09-02",
          "place": "Shrewsbury",
          "country": "England"
        },
        "nationality": "England",
        "height": "194 cm",
        "weight": "88 kg",
        "injured": false,
        "photo": "https://media.api-sports.io/football/players/18487.png"
      },
      "statistics": [
        {
          "team": {
            "id": 4686,
            "name": "Stockport County",
            "logo": "https://media.api-sports.io/football/teams/4686.png"
          },
          "league": {
            "id": 42,
            "name": "League Two",
            "country": "England",
            "logo": "https://media.api-sports.io/football/leagues/42.png",
            "flag": "https://media.api-sports.io/flags/gb.svg",
            "season": 2023
          },
          "games": {
            "appearences": null,
            "lineups": null,
            "minutes": null,
            "number": null,
            "position": "Attacker",
            "rating": null,
            "captain": false
          },
          "substitutes": {"in": null, "out": null, "bench": null},
          "shots": {"total": null, "on": null},
          "goals": {
            "total": null,
            "conceded": null,
            "assists": null,
            "saves": null
          },
          "passes": {"total": null, "key": null, "accuracy": null},
          "tackles": {"total": null, "blocks": null, "interceptions": null},
          "duels": {"total": null, "won": null},
          "dribbles": {"attempts": null, "success": null, "past": null},
          "fouls": {"drawn": null, "committed": null},
          "cards": {"yellow": null, "yellowred": null, "red": null},
          "penalty": {
            "won": null,
            "commited": null,
            "scored": null,
            "missed": null,
            "saved": null
          }
        },
        {
          "team": {
            "id": 1822,
            "name": "Eastleigh",
            "logo": "https://media.api-sports.io/football/teams/1822.png"
          },
          "league": {
            "id": 43,
            "name": "National League",
            "country": "England",
            "logo": "https://media.api-sports.io/football/leagues/43.png",
            "flag": "https://media.api-sports.io/flags/gb.svg",
            "season": 2023
          },
          "games": {
            "appearences": 23,
            "lineups": 21,
            "minutes": 1895,
            "number": null,
            "position": "Attacker",
            "rating": null,
            "captain": false
          },
          "substitutes": {"in": 2, "out": 1, "bench": 2},
          "shots": {"total": null, "on": null},
          "goals": {
            "total": 9,
            "conceded": null,
            "assists": null,
            "saves": null
          },
          "passes": {"total": null, "key": null, "accuracy": null},
          "tackles": {"total": null, "blocks": null, "interceptions": null},
          "duels": {"total": null, "won": null},
          "dribbles": {"attempts": null, "success": null, "past": null},
          "fouls": {"drawn": null, "committed": null},
          "cards": {"yellow": 10, "yellowred": 0, "red": 0},
          "penalty": {
            "won": null,
            "commited": null,
            "scored": null,
            "missed": null,
            "saved": null
          }
        },
        {
          "team": {
            "id": 1822,
            "name": "Eastleigh",
            "logo": "https://media.api-sports.io/football/teams/1822.png"
          },
          "league": {
            "id": 47,
            "name": "FA Trophy",
            "country": "England",
            "logo": "https://media.api-sports.io/football/leagues/47.png",
            "flag": "https://media.api-sports.io/flags/gb.svg",
            "season": 2023
          },
          "games": {
            "appearences": 1,
            "lineups": 1,
            "minutes": 90,
            "number": null,
            "position": "Attacker",
            "rating": null,
            "captain": false
          },
          "substitutes": {"in": 0, "out": 0, "bench": 0},
          "shots": {"total": null, "on": null},
          "goals": {
            "total": 0,
            "conceded": null,
            "assists": null,
            "saves": null
          },
          "passes": {"total": null, "key": null, "accuracy": null},
          "tackles": {"total": null, "blocks": null, "interceptions": null},
          "duels": {"total": null, "won": null},
          "dribbles": {"attempts": null, "success": null, "past": null},
          "fouls": {"drawn": null, "committed": null},
          "cards": {"yellow": 0, "yellowred": 0, "red": 0},
          "penalty": {
            "won": null,
            "commited": null,
            "scored": null,
            "missed": null,
            "saved": null
          }
        },
        {
          "team": {
            "id": 1822,
            "name": "Eastleigh",
            "logo": "https://media.api-sports.io/football/teams/1822.png"
          },
          "league": {
            "id": 45,
            "name": "FA Cup",
            "country": "England",
            "logo": "https://media.api-sports.io/football/leagues/45.png",
            "flag": "https://media.api-sports.io/flags/gb.svg",
            "season": 2023
          },
          "games": {
            "appearences": 5,
            "lineups": 5,
            "minutes": 450,
            "number": null,
            "position": "Attacker",
            "rating": "6.200000",
            "captain": false
          },
          "substitutes": {"in": 0, "out": 0, "bench": 0},
          "shots": {"total": 1, "on": 1},
          "goals": {"total": 0, "conceded": 0, "assists": 1, "saves": null},
          "passes": {"total": 6, "key": 1, "accuracy": 3},
          "tackles": {"total": null, "blocks": null, "interceptions": null},
          "duels": {"total": 6, "won": null},
          "dribbles": {"attempts": 1, "success": null, "past": null},
          "fouls": {"drawn": null, "committed": 2},
          "cards": {"yellow": 1, "yellowred": 0, "red": 0},
          "penalty": {
            "won": null,
            "commited": null,
            "scored": 0,
            "missed": 0,
            "saved": null
          }
        }
      ]
    }
  ]
};

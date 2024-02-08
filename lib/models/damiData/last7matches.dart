const lastMatches = {
  "get": "fixtures",
  "parameters": {"team": "18487", "last": "7"},
  "errors": [],
  "results": 2,
  "paging": {"current": 1, "total": 1},
  "response": [
    {
      "fixture": {
        "id": 846356,
        "referee": null,
        "timezone": "UTC",
        "date": "2022-03-27T16:15:00+00:00",
        "timestamp": 1648397700,
        "periods": {"first": 1648397700, "second": 1648401300},
        "venue": {"id": 12286, "name": "Väre Areena", "city": "Kuopio"},
        "status": {"long": "Match Finished", "short": "FT", "elapsed": 90}
      },
      "league": {
        "id": 246,
        "name": "Suomen Cup",
        "country": "Finland",
        "logo": "https://media.api-sports.io/football/leagues/246.png",
        "flag": "https://media.api-sports.io/flags/fi.svg",
        "season": 2022,
        "round": "2nd Round"
      },
      "teams": {
        "home": {
          "id": 18487,
          "name": "Barca",
          "logo": "https://media.api-sports.io/football/teams/18487.png",
          "winner": false
        },
        "away": {
          "id": 13474,
          "name": "Kuopion Elo",
          "logo": "https://media.api-sports.io/football/teams/13474.png",
          "winner": true
        }
      },
      "goals": {"home": 0, "away": 4},
      "score": {
        "halftime": {"home": null, "away": null},
        "fulltime": {"home": 0, "away": 4},
        "extratime": {"home": null, "away": null},
        "penalty": {"home": null, "away": null}
      }
    },
    {
      "fixture": {
        "id": 841695,
        "referee": null,
        "timezone": "UTC",
        "date": "2022-02-27T18:00:00+00:00",
        "timestamp": 1645984800,
        "periods": {"first": 1645984800, "second": 1645988400},
        "venue": {"id": null, "name": "Lippumäen kuplahalli", "city": "Kuopio"},
        "status": {"long": "Match Finished", "short": "FT", "elapsed": 90}
      },
      "league": {
        "id": 246,
        "name": "Suomen Cup",
        "country": "Finland",
        "logo": "https://media.api-sports.io/football/leagues/246.png",
        "flag": "https://media.api-sports.io/flags/fi.svg",
        "season": 2022,
        "round": "1st Round"
      },
      "teams": {
        "home": {
          "id": 13529,
          "name": "SiPS",
          "logo": "https://media.api-sports.io/football/teams/13529.png",
          "winner": false
        },
        "away": {
          "id": 18487,
          "name": "Barca",
          "logo": "https://media.api-sports.io/football/teams/18487.png",
          "winner": true
        }
      },
      "goals": {"home": 0, "away": 8},
      "score": {
        "halftime": {"home": null, "away": null},
        "fulltime": {"home": 0, "away": 8},
        "extratime": {"home": null, "away": null},
        "penalty": {"home": null, "away": null}
      }
    }
  ]
};



/* {
  "get": "fixtures",
  "parameters": {"team": "33", "last": "7"},
  "errors": [],
  "results": 7,
  "paging": {"current": 1, "total": 1},
  "response": [
    {
      "fixture": {
        "id": 1035401,
        "referee": "Andy Madley, England",
        "timezone": "UTC",
        "date": "2024-02-04T14:00:00+00:00",
        "timestamp": 1707055200,
        "periods": {"first": 1707055200, "second": 1707058800},
        "venue": {"id": 556, "name": "Old Trafford", "city": "Manchester"},
        "status": {"long": "Match Finished", "short": "FT", "elapsed": 90}
      },
      "league": {
        "id": 39,
        "name": "Premier League",
        "country": "England",
        "logo": "https://media.api-sports.io/football/leagues/39.png",
        "flag": "https://media.api-sports.io/flags/gb.svg",
        "season": 2023,
        "round": "Regular Season - 23"
      },
      "teams": {
        "home": {
          "id": 33,
          "name": "Manchester United",
          "logo": "https://media.api-sports.io/football/teams/33.png",
          "winner": true
        },
        "away": {
          "id": 48,
          "name": "West Ham",
          "logo": "https://media.api-sports.io/football/teams/48.png",
          "winner": false
        }
      },
      "goals": {"home": 3, "away": 0},
      "score": {
        "halftime": {"home": 1, "away": 0},
        "fulltime": {"home": 3, "away": 0},
        "extratime": {"home": null, "away": null},
        "penalty": {"home": null, "away": null}
      }
    },
    {
      "fixture": {
        "id": 1035390,
        "referee": "Jarred Gillett, Australia",
        "timezone": "UTC",
        "date": "2024-02-01T20:15:00+00:00",
        "timestamp": 1706818500,
        "periods": {"first": 1706818500, "second": 1706822100},
        "venue": {
          "id": 600,
          "name": "Molineux Stadium",
          "city": "Wolverhampton, West Midlands"
        },
        "status": {"long": "Match Finished", "short": "FT", "elapsed": 90}
      },
      "league": {
        "id": 39,
        "name": "Premier League",
        "country": "England",
        "logo": "https://media.api-sports.io/football/leagues/39.png",
        "flag": "https://media.api-sports.io/flags/gb.svg",
        "season": 2023,
        "round": "Regular Season - 22"
      },
      "teams": {
        "home": {
          "id": 39,
          "name": "Wolves",
          "logo": "https://media.api-sports.io/football/teams/39.png",
          "winner": false
        },
        "away": {
          "id": 33,
          "name": "Manchester United",
          "logo": "https://media.api-sports.io/football/teams/33.png",
          "winner": true
        }
      },
      "goals": {"home": 3, "away": 4},
      "score": {
        "halftime": {"home": 0, "away": 2},
        "fulltime": {"home": 3, "away": 4},
        "extratime": {"home": null, "away": null},
        "penalty": {"home": null, "away": null}
      }
    },
    {
      "fixture": {
        "id": 1160764,
        "referee": "D. Coote",
        "timezone": "UTC",
        "date": "2024-01-28T16:30:00+00:00",
        "timestamp": 1706459400,
        "periods": {"first": 1706459400, "second": 1706463000},
        "venue": {"id": null, "name": "Rodney Parade", "city": "Casnewydd"},
        "status": {"long": "Match Finished", "short": "FT", "elapsed": 90}
      },
      "league": {
        "id": 45,
        "name": "FA Cup",
        "country": "England",
        "logo": "https://media.api-sports.io/football/leagues/45.png",
        "flag": "https://media.api-sports.io/flags/gb.svg",
        "season": 2023,
        "round": "4th Round"
      },
      "teams": {
        "home": {
          "id": 1367,
          "name": "Newport County",
          "logo": "https://media.api-sports.io/football/teams/1367.png",
          "winner": false
        },
        "away": {
          "id": 33,
          "name": "Manchester United",
          "logo": "https://media.api-sports.io/football/teams/33.png",
          "winner": true
        }
      },
      "goals": {"home": 2, "away": 4},
      "score": {
        "halftime": {"home": 1, "away": 2},
        "fulltime": {"home": 2, "away": 4},
        "extratime": {"home": null, "away": null},
        "penalty": {"home": null, "away": null}
      }
    },
    {
      "fixture": {
        "id": 1035381,
        "referee": "John Brooks, England",
        "timezone": "UTC",
        "date": "2024-01-14T16:30:00+00:00",
        "timestamp": 1705249800,
        "periods": {"first": 1705249800, "second": 1705253400},
        "venue": {"id": 556, "name": "Old Trafford", "city": "Manchester"},
        "status": {"long": "Match Finished", "short": "FT", "elapsed": 90}
      },
      "league": {
        "id": 39,
        "name": "Premier League",
        "country": "England",
        "logo": "https://media.api-sports.io/football/leagues/39.png",
        "flag": "https://media.api-sports.io/flags/gb.svg",
        "season": 2023,
        "round": "Regular Season - 21"
      },
      "teams": {
        "home": {
          "id": 33,
          "name": "Manchester United",
          "logo": "https://media.api-sports.io/football/teams/33.png",
          "winner": null
        },
        "away": {
          "id": 47,
          "name": "Tottenham",
          "logo": "https://media.api-sports.io/football/teams/47.png",
          "winner": null
        }
      },
      "goals": {"home": 2, "away": 2},
      "score": {
        "halftime": {"home": 2, "away": 1},
        "fulltime": {"home": 2, "away": 2},
        "extratime": {"home": null, "away": null},
        "penalty": {"home": null, "away": null}
      }
    },
    {
      "fixture": {
        "id": 1145562,
        "referee": "A. Taylor",
        "timezone": "UTC",
        "date": "2024-01-08T20:15:00+00:00",
        "timestamp": 1704744900,
        "periods": {"first": 1704744900, "second": 1704748500},
        "venue": {"id": 599, "name": "DW Stadium", "city": "Wigan"},
        "status": {"long": "Match Finished", "short": "FT", "elapsed": 90}
      },
      "league": {
        "id": 45,
        "name": "FA Cup",
        "country": "England",
        "logo": "https://media.api-sports.io/football/leagues/45.png",
        "flag": "https://media.api-sports.io/flags/gb.svg",
        "season": 2023,
        "round": "3rd Round"
      },
      "teams": {
        "home": {
          "id": 61,
          "name": "Wigan",
          "logo": "https://media.api-sports.io/football/teams/61.png",
          "winner": false
        },
        "away": {
          "id": 33,
          "name": "Manchester United",
          "logo": "https://media.api-sports.io/football/teams/33.png",
          "winner": true
        }
      },
      "goals": {"home": 0, "away": 2},
      "score": {
        "halftime": {"home": 0, "away": 1},
        "fulltime": {"home": 0, "away": 2},
        "extratime": {"home": null, "away": null},
        "penalty": {"home": null, "away": null}
      }
    },
    {
      "fixture": {
        "id": 1035370,
        "referee": "Tim Robinson, England",
        "timezone": "UTC",
        "date": "2023-12-30T17:30:00+00:00",
        "timestamp": 1703957400,
        "periods": {"first": 1703957400, "second": 1703961000},
        "venue": {
          "id": 566,
          "name": "The City Ground",
          "city": "Nottingham, Nottinghamshire"
        },
        "status": {"long": "Match Finished", "short": "FT", "elapsed": 90}
      },
      "league": {
        "id": 39,
        "name": "Premier League",
        "country": "England",
        "logo": "https://media.api-sports.io/football/leagues/39.png",
        "flag": "https://media.api-sports.io/flags/gb.svg",
        "season": 2023,
        "round": "Regular Season - 20"
      },
      "teams": {
        "home": {
          "id": 65,
          "name": "Nottingham Forest",
          "logo": "https://media.api-sports.io/football/teams/65.png",
          "winner": true
        },
        "away": {
          "id": 33,
          "name": "Manchester United",
          "logo": "https://media.api-sports.io/football/teams/33.png",
          "winner": false
        }
      },
      "goals": {"home": 2, "away": 1},
      "score": {
        "halftime": {"home": 0, "away": 0},
        "fulltime": {"home": 2, "away": 1},
        "extratime": {"home": null, "away": null},
        "penalty": {"home": null, "away": null}
      }
    },
    {
      "fixture": {
        "id": 1035361,
        "referee": "Craig Pawson, England",
        "timezone": "UTC",
        "date": "2023-12-26T20:00:00+00:00",
        "timestamp": 1703620800,
        "periods": {"first": 1703620800, "second": 1703624400},
        "venue": {"id": 556, "name": "Old Trafford", "city": "Manchester"},
        "status": {"long": "Match Finished", "short": "FT", "elapsed": 90}
      },
      "league": {
        "id": 39,
        "name": "Premier League",
        "country": "England",
        "logo": "https://media.api-sports.io/football/leagues/39.png",
        "flag": "https://media.api-sports.io/flags/gb.svg",
        "season": 2023,
        "round": "Regular Season - 19"
      },
      "teams": {
        "home": {
          "id": 33,
          "name": "Manchester United",
          "logo": "https://media.api-sports.io/football/teams/33.png",
          "winner": true
        },
        "away": {
          "id": 66,
          "name": "Aston Villa",
          "logo": "https://media.api-sports.io/football/teams/66.png",
          "winner": false
        }
      },
      "goals": {"home": 3, "away": 2},
      "score": {
        "halftime": {"home": 0, "away": 2},
        "fulltime": {"home": 3, "away": 2},
        "extratime": {"home": null, "away": null},
        "penalty": {"home": null, "away": null}
      }
    }
  ]
};



 */
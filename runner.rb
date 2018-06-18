require 'unirest'


response = Unirest.post(
                        "http://localhost:3000/api/game_plays", 
                        parameters: {
                                      user_id: 1,
                                      score: 17,
                                      level: 1
                                    }
                        ) 
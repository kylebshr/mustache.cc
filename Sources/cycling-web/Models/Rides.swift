import Foundation

let upcomingRides: [Ride] = [

    Ride(
        date: Date(timeIntervalSince1970: 1572768000),
        title: "Just Tunitas",
        location: "Fell & Masonic",
        miles: 82,
        elevation: 5800,
        difficulty: "Long & Hard",
        description: """
        Join Julien for a ride to Tunitas Creek down south. It's a long day in the saddle and there isn't a ton of options to stop for food, so come ready with your own fuel. There are at least three/four escape routes if folks want to join but would prefer to go for  a shorter distance.
        """,
        imageName: "tunitas.png",
        link: URL(string: "https://www.strava.com/routes/22453740")!
    )

]

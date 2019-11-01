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
    ),

    Ride(
        date: Date(timeIntervalSince1970: 1572935400),
        title: "Hawk Hill 🥐",
        location: "Fell & Baker",
        miles: 17,
        elevation: 1385,
        difficulty: "Accommodating but climby",
        description: """
        Join us for a classic ride across the bridge and up Hawk Hill for a breathtaking view of the city. On the way back, we’ll stop at Arsicault for the best croissants in the city (the country? the world???).
        """,
        imageName: "hawk-hill.png",
        link: URL(string: "https://www.strava.com/routes/22480662")!
    )

]

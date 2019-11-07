import Foundation

let upcomingRides: [Ride] = [

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

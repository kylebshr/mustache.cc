import Foundation

let upcomingRides: [Ride] = [

    Ride(
        date: Date(timeIntervalSince1970: 1572417000),
        title: "Twin Peaks",
        location: "Fell & Baker",
        miles: 14,
        elevation: 950,
        difficulty: "Accomodating",
        description: """
        Let's watch the sunrise from Twin Peaks. On the way there, we'll stop by Trouble Coffee for espresso, toast and metal music ☕️🍞🤘 Depending on the group, we may switch up the route and descend straight to Market.
        """,
        imageName: "twin-trouble.png",
        link: URL(string: "https://www.strava.com/routes/22372536")!
    )

]

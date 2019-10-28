import Foundation

let upcomingRides: [Ride] = [

    Ride(
        date: Date(timeIntervalSince1970: 1572417900),
        title: "Twin Peaks",
        location: "Fell & Baker",
        miles: 7,
        elevation: 650,
        difficulty: "short but climby",
        description: """
        Let's watch the sunrise from Twin Peaks. This ride is short and sweet, and sure to open up your lungs. If you live closer to the Lyft office, it's likely some people will split off and head towards Market.
        """,
        imageName: "twin-peaks.png",
        link: URL(string: "https://www.strava.com/routes/22372536")!
    )

]

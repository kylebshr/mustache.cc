import Foundation

let upcomingRides: [Ride] = [

    Ride(
        date: Date(timeIntervalSince1970: 1572080400),
        title: "Mill Valley",
        location: "Fell & Baker",
        miles: 28,
        elevation: 1400,
        difficulty: "depends who shows up 😄",
        description: """
        Join us for a long weekend ride! We’ll start at the Panhandle, head over Golden Gate bridge, and ride through beautiful Marin into Mill Valley. After a stop at Equator coffee for drinks and pastries, we’ll do it in reverse!
        """,
        imageName: "mill-valley.png",
        link: URL(string: "https://www.strava.com/routes/22369712")!
    ),

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

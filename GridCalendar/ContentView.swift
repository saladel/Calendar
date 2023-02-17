//
//  ContentView.swift
//  GridCalendar
//
//  Created by Adewale Sanusi on 17/02/2023.
//

import SwiftUI

struct ContentView: View {
    
    let layout = [
        GridItem(.flexible(minimum: 40)),
        GridItem(.flexible(minimum: 40)),
        GridItem(.flexible(minimum: 40)),
        GridItem(.flexible(minimum: 40)),
        GridItem(.flexible(minimum: 40)),
        GridItem(.flexible(minimum: 40)),
        GridItem(.flexible(minimum: 40)),
    ]
    
    var body: some View {
        ScrollView(.vertical) {
            LazyVGrid(columns: layout, pinnedViews: [.sectionHeaders]) {
                ForEach(year, id: \.name) { month in
                    // Section view that gives us a header view that we can use to display the name of the month.
                    Section(header: Text(verbatim: month.name).font(.headline)) {
                        // ForEach that iterates through all of the months of the year.
                        ForEach(month.days) { day in
                            Capsule()
                                .overlay(Text("\(day.value)").foregroundColor(.white)
                                )
                                .foregroundColor(.blue)
                                .frame(height: 40)
                        }
                    }
                    
                }
            }
        }
        .padding()
    }
}



struct Month {
    let name: String
    let numberOfDays: Int
    var days: [Day]
    
    init(name: String, numberOfDays: Int) {
        self.name = name
        self.numberOfDays = numberOfDays
        self.days = []
        
        for n in 1...numberOfDays {
            self.days.append(Day(value: n))
        }
    }
}


struct Day: Identifiable {
    let id = UUID()
    //The value constant will be used to store the order of each particular day of the month, i.e. the 2nd of June will have a value of 2.
    let value: Int
}

let year = [
    Month(name: "January", numberOfDays: 31),
    Month(name: "February", numberOfDays: 28),
    Month(name: "March", numberOfDays: 31),
    Month(name: "April", numberOfDays: 30),
    Month(name: "May", numberOfDays: 31),
    Month(name: "June", numberOfDays: 30),
    Month(name: "July", numberOfDays: 31),
    Month(name: "August", numberOfDays: 31),
    Month(name: "September", numberOfDays: 30),
    Month(name: "October", numberOfDays: 31),
    Month(name: "November", numberOfDays: 30),
    Month(name: "December", numberOfDays: 31),
]






struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



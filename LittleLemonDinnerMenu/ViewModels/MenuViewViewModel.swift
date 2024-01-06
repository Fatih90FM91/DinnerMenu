//
//  MenuViewViewModel.swift
//  LittleLemonDinnerMenu
//
//  Created by frank johansen on 06/01/2024.
//

import Foundation

class MenuViewViewModel: ObservableObject {
    //data foods
    
    @Published var foods: [MenuItem] = [
    
         MenuItem(price: 18.0, title: "Food 4", menuCategory: .food, orderCount: 10, ingredient: [.TomatoSauce, .Carrot, .Pasta]),
         MenuItem(price: 10.0, title: "Food 5", menuCategory: .food, orderCount: 10, ingredient: [.TomatoSauce]),
         MenuItem(price: 90.0, title: "Food 6", menuCategory: .food, orderCount: 10, ingredient: [.TomatoSauce]),
         MenuItem(price: 20.0, title: "Food 7", menuCategory: .food, orderCount: 10, ingredient: [.TomatoSauce, .Spinach, .Carrot]),
         MenuItem(price: 10.0, title: "Food 1", menuCategory: .food, orderCount: 10, ingredient: [.TomatoSauce]),
         MenuItem(price: 15.0, title: "Food 2", menuCategory: .food, orderCount: 15, ingredient: [.TomatoSauce, .Pasta]),
         MenuItem(price: 25.0, title: "Food 3", menuCategory: .food, orderCount: 20, ingredient: [.Spinach, .Broccoli]),
         MenuItem(price: 25.50, title: "Food 8", menuCategory: .food, orderCount: 10, ingredient: [.TomatoSauce, .Broccoli]),
         MenuItem(price: 10.0, title: "Food 9", menuCategory: .food, orderCount: 10, ingredient: [.TomatoSauce]),
         MenuItem(price: 35.0, title: "Food 10", menuCategory: .food, orderCount: 10, ingredient: [.Spinach]),
         MenuItem(price: 45.0, title: "Food 11", menuCategory: .food, orderCount: 10, ingredient: [.Pasta]),
         MenuItem(price: 75.0, title: "Food 12", menuCategory: .food, orderCount: 10, ingredient: [.Carrot, .Spinach])
    
    
    ]
    
    
    // data drinks
    @Published var drinks: [MenuItem] = [
        MenuItem(price: 18.0, title: "Drink 4", menuCategory: .drink, orderCount: 0, ingredient: []),
        MenuItem(price: 10.0, title: "Drink 5", menuCategory: .drink, orderCount: 10, ingredient: []),
        MenuItem(price: 10.0, title: "Drink 1", menuCategory: .drink, orderCount: 0, ingredient: []),
        MenuItem(price: 15.0, title: "Drink 2", menuCategory: .drink, orderCount: 15, ingredient: []),
        MenuItem(price: 10.0, title: "Drink 3", menuCategory: .drink, orderCount: 20, ingredient: []),
        MenuItem(price: 10.0, title: "Drink 6", menuCategory: .drink, orderCount: 10, ingredient: []),
        MenuItem(price: 20.0, title: "Drink 7", menuCategory: .drink, orderCount: 10, ingredient: []),
        MenuItem(price: 25.0, title: "Drink 8", menuCategory: .drink, orderCount: 10, ingredient: [])
    ]
    
    
    //data desserts
    @Published var desserts: [MenuItem] = [
            MenuItem(price: 15.0, title: "Dessert 2", menuCategory: .dessert, orderCount: 15, ingredient: []),
            MenuItem(price: 10.0, title: "Dessert 3", menuCategory: .dessert, orderCount: 20, ingredient: []),
            MenuItem(price: 10.0, title: "Dessert 1", menuCategory: .dessert, orderCount: 0, ingredient: []),
            MenuItem(price: 18.0, title: "Dessert 4", menuCategory: .dessert, orderCount: 0, ingredient: [])
        ]
    
    
    @Published var isOPenedOptionView = false
    
    @Published var isShowFood = true
    @Published var isShowDrinks = true
    @Published var isShowDesserts = true
    
    @Published var sortBy = SortBy.fromAtoZ
    
    
    
    func updateMenuItems() {
        switch sortBy {
            
        case .mostPopular:
            foods.sort(){$0.orderCount > $1.orderCount}
            drinks.sort(){$0.orderCount > $1.orderCount}
            desserts.sort(){$0.orderCount > $1.orderCount}
            
        case .fromLowPrice:
            foods.sort(){$0.orderCount < $1.orderCount}
            drinks.sort(){$0.orderCount < $1.orderCount}
            desserts.sort(){$0.orderCount < $1.orderCount}
            
        case .fromAtoZ:
            foods.sort() {
                            sortByTitle(lhs: $0, rhs: $1)
                        }
            drinks.sort() {
                            sortByTitle(lhs: $0, rhs: $1)
                        }
            desserts.sort() {
                            sortByTitle(lhs: $0, rhs: $1)
                        }
            
        }
    }
    
    
    func sortByTitle(lhs: MenuItem, rhs: MenuItem) -> Bool {
         let lhsTitle = lhs.title.split(separator: " ")
         let rhsTitle = rhs.title.split(separator: " ")
         let lhsNumber = Int(lhsTitle[lhsTitle.count - 1]) ?? 0
         let rhsNumber = Int(rhsTitle[rhsTitle.count - 1]) ?? 0
         if lhsNumber != rhsNumber {
             return lhsNumber < rhsNumber
         } else {
             return lhs.title < rhs.title
         }
     }
}

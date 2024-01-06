//
//  MenuItem.swift
//  LittleLemonDinnerMenu
//
//  Created by frank johansen on 05/01/2024.
//

import Foundation


protocol MenuItemProtocol {
    var id: UUID {get}
    var price: Double {get}
    var title: String {get}
    var menuCategory: MenuCategory {get}
    var orderCount: Int {get set}
    var ingredient: [Ingredient] {get set}
}


struct MenuItem: Identifiable, Hashable, MenuItemProtocol {
    var id = UUID()
    var price: Double
    var title: String
    var menuCategory: MenuCategory
    var orderCount: Int
    var ingredient: [Ingredient]
}

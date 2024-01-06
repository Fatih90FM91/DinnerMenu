//
//  MenuItemsOptionView.swift
//  LittleLemonDinnerMenu
//
//  Created by frank johansen on 05/01/2024.
//

import SwiftUI

struct MenuItemsOptionView: View {
    @EnvironmentObject var viewModel: MenuViewViewModel
    
    var body: some View {
        NavigationStack{
            List{
                //selection by users
                Section("Selected Categories"){
                    Toggle(MenuCategory.food.rawValue, isOn:$viewModel.isShowFood)
                    Toggle(MenuCategory.drink.rawValue, isOn:$viewModel.isShowFood)
                    Toggle(MenuCategory.dessert.rawValue, isOn:$viewModel.isShowFood)
                    
                }
                //Picker was chosen for its
                Picker("Sort by", selection: $viewModel.sortBy){
                    ForEach(SortBy.allCases, id:\.self){category in
                        Text(category.rawValue).tag(category)
                    }
                    
                }
            }
            .pickerStyle(.inline)
            .listStyle(.grouped)
        }
        .navigationTitle("Filter")
    }
}






struct MenuItemsOptionView_Previews: PreviewProvider {
    static var previews: some View {
        
        MenuItemsOptionView().environmentObject(MenuViewViewModel())
    }
}

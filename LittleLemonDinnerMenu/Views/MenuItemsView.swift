//
//  MenuItemsView.swift
//  LittleLemonDinnerMenu
//
//  Created by frank johansen on 06/01/2024.
//

import SwiftUI

struct MenuItemsView: View {
    @StateObject private var viewModel = MenuViewViewModel()
    
    var body: some View {
        NavigationStack{
            //chosen foods, drinks, desserts in the filter
            ScrollView{
                if viewModel.isShowFood {
                    MenuItemView(menuItems:viewModel.foods, menuCategory: .food).environmentObject(viewModel)
                }
                if viewModel.isShowDrinks {
                    MenuItemView(menuItems:viewModel.drinks, menuCategory: .drink).environmentObject(viewModel)
                }
                if viewModel.isShowDesserts {
                    MenuItemView(menuItems:viewModel.desserts, menuCategory: .dessert).environmentObject(viewModel)
                }
            }
            //default sorting of the sample data
            .onAppear() {
                viewModel.updateMenuItems()
            }
            .navigationTitle("Menu")
            .toolbar {
                Button(action: { viewModel.isOPenedOptionView.toggle()}, label: {
                    Image(systemName: "slider.vertical.3")
                })
            }
            //OptionView
            .sheet(isPresented: $viewModel.isOPenedOptionView){
                NavigationStack{
                    MenuItemsOptionView().environmentObject(viewModel)
                        .toolbar {
                            Button("Done"){
                                viewModel.updateMenuItems()
                                viewModel.isOPenedOptionView.toggle()
                            }
                        }
                }
            }
        }
    }
}

struct MenuItems_Previews: PreviewProvider {
    static var previews: some View {
        MenuItemsView()
    }
}

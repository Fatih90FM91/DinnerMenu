//
//  MenuItemsView.swift
//  LittleLemonDinnerMenu
//
//  Created by frank johansen on 05/01/2024.
//

import SwiftUI

struct MenuItemView: View {
    
    @EnvironmentObject var viewModel: MenuViewViewModel
    
    init(menuItems: [MenuItem], menuCategory: MenuCategory) {
        self.menuItems = menuItems
        self.menuCategory = menuCategory
    }
    
    
    var menuItems: [MenuItem]
    
    var menuCategory: MenuCategory
    
    private var threeColumnGrid = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        VStack{
            //Titel
            HStack{
                Text(menuCategory.rawValue)
                    .font(.title)
                    .fontWeight(.medium)
                Spacer()
            }
            //adding a grid with elements in the view
            
            LazyVGrid(columns:threeColumnGrid) {
                ForEach((menuItems), id:\.self) { menuItem in
                //Transition and transfer of data to anathor view
                    NavigationLink(
                        destination: MenuItemDetailsView(menuItem: menuItem)) {
                            //Card item with a potential food image (black square) and the dish
                            
                            VStack{
                                Rectangle()
                                Text(menuItem.title)
                            }
                            .frame(height:120)
                            .foregroundColor(.black)
                        }
                    
                }
            }
        }
        
        .padding()
    }
}




struct MenuItemsView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = MenuViewViewModel()
        MenuItemView(menuItems: viewModel.foods, menuCategory: .food)
    }
}

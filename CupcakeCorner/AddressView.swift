//
//  AddressView.swift
//  CupcakeCorner
//
//  Created by David Ash on 28/08/2023.
//

import SwiftUI

struct AddressView: View {
    @ObservedObject var cakeOrder: CakeOrder
    
    var body: some View {
        Form {
            Section {
                TextField("Name", text: $cakeOrder.order.name)
                TextField("Street address", text: $cakeOrder.order.streetAddress)
                TextField("City", text: $cakeOrder.order.city)
                TextField("Zip", text: $cakeOrder.order.zip)
            }
            
            Section {
                NavigationLink {
                    CheckoutView(cakeOrder: cakeOrder)
                } label: {
                    Text("Check out")
                }
            }
            .disabled(cakeOrder.order.hasValidAddress == false)
        }
        .navigationTitle("Delivery details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct AddressView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddressView(cakeOrder: CakeOrder())
        }
    }
}

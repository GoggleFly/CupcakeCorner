//
//  ContentView.swift
//  CupcakeCorner
//
//  Created by David Ash on 15/08/2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject var cakeOrder = CakeOrder()
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker("Select you cake type", selection: $cakeOrder.order.type) {
                        ForEach(Order.types.indices) {
                            Text(Order.types[$0])
                        }
                    }
                    
                    Stepper("Number of cakes: \(cakeOrder.order.quantity)", value: $cakeOrder.order.quantity, in: 3...20)
                }
                
                Section {
                    Toggle("Any special requests?", isOn:
                            $cakeOrder.order.specialRequestEnabled.animation()
                    )
                    
                    if cakeOrder.order.specialRequestEnabled {
                        Toggle("Add extra frosting", isOn: $cakeOrder.order.extraFrosting)
                        Toggle("Add extra sprinkles", isOn: $cakeOrder.order.addSprinkles)
                    }
                }
                
                Section {
                    NavigationLink {
                        AddressView(cakeOrder: cakeOrder)
                    } label: {
                        Text("Delivery details")
                    }

                }
            }
            .navigationTitle("Cupcake Corner")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

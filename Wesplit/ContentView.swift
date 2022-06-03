//
//  ContentView.swift
//  Wesplit
//
//  Created by KARAN  on 24/05/22.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 20
    @FocusState private var isFocused : Bool
    
    //let tipPercentages = [20,15,10,5,0]
    
    var totalPerPerson : Double {
        let peopleCount = Double(numberOfPeople+2)
        let tipSelection = Double(tipPercentage)
        
        let tipValue = (checkAmount / 100) * tipSelection
        let GrandTotal = tipValue + checkAmount
        
        let amountPerPerson = GrandTotal / peopleCount
        return amountPerPerson
    }
    
    var totalAmountOnCheck : Double {
        
        let tipSelection = Double(tipPercentage)
        let tipValue = (checkAmount / 100) * tipSelection
        let GrandTotal = tipValue + checkAmount
        
        
        return GrandTotal
    }
    
    
    var body: some View {
        NavigationView {
            Form{
                Section{
                    TextField("Amount",value: $checkAmount,format:
                        .currency(code: Locale.current.currencyCode ?? "USD"))
                        .keyboardType(.decimalPad)
                        .focused($isFocused)
                    Picker("Number Of People",selection: $numberOfPeople){
                        ForEach(2..<100){
                            Text("\($0)People")
                        }
                    }
                }
                Section{
                    Picker("Tip Percentage",selection: $tipPercentage){
                        ForEach(0..<101){
                            Text("\($0)Percentage")
                        }
                    }
                }header: {
                    Text("How Much Tip Do You Want To Leave?")
                }
                Section{
                    Text(totalPerPerson,format: .currency(code: Locale.current.currencyCode ?? "USD"))
                }header: {
                    Text("Amount Per Person")
                }
                Section{
                    Text(totalAmountOnCheck,format: .currency(code: Locale.current.currencyCode ?? "USD"))
                }header:{
                    Text("Total Amount On Check")
                }
                .foregroundColor(tipPercentage==0 ? .red : .blue)
            }
            .navigationTitle("WeSplit")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItemGroup(placement: .keyboard){
                    Spacer()
                    Button("Done"){
                        isFocused = false
                    }
                                
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

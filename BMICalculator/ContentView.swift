//
//  ContentView.swift
//  BMICalculator
//
//  Created by David Cormell on 23/02/2022.
//

import SwiftUI

struct ContentView: View {
    @State private var height: Double = 0.0
    @State private var weight: Double = 0.0
    @State private var bmi: Double = 0.0
    @State private var classification: String = ""
    @State private var color: Color = Color(.black)
    @State private var imperial: Bool = false
    
    func get_bmi(){
        withAnimation(){
            let calculator = BMICalculations()
            bmi = calculator.calculateBmi(weight: weight, height: height, imperial: imperial)
            classification = calculator.lookUpBmiClassification(bmi: bmi)
            color = calculator.getColor(classification: classification)
        }
    }
    
    
    
    
    var body: some View {
        VStack(){
            Image("PublicHealth")
                .padding(.top)
            Menu("Settings"){
                Toggle(isOn: $imperial){
                    Text("Imperial Units")
                }
                
                Spacer()
            }
            Slider(value: $height, in: 0...250, step: 0.1)
                .padding(.horizontal)
            Text("\(height, specifier: "%.1f")")
            Slider(value: $weight, in: 0...250, step: 0.1)
                .padding(.horizontal)
            Text("\(weight, specifier: "%.1f")")
            Button(action: get_bmi){
                Text("Calculate")
                    .frame(maxWidth: .infinity)
            }.padding([.leading, .bottom, .trailing], 20).buttonStyle(.bordered)
            Spacer()
            VStack(){
                if bmi != 0.0{
                    Text("Bmi: \(bmi, specifier: "%.1f")")
                    Text("Classification: \(classification)")
                        .foregroundColor(color)
                }
            }
            .padding(.bottom, 50.0)
            .font(.title2)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

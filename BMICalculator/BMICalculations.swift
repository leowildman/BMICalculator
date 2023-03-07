//
//  BMICalculations.swift
//  BMICalculator
//
//  Created by Cormell, David - DPC on 24/02/2022.
//

import Foundation
import SwiftUI



class BMICalculations {
    func calculateBmi(weight: Double, height: Double, imperial:Bool) -> Double {
        if imperial{
            return ((weight / 2.205) / pow(((height*2.54)/100), 2)).rounded(toPlaces: 1)
        }
        return (weight / pow((height/100), 2)).rounded(toPlaces: 1)
    }
    
    func lookUpBmiClassification(bmi: Double) -> String {
        switch bmi{
        case 0.0..<18.5:
            return "Underweight"
        case 18.5...24.9:
            return "Healthy"
        case 25...29.9:
            return "Overweight"
        default:
            return "Obese"
        }
    }
    func getColor(classification: String) -> Color {
        switch classification{
            case "Underweight":
            return Color(.red)
            case "Obese":
            return Color(.red)
            case "Healthy":
            return Color(.green)
            case "Overweight":
            return Color(.orange)
            default:
            return Color(.black)
        }
    }
}

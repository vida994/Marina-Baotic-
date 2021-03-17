//
//  BaoticError.swift
//  Marina Baotić
//
//  Created by Antonio Vidakovic on 03.03.2021..
//

import Foundation

enum BaoticError: String, Error {
    
    case unableToComplete = "Unable to complete your request. Please check your internet connection."
    case invalidResponse = "Invalid response from the server. Please try again."
    case invalidData = "Data recived from the server was invalid. Please try again."
}

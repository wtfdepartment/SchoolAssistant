//
//  TimeExtension.swift
//  SchoolAssistant
//
//  Created by Александра on 21.03.23.
//

import Foundation

extension String {
 var year: Int? {
  let newFormatter = ISO8601DateFormatter()
  guard let date = newFormatter.date(from: self) else { return nil }
  
  let componentYear = Calendar.current.dateComponents([.year], from: date)
  return componentYear.year
 }
 
 var month: Int? {
  let newFormatter = ISO8601DateFormatter()
  guard let date = newFormatter.date(from: self) else { return nil }
  
  let componentYear = Calendar.current.dateComponents([.month], from: date)
  return componentYear.month
 }
 
 var day: Int? {
  let newFormatter = ISO8601DateFormatter()
  guard let date = newFormatter.date(from: self) else { return nil }
  
  let componentYear = Calendar.current.dateComponents([.day], from: date)
  return componentYear.day
 }
}

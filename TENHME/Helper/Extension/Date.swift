//
//  Date.swift
//  TENHME
//
//  Created by Sam Sophanna on 3/5/25.
//

import Foundation

extension Date {
    
    var yesterday: Date { return Date().dayBefore }
    var tomorrow : Date { return Date().dayAfter }
    
    var dayBefore: Date {
        return Calendar.current.date(byAdding: .day, value: -1, to: noon)!
    }
    var dayAfter: Date {
        return Calendar.current.date(byAdding: .day, value: 1, to: noon)!
    }
    var noon: Date {
        return Calendar.current.date(bySettingHour: 12, minute: 0, second: 0, of: self)!
    }
    var day: Int {
        return Calendar.current.component(.day,  from: self)
    }
    var month: Int {
        return Calendar.current.component(.month,  from: self)
    }
    var year: Int {
        return Calendar.current.component(.year,  from: self)
    }
    var isLastDayOfMonth: Bool {
        return dayAfter.month != month
    }
    
    func dateFormat(format: String = "dd/MM/yyyy") -> String {
        let formatter = DateFormatter()
        formatter.timeZone = Calendar.current.timeZone
        formatter.dateFormat = format
        return formatter.string(from: self)
    }
    func timeFormat(format: String = "hh:mm a") -> String {
        let formatter = DateFormatter()
        formatter.timeZone = Calendar.current.timeZone
        formatter.dateFormat = format
        return formatter.string(from: self)
    }
    func dateTimeFormat(format: String = "d MMM hh:mm a") -> String {
        let formatter = DateFormatter()
        formatter.timeZone = Calendar.current.timeZone
        formatter.dateFormat = format
        return formatter.string(from: self)
    }
    func dateToStringFormat(format: String = "yyyyMMdd") -> String {
        let formatter = DateFormatter()
        formatter.timeZone = Calendar.current.timeZone
        formatter.dateFormat = format
//        formatter.locale     = Locale(identifier: MyDefaults.get(key: .appLang) as? String ?? "" )
        return formatter.string(from: self)
    }
    
    func getTimeString() -> String {
        let dateFormatter = DateFormatter()
//        let lang = Shared.language.rawValue
//        dateFormatter.locale = Locale(identifier: lang)
        var formatString = ""
//        switch lang {
//        case "en":
//            formatString = "hh:mm"
//        case "zh", "ja":
//            formatString = "HH : mm"
//        default:
//            break
//        }
        dateFormatter.dateFormat = formatString
        let strTime = dateFormatter.string(from: self)
        return strTime
    }
    
    func getYearString() -> String {
        let dateFormatter = DateFormatter()
//        dateFormatter.locale = Locale(identifier: Shared.language.rawValue)
        dateFormatter.dateFormat = "yyyy"
        let strDay = dateFormatter.string(from: self)
        return strDay
    }
    
    func getMonthName(format: String) -> String {
        let dateFormatter = DateFormatter()
//        dateFormatter.locale = Locale(identifier: Shared.language.rawValue)
        dateFormatter.dateFormat = format
        let strMonth = dateFormatter.string(from: self)
        return strMonth
    }
    
    func getDateRangeOneMonth() -> (dateFrom: String, dateTo: String) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyyMMddHHmmss"
        
        let calendar = Calendar.current
        let currentDate = Date()
        
        // Get the first day of the current month
        let startOfMonth = calendar.date(from: calendar.dateComponents([.year, .month], from: currentDate))!
        
        // Get the last day of the current month
        let endOfMonth = calendar.date(byAdding: DateComponents(month: 1, day: -1), to: startOfMonth)!
        
        let dateFrom = dateFormatter.string(from: startOfMonth)
        let dateTo = dateFormatter.string(from: endOfMonth)
        
        return (dateFrom, dateTo)
    }
    
    func getDateRangeOneYear() -> (dateFrom: String, dateTo: String) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyyMMddHHmmss"
        
        let calendar = Calendar.current
        let currentDate = Date()
        
        // Get the date from 1 year ago
        let oneYearAgo = calendar.date(byAdding: .year, value: -1, to: currentDate)!
        
        // Format the dates
        let dateFrom = dateFormatter.string(from: oneYearAgo)
        let dateTo = dateFormatter.string(from: currentDate)
        
        return (dateFrom, dateTo)
    }

    func getDateRangeOneMonthBill() -> (dateFrom: String, dateTo: String) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyyMMdd"
        
        let calendar = Calendar.current
        let currentDate = Date()
        
        // Get the first day of the current month
        let startOfMonth = calendar.date(from: calendar.dateComponents([.year, .month], from: currentDate))!
        
        // Get the last day of the current month
        let endOfMonth = calendar.date(byAdding: DateComponents(month: 1, day: -1), to: startOfMonth)!
        
        let dateFrom = dateFormatter.string(from: startOfMonth)
        let dateTo = dateFormatter.string(from: endOfMonth)
        
        return (dateFrom, dateTo)
    }
    
    func formatRageDate(dateString: String, format: String) -> String {
        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = "yyyyMMddHHmmss" // Incoming format from the API
        
        let outputFormatter = DateFormatter()
        outputFormatter.dateFormat = format // Dynamic format based on the parameter
        
        if let date = inputFormatter.date(from: dateString) {
            return outputFormatter.string(from: date)
        }
        return dateString
    }
    
    func formatRageDateDeposit(dateString: String, format: String) -> String {
        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = "yyyyMMdd" // Incoming format from the API
        
        let outputFormatter = DateFormatter()
        outputFormatter.dateFormat = format // Dynamic format based on the parameter
        
        if let date = inputFormatter.date(from: dateString) {
            return outputFormatter.string(from: date)
        }
        return dateString
    }
    
    func getDateRangeOneMonthDeposit() -> (dateFrom: String, dateTo: String) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyyMMdd"
        
        let currentDate = Date()
        let oneMonthBefore = Calendar.current.date(byAdding: .month, value: -1, to: currentDate)!
        
        let dateTo        = dateFormatter.string(from: currentDate)
        let dateFrom      = dateFormatter.string(from: oneMonthBefore)
        
        return (dateFrom, dateTo)
    }
    
    func getDayString() -> String {
        let dateFormatter = DateFormatter()
//        dateFormatter.locale = Locale(identifier: Shared.language.rawValue)
        dateFormatter.dateFormat = "dd"
        let strDay = dateFormatter.string(from: self)
        return strDay
    }
    
    func formatToString(format: String) -> String {
        let dateformatter           = DateFormatter()
        dateformatter.dateFormat    = format
        dateformatter.timeZone      = Calendar.current.timeZone
//        dateformatter.locale        = Locale(identifier: MyDefaults.get(key: .appLang) as? String ?? "" ) // Calendar.current.locale
        
        return dateformatter.string(from: self)
    }
    
}

extension DateFormatter {

    func getRelativeDate(date: String?, time: String) -> String {
      guard let dateString = date else {
        return ""
      }

      // Parse time string assuming UTC timezone (adjust if needed)
      let timeFormatter = DateFormatter()
      timeFormatter.dateFormat = "HHmmss"
      timeFormatter.timeZone = Calendar.current.timeZone
      guard let time = timeFormatter.date(from: time) else {
        return ""
      }

      // Parse date string
      let dateFormatter = DateFormatter()
      dateFormatter.dateFormat = "yyyyMMdd"
      guard let date = dateFormatter.date(from: dateString) else {
        return ""
      }

      // Format time components
      let timeFormatter2 = DateFormatter()
      timeFormatter2.dateFormat = "HHmmss" // Adjust format as needed (optional)
      let formattedTime = timeFormatter2.string(from: time)

      // Combine formatted date and time strings
      let combinedString = dateString + formattedTime

      // Parse combined string
      let dateFormatter3 = DateFormatter() // Reuse existing formatter (optional)
      dateFormatter3.dateFormat = "yyyyMMddHHmmss" // Combined format
      guard let startDate = dateFormatter3.date(from: combinedString) else {
        return ""
      }

      let endDate = Date()
      let calendar = Calendar.current
//      let components = calendar.dateComponents([.year, .month, .weekOfMonth, .day, .hour, .minute, .second], from: startDate, to: endDate)

      let formatter = RelativeDateTimeFormatter()
      formatter.unitsStyle = .full
      formatter.locale = Locale(identifier: "en")

      return formatter.localizedString(for: startDate, relativeTo: endDate)
    }
 

}

extension Date {
    func localDate() -> Date {
        let nowUTC = Date()
        let timeZoneOffset = Double(TimeZone.current.secondsFromGMT(for: nowUTC))
        guard let localDate = Calendar.current.date(byAdding: .second, value: Int(timeZoneOffset), to: nowUTC) else {return Date()}

        return localDate
    }
}



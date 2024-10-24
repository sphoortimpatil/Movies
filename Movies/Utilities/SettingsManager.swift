//
//  SettingsManager.swift
//  Movies
//
//  Created by CrewPlace Enterprise on 24/10/24.
//

import Foundation

enum Theme:Int {
    case Light      = 0
    case Dark       = 1
    case System     = 2
}

protocol SettingsManagerDelegate {
    func updateTheme(newTheme:Theme)
}

class SettingsManager {
    
    var delegate: SettingsManagerDelegate?
    
    init(withDelegate delegate:SettingsManagerDelegate) {
        self.delegate = delegate
        let appDefaults = [String:AnyObject]()
        UserDefaults.standard.register(defaults: appDefaults)
        
        NotificationCenter.default.addObserver(self, selector: #selector( self.defaultsChanged), name: UserDefaults.didChangeNotification, object: nil)
    }
    
    func getCurrentTheme() -> Theme {
        let defaults = UserDefaults.standard
        let themeInt = defaults.integer(forKey: "theme")
        return Theme(rawValue: themeInt) ?? Theme.System
    }
}

extension SettingsManager {
    @objc private func defaultsChanged(notification:NSNotification) {
        delegate?.updateTheme(newTheme: getCurrentTheme())
    }
}

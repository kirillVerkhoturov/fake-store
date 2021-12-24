//
//  AppColor.swift
//  Fake Store
//
//  Created by Anton Sobolev on 12/23/21.
//

import UIKit

enum AppColor {

    static let mainPurple = UIColor(named: "mainPurple") ?? missingColor
    static let mainBlue = UIColor(named: "mainBlue") ?? missingColor
    static let primaryBlack = UIColor(named: "primaryBlack") ?? missingColor
    static let primaryGray = UIColor(named: "primaryGray") ?? missingColor
    static let primaryWhite = UIColor(named: "primaryWhite") ?? missingColor
    static let alertSuccess = UIColor(named: "alertSuccess") ?? missingColor
    static let alertWarning = UIColor(named: "alertWarning") ?? missingColor
    static let alertFailure = UIColor(named: "alertFailure") ?? missingColor
    static let primaryBlack90 = UIColor(named: "primaryBlack")?.withAlphaComponent(0.9) ?? missingColor
    static let primaryBlack80 = UIColor(named: "primaryBlack")?.withAlphaComponent(0.8) ?? missingColor
    static let primaryBlack70 = UIColor(named: "primaryBlack")?.withAlphaComponent(0.7) ?? missingColor
    static let primaryBlack60 = UIColor(named: "primaryBlack")?.withAlphaComponent(0.6) ?? missingColor
    static let primaryBlack50 = UIColor(named: "primaryBlack")?.withAlphaComponent(0.5) ?? missingColor
    static let primaryBlack40 = UIColor(named: "primaryBlack")?.withAlphaComponent(0.4) ?? missingColor
    static let primaryBlack30 = UIColor(named: "primaryBlack")?.withAlphaComponent(0.3) ?? missingColor
    static let primaryBlack20 = UIColor(named: "primaryBlack")?.withAlphaComponent(0.2) ?? missingColor
    static let primaryBlack10 = UIColor(named: "primaryBlack")?.withAlphaComponent(0.1) ?? missingColor

    private static let missingColor = UIColor.systemPink

}

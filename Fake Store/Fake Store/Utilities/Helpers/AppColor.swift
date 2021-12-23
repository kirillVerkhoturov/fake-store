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
    static let alertSuccess = UIColor(named: "alertSuccess") ?? missingColor
    static let alertWarning = UIColor(named: "alertWarning") ?? missingColor
    static let alertFailure = UIColor(named: "alertFailure") ?? missingColor

    private static let missingColor = UIColor.systemYellow

}

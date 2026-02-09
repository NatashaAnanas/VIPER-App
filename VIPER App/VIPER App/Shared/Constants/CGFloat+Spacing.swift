//
//  CGFloat+Spacing.swift
//  VIPER App
//
//  Created by Наталья Коновалова on 04.02.2026.
//
import UIKit

// MARK: - CGFloat Extension for Spacing

extension CGFloat {
    
    private static let spacingBase: CGFloat = 4.0
    
    static func spacing(_ multiplier: CGFloat) -> CGFloat {
        return spacingBase * multiplier
    }
    
    // MARK: - Named Spacings
    
    /// 2 pt
    static let spacingTiny: CGFloat = 2
    /// 4 pt
    static let spacingSmall: CGFloat = spacingBase
    /// 8 pt
    static let spacingMedium: CGFloat = spacingBase * 2
    /// 12 pt
    static let spacingMediumPlus: CGFloat = spacingBase * 3
    /// 16 pt
    static let spacingLarge: CGFloat = spacingBase * 4
    /// 32 pt
    static let spacingXLarge: CGFloat = spacingBase * 8
}

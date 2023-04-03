//
//  Utils.swift
//
//  Copyright © 2023 Darren Ford. All rights reserved.
//
//  MIT license
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated
//  documentation files (the "Software"), to deal in the Software without restriction, including without limitation the
//  rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to
//  permit persons to whom the Software is furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all copies or substantial
//  portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE
//  WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS
//  OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
//  OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
//

import Foundation
import CoreGraphics

/// Attempt to convert an opaque type to a CGFloat value.
@inlinable @inline(__always) internal func CGFloatValue(_ opaque: Any?) -> CGFloat? {
	if let value = DoubleValue(opaque) {
		return CGFloat(value)
	}
	return nil
}

/// Attempt to convert an opaque type to a double value.
@inlinable @inline(__always) internal func DoubleValue(_ opaque: Any?) -> Double? {
	return (opaque as? NSNumber)?.doubleValue
}

/// Attempt to convert an opaque type to a bool value.
@inlinable @inline(__always) internal func BoolValue(_ opaque: Any?) -> Bool? {
	return (opaque as? NSNumber)?.boolValue
}

/// A common 'localization' bundle that swaps between Cocoapod and SPM as needed
extension Bundle {
#if COCOAPODS
	static let localization = Bundle.main
#else
	static let localization = Bundle.module
#endif
}

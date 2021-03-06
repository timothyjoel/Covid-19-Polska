//
//  Images.swift
//  CovidCharts
//
//  Created by Timothy Stokarski on 14/04/2020.
//  Copyright © 2020 Timothy Stokarski. All rights reserved.
//

import SwiftUI

enum Icons {
    static let confirmed = "thermometer"
    static let time = "clock"
    static let deaths = "heart.slash"
    static let recovered = "smiley"
    static let info = "info.circle"
    static let reload = "arrow.clockwise"
    static let calendar = "calendar"
    static let percent = "percent"
    static let bars = "chart.bar"
    static let more = "ellipsis"
    static let increase = "arrow.up.right"
    static let dismiss = "xmark"
    static let table = "list.dash"
    static let back = "chevron.left"
    static let hide = "chevron.down"
    static let menu = "list.dash"
    static let sum = "sum"
    static let up = "arrow.up"
    static let flag = "flag"
    static let cancel = "xmark"
    static let pencil = "pencil"
}

struct IconView: View {
    var name: String
    var size: Image.Scale
    var weight: Font.Weight
    var color: Color
    var body: some View {
        Image(systemName: name)
            .font(.system(size: 20, weight: weight))
            .imageScale(size)
            .frame(width: 32, height: 32)
            .foregroundColor(color)
    }
}

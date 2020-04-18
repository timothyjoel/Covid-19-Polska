//
//  ChartToolbarView.swift
//  CovidCharts
//
//  Created by Timothy Stokarski on 16/04/2020.
//  Copyright © 2020 Timothy Stokarski. All rights reserved.
//

import SwiftUI

struct ChartToolbar: View {
    
    @EnvironmentObject var vm: ChartViewModel

    var body: some View {
        HStack {
            ChartToolbarLeftSide()
            Spacer()
            ShowDetailsButton()
        }
        .frame(width: UIScreen.screenWidth + 32, height: 40, alignment: .center)
    }
    
}

struct ChartToolbar_Previews: PreviewProvider {
    static var previews: some View {
        ChartToolbar().environmentObject(ChartViewModel())
    }
}

private struct ShowDetailsButton: View {
    var body: some View {
        Button(action: {
            print("show")
        }) {
            Text("Pokaż szczegóły")
                .font(.system(size: 16, weight: .semibold, design: .default))
                .multilineTextAlignment(.leading)
                .foregroundColor(Color(UIColor.label))
                .padding(.trailing, 16)
        }
        .frame(width: 170, height: 40, alignment: .center)
        .background(Color(UIColor.systemBackground))
        .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
        .shadow(color: Color.black.opacity(0.2), radius: 8, x: 0, y: 5)
    }
}

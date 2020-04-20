//
//  ChartToolbarView.swift
//  CovidCharts
//
//  Created by Timothy Stokarski on 16/04/2020.
//  Copyright © 2020 Timothy Stokarski. All rights reserved.
//

import SwiftUI

struct ChartToolbar: View {
    
    @Binding var showDetailsView: Bool
    @Binding var showPopup: Bool
    
    var body: some View {
        VStack {
            Spacer()
                .frame(width: UIScreen.width, height: 8, alignment: .center)
            HStack {
                ChartToolbarLeftSide(showPopup: $showPopup)
                Spacer()
                ShowDetailsButton(showDetailsView: $showDetailsView)
//                ShowDetailsButton(detailsViewModel: DetailsViewModel(data: vm.getData(vm.parameter), parameter: vm.parameter, regionData: vm.regionData
//                ), showDetailsView: $showDetailsView)
            }
            .frame(width: UIScreen.width + 32, height: 40, alignment: .center)
            Spacer()
                .frame(width: UIScreen.width, height: 8, alignment: .center)
        }

    }
    
}

struct ChartToolbar_Previews: PreviewProvider {
    static var previews: some View {
        ChartToolbar(showDetailsView: .constant(false), showPopup: .constant(false))
    }
}

private struct ShowDetailsButton: View {
    
    @EnvironmentObject var vm: ChartViewModel
    @Binding var showDetailsView: Bool
    
    var body: some View {
        Button(action: {
            print("Tapped")
            self.showDetailsView.toggle()
        }) {
            Text("Pokaż szczegóły")
                .font(.system(size: 16, weight: .semibold, design: .default))
                .multilineTextAlignment(.leading)
                .foregroundColor(Colors.label)
                .padding(.trailing, 16)
        }
        .sheet(isPresented: $showDetailsView) {
            DetailsView(showDetailsView: self.$showDetailsView).environmentObject(self.vm)
        }
        .frame(width: 170, height: 40, alignment: .center)
        .background(Colors.customViewBackground)
        .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
        .shadow(color: Color.black.opacity(0.2), radius: 8, x: 0, y: 5)
    }
}

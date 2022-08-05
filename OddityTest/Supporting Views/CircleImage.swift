//
//  CircleImage.swift
//  OddityTest
//
//  Created by Good Developer on 2022/8/4.
//

import SwiftUI

struct CircleImage: View {
    
    var image: Image
    
    var body: some View {
        image
            .resizable()
            .scaledToFill()
            .clipShape(Circle())
            .frame(minWidth: 20, maxWidth: 180, minHeight: 20, maxHeight: 180, alignment: .center)
            .padding(.all, 1)
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage(image: Image("img_default"))
    }
}

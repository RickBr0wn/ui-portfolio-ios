//
//  GlassMorphismWelcomePageUI.swift
//  iOS_UI_Portfolio
//
//  Created by Rick Brown on 23/10/2021.
//

import SwiftUI

struct GlassMorphicCard: View {
  let width = UIScreen.main.bounds.width
  
  var body: some View {
    ZStack {
      RoundedRectangle(cornerRadius: 25.0)
        .fill(.white)
        .opacity(0.1)
        .background(
          Color.white
            .opacity(0.08)
            .blur(radius: 10.0)
        )
        .background(
          RoundedRectangle(cornerRadius: 25.0)
            .stroke(.linearGradient(.init(colors: [Color("GlassMorphismPurple"), Color("GlassMorphismPurple").opacity(0.5), .clear, .clear, Color("GlassMorphismLightBlue")]), startPoint: .topLeading, endPoint: .bottomTrailing), lineWidth: 2.5)
            .padding(2)
        )
        .shadow(color: .black.opacity(0.1), radius: 5, x: -5, y: -5)
        .shadow(color: .black.opacity(0.1), radius: 5, x: 5, y: 5)
      
      VStack {
        Image(systemName: "sun.max")
          .font(.system(size: 74, weight: .thin))
        
        Text("16")
          .font(.system(size: 80, weight: .bold))
          .padding(.top, 2)
          .overlay(
            Text("°C")
              .font(.title2)
              .foregroundColor(Color.white.opacity(0.7))
              .offset(x: 30.0, y: 15.0)
            , alignment: .topTrailing
          )
          .offset(x: -6)
        
        Text("London, England")
          .font(.title3)
          .foregroundColor(Color.white.opacity(0.4))
      }
    }
    .frame(width: width / 1.7, height: (width / 1.7) + 40)
  }
}

struct GlassMorphismWelcomePageUI: View {
  var body: some View {
    ZStack {
      bokehEffectBackground
      content
    }
  }
  // Using iOS15 AttributesString
  /*
   Attributes provide traits like visual styles for display, accessibilty for guided access, and hyperlink data for linking between data sources.
   */
  private func getAttributesString() -> AttributedString {
    var attStr = AttributedString("Start now and learn more about \n local weather instantly.")
    attStr.foregroundColor = .gray
    // Find the range to set AttributedString to set the foreground color of the attributed string
    if let range = attStr.range(of: "local weather") {
      attStr[range].foregroundColor = .white
    }
    return attStr
  }
}

extension GlassMorphismWelcomePageUI {
  private var bokehEffectBackground: some View {
    ZStack {
      LinearGradient(colors: [Color("GlassMorphismBackground#1"), Color("GlassMorphismBackground#2")], startPoint: .top, endPoint: .bottom)
        .edgesIgnoringSafeArea(.all)
      
      GeometryReader { geometryProxy in
        let size = geometryProxy.size
        
        // Darken the whole background
        Color.black
          .opacity(0.7)
          .blur(radius: 200)
          .edgesIgnoringSafeArea(.all)
        
        // Light spots
        Circle()
          .fill(Color("GlassMorphismPurple"))
          .padding(50)
          .blur(radius: 120.0)
          .offset(x: -size.width / 1.8, y: -size.height / 5)
        
        Circle()
          .fill(Color("GlassMorphismLightBlue"))
          .padding(50)
          .blur(radius: 150.0)
          .offset(x: size.width / 1.8, y: -size.height / 2)
        
        Circle()
          .fill(Color("GlassMorphismLightBlue"))
          .padding(50)
          .blur(radius: 150.0)
          .offset(x: size.width / 1.8, y: size.height / 2)
        
        Circle()
          .fill(Color("GlassMorphismPurple"))
          .padding(100)
          .blur(radius: 80.0)
          .offset(x: size.width / 1.8, y: size.height / 2)
        
        Circle()
          .fill(Color("GlassMorphismPurple"))
          .padding(100)
          .blur(radius: 80.0)
          .offset(x: -size.width / 1.8, y: size.height / 2)
      }
    }
  }
  private var button: some View {
    Button {
      
    } label: {
      Text("Get Started")
        .font(.title3.bold())
        .padding(.vertical, 22)
        .frame(maxWidth: .infinity)
        .background(.linearGradient(.init(colors: [Color("GlassMorphismButton#1"), Color("GlassMorphismButton#2")]), startPoint: .leading, endPoint: .trailing), in: RoundedRectangle(cornerRadius: 20.0))
    }
    .padding(.horizontal, 50)
    .padding(.vertical, 20)
    
  }
  private var content: some View {
    VStack {
      Spacer(minLength: 10.0)
      
      ZStack {
        Circle()
          .fill(Color("GlassMorphismPurple").opacity(0.7))
          .blur(radius: 20)
          .frame(width: 100, height: 100)
          .offset(x: 120.0, y: -80.0)
        
        Circle()
          .fill(Color("GlassMorphismLightBlue").opacity(0.7))
          .blur(radius: 40)
          .frame(width: 100, height: 100)
          .offset(x: -120.0, y: 100.0)
        
        GlassMorphicCard()
      }
      
      Spacer(minLength: 1.0)
      Text("Know everything\nabout the weather")
        // Adaption for smaller screens
        .font(.system(size: UIScreen.main.bounds.height < 750 ? 30.0 : 40.0, weight: .bold))
      
      Text(getAttributesString())
        .fontWeight(.semibold)
        .kerning(1.1)
        .padding(.top, 10)
      
      button
    }
    .foregroundColor(.white)
    .multilineTextAlignment(.center)
    .padding()
  }
}

struct GlassMorphismWelcomePageUI_Previews: PreviewProvider {
  static var previews: some View {
    GlassMorphismWelcomePageUI()
  }
}

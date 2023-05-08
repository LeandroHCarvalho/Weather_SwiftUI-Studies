//
//  ContentView.swift
//  Weather
//
//  Created by Leandro Carvalho on 29/04/23.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel: ViewModel
    @State var isAnimated: Bool = false
    @State var viewState = CGSize.zero
    
    init() {
        self.viewModel = ViewModel()
    }
    
    var body: some View {
        
        VStack(alignment: .center, spacing: 25) {
            Spacer()
            Text("Weather")
                .padding(EdgeInsets(top: 10, leading: 120, bottom: 0, trailing: 120))
                .font(.largeTitle)
                .fontWeight(.bold)
            HStack(alignment: .center, spacing: 20) {
                TextField("enter a city to look up", text: self.$viewModel.cityName) {
                    self.viewModel.cityLookup()
                    self.isAnimated.toggle()
                }
                    .padding(10)
                    .shadow(color: .blue, radius: 10)
                    .cornerRadius(10)
                    .fixedSize()
                    .font(.custom("Ariel", size: 26))
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .background(Color("background"))
                    .cornerRadius(15)
            }
            
            // MARK: - Temperature
            HStack(alignment: .center) {
                image(image: "temp", background: "background")
                    .rotation3DEffect(Angle(degrees: isAnimated ? 360 : 0), axis: (x: 10, y: 0.0, z: 0.0))
                    .animation(.easeInOut(duration: 0.8), value: isAnimated)
                    .onTapGesture {
                        self.isAnimated.toggle()
                    }
                    .offset(x: viewState.width, y: viewState.height)
                    .gesture(DragGesture()
                        .onChanged({ value in
                            self.viewState = value.translation
                            self.isAnimated = true
                        })
                            .onEnded({ valeu in
                                self.viewState = .zero
                                self.isAnimated = false
                            }))
//                    .scaleEffect(isAnimated ? 1.9 : 1.0)

                descriptionText(titleText: "Temperature")
                Text(self.viewModel.temperature)
                    .modifier(dataText())
                    .rotation3DEffect(Angle(degrees: isAnimated ? 360 : 0), axis: (x: 10, y: 0.0, z: 0.0))
                    .animation(.easeInOut(duration: 0.8), value: isAnimated)
                Spacer()
            }
            
            // MARK: - Humidity
            HStack(alignment: .center) {
                image(image: "humidity", background: "background10")
                    .rotation3DEffect(Angle(degrees: isAnimated ? 360 : 0), axis: (x: 10, y: 0.0, z: 0.0))
                    .animation(.easeInOut(duration: 0.8), value: isAnimated)
                    .onTapGesture {
                        self.isAnimated.toggle()
                    }
                    .offset(x: viewState.width, y: viewState.height)
                    .gesture(DragGesture()
                        .onChanged({ value in
                            self.viewState = value.translation
                            self.isAnimated = true
                        })
                            .onEnded({ valeu in
                                self.viewState = .zero
                                self.isAnimated = false
                            }))
//                    .scaleEffect(isAnimated ? 1.9 : 1.0)
                descriptionText(titleText: "Humidity")
                Text(self.viewModel.humid)
                    .modifier(dataText())
                    .rotation3DEffect(Angle(degrees: isAnimated ? 360 : 0), axis: (x: 10, y: 0.0, z: 0.0))
                    .animation(.easeInOut(duration: 0.8), value: isAnimated)
                Spacer()
            }
            
            // MARK: - Pressure
            HStack(alignment: .center) {
                image(image: "pressure", background: "background3")
                    .rotation3DEffect(Angle(degrees: isAnimated ? 360 : 0), axis: (x: 10, y: 0.0, z: 0.0))
                    .animation(.easeInOut(duration: 0.8), value: isAnimated)
                    .onTapGesture {
                        self.isAnimated.toggle()
                    }
                    .offset(x: viewState.width, y: viewState.height)
                    .gesture(DragGesture()
                        .onChanged({ value in
                            self.viewState = value.translation
                            self.isAnimated = true
                        })
                            .onEnded({ valeu in
                                self.viewState = .zero
                                self.isAnimated = false
                            }))
//                    .scaleEffect(isAnimated ? 1.9 : 1.0)
                descriptionText(titleText: "Pressure")
                Text(self.viewModel.press)
                    .modifier(dataText())
                    .rotation3DEffect(Angle(degrees: isAnimated ? 360 : 0), axis: (x: 10, y: 0.0, z: 0.0))
                    .animation(.easeInOut(duration: 0.8), value: isAnimated)
                Spacer()
            }
            
            // MARK: - Wind Speed
            HStack(alignment: .center) {
                image(image: "windSpeed", background: "background4")
                    .rotation3DEffect(Angle(degrees: isAnimated ? 360 : 0), axis: (x: 10, y: 0.0, z: 0.0))
                    .animation(.easeInOut(duration: 0.8), value: isAnimated)
                    .onTapGesture {
                        self.isAnimated.toggle()
                    }
                    .offset(x: viewState.width, y: viewState.height)
                    .gesture(DragGesture()
                        .onChanged({ value in
                            self.viewState = value.translation
                            self.isAnimated = true
                        })
                            .onEnded({ valeu in
                                self.viewState = .zero
                                self.isAnimated = false
                            }))
//                    .scaleEffect(isAnimated ? 1.9 : 1.0)
                descriptionText(titleText: "Wind Speed")
                Text(self.viewModel.windSpeed)
                    .modifier(dataText())
                    .rotation3DEffect(Angle(degrees: isAnimated ? 360 : 0), axis: (x: 10, y: 0.0, z: 0.0))
                    .animation(.easeInOut(duration: 0.8), value: isAnimated)
                    
                Spacer()
            }
            
            // MARK: - Wind Direction
            HStack(alignment: .center) {
                image(image: "windDirection", background: "background5")
                    .rotation3DEffect(Angle(degrees: isAnimated ? 360 : 0), axis: (x: 10, y: 0.0, z: 0.0))
                    .animation(.easeInOut(duration: 0.8), value: isAnimated)
                    .onTapGesture {
                        self.isAnimated.toggle()
                    }
                    .offset(x: viewState.width, y: viewState.height)
                    .gesture(DragGesture()
                        .onChanged({ value in
                            self.viewState = value.translation
                            self.isAnimated = true
                        })
                            .onEnded({ valeu in
                                self.viewState = .zero
                                self.isAnimated = false
                            }))
//                    .scaleEffect(isAnimated ? 1.9 : 1.0)
                descriptionText(titleText: "Wind Direction")
                Text(self.viewModel.windDirection)
                    .modifier(dataText())
                    .rotation3DEffect(Angle(degrees: isAnimated ? 360 : 0), axis: (x: 10, y: 0.0, z: 0.0))
                    .animation(.easeInOut(duration: 0.8), value: isAnimated)
                Spacer()
            }
            
            // MARK: - Cloud Percent
            HStack(alignment: .center) {
                image(image: "cloud", background: "background2")
                    .rotation3DEffect(Angle(degrees: isAnimated ? 360 : 0), axis: (x: 10, y: 0.0, z: 0.0))
                    .animation(.easeInOut(duration: 0.8), value: isAnimated)
                    .onTapGesture {
                        self.isAnimated.toggle()
                    }
                    .offset(x: viewState.width, y: viewState.height)
                    .gesture(DragGesture()
                        .onChanged({ value in
                            self.viewState = value.translation
                            self.isAnimated = true
                        })
                            .onEnded({ valeu in
                                self.viewState = .zero
                                self.isAnimated = false
                            }))
//                    .scaleEffect(isAnimated ? 1.9 : 1.0)
                descriptionText(titleText: "Cloud Percent")
                Text(self.viewModel.cloudPercent)
                    .modifier(dataText())
                    .rotation3DEffect(Angle(degrees: isAnimated ? 360 : 0), axis: (x: 10, y: 0.0, z: 0.0))
                    .animation(.easeInOut(duration: 0.8), value: isAnimated)
                Spacer()
            }
            Spacer()
            
        }.background(
            Image("screenBackground")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}

struct image: View {
    var image = ""
    var background = ""
    
    var body: some View {
        Image(image)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 100, height: 80)
            .background(Color(background))
            .cornerRadius(20)
            .shadow(radius: 15)
            .padding(.leading, 40)
            .padding(.bottom, 0)
    }
}

struct descriptionText: View {
    var titleText = ""
    
    var body: some View {
        Text(titleText)
            .font(.system(size: 22))
            .shadow(color: .black, radius: 0.5, x: 0, y: 1)
            .frame(width: 150, height: 20, alignment: .center)
    }
}

struct dataText: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 25))
            .fontWeight(.bold)
            .shadow(color: .black, radius: 0.5, x: 0, y: 1)
    }
}

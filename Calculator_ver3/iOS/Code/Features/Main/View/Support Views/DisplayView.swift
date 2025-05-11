
import SwiftUI

struct DisplayView: View {
    //MARK: - Variables
    @EnvironmentObject var mainViewModel: MainViewModel
    let height: CGFloat
    let colorScheme: ColorScheme
    let duration: TimeInterval
    //MARK: - Views
    var body: some View {
        ZStack(){
            //MARK: Display shape
            ZStack(){
                DisplayShape()
                    .foregroundStyle(.indigo)
                    .opacity(0.05)
                //MARK: Two bottom lines
                VStack(spacing: 0){
                    Spacer()
                    Rectangle()
                        .foregroundStyle(.cyan)
                        .frame(height: height * 0.015)
                        .opacity(0.3)
                    Rectangle()
                        .foregroundStyle(.orange)
                        .frame(height: height * 0.015)
                        .opacity(0.25)
                }
                //MARK: Display Border
                DisplayShape()
                    .stroke(style: StrokeStyle(lineWidth: 5, lineCap: .round, lineJoin: .round))
                    .foregroundStyle(Color.label)
                    .padding(.horizontal, 2.25)
            }
            .frame(height: height * 0.25)
            .overlay(alignment: .trailing){
                ZStack(){
                    /// Default
                    Text("0")
                        .foregroundStyle(Color.label)
                        .font(TypefaceOne.regular.font(size: 60))
                        .tracking(4)
                        .lineLimit(1)
                        .animation(.easeInOut(duration: duration), value: self.mainViewModel.result)
                        .opacity(self.mainViewModel.result.isEmpty ? 0.6 : 0)
                        .animation(.default, value: self.mainViewModel.result.isEmpty)
                    /// Input or Result Text View
                    Text(self.mainViewModel.result)
                        .foregroundStyle(Color.label)
                        .font(TypefaceOne.regular.font(size: 60))
                        .tracking(4)
                        .minimumScaleFactor(0.4)
                        .lineLimit(1)
                        .animation(.easeInOut(duration: duration), value: self.mainViewModel.result)
                        .animation(.default, value: self.mainViewModel.result.isEmpty)
                }
                .padding(.horizontal, 24)
            }
        }
    }
}

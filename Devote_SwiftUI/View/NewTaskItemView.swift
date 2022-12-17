//
//  NewTaskItemView.swift
//  Devote_SwiftUI
//
//  Created by Venkata Ajay Sai (Paras) on 04/12/22.
//

import SwiftUI

struct NewTaskItemView: View {
    // MARK: - PROPERTIES
    @State var task: String = ""
    @Binding var isShowing:Bool
    @AppStorage("isDarkMode") var isDarkMode: Bool = false
    private var isButtonDisabled: Bool{
        task.isEmpty
    }
    @Environment(\.managedObjectContext) private var viewContext
    // MARK: - FUNCTIONS
    private func addItem() {
        withAnimation {
            let newItem = Item(context: viewContext)
            newItem.timestamp = Date()
            newItem.task = task
            newItem.completion = false
            newItem.id = UUID()
            
            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
            task = ""
            hideKeyboard()
            isShowing = false
        }
    }
    // MARK: - BODY
    var body: some View {
        VStack{
            Spacer()
            VStack(spacing:16){
                TextField("New Task", text: $task)
                    .foregroundColor(.pink)
                    .font(Font.system(size: 24, weight: .bold, design: .rounded))
                    .padding()
                    .background(
                        isDarkMode ? Color(uiColor: UIColor.tertiarySystemBackground): Color(UIColor.secondarySystemBackground)
                    )
                    .cornerRadius(10)
                Button(action: {
                    addItem()
                    playSound(sound: "sound-ding", type: "mp3")
                    feedback.notificationOccurred(.success)
                }) {
                    Spacer()
                    Text("SAVE")
                        .font(Font.system(size: 24, weight: .bold, design: .rounded))
                    Spacer()
                }
                .onTapGesture {
                    if isButtonDisabled{
                        playSound(sound: "sound-tap", type: "mp3")
                        feedback.notificationOccurred(.error)
                    }
                }
                .disabled(isButtonDisabled)
                .padding()
                .background(isButtonDisabled ? .blue : Color.pink)
                .foregroundColor(.white)
                .cornerRadius(10)
            } //: VSTACK
            .padding(.horizontal)
            .padding(.vertical,20)
            .background(
                isDarkMode ? Color(uiColor: UIColor.secondarySystemBackground) : Color.white
                )
            .cornerRadius(16)
            .shadow(color: Color(red: 0, green: 0, blue: 0).opacity(0.65), radius: 24)
            .frame(maxWidth: 640)
        } //: VSTACK
        .padding()
    }
}

struct NewTaskItemView_Previews: PreviewProvider {
    static var previews: some View {
        NewTaskItemView(isShowing: .constant(true))
            .background(Color.gray, ignoresSafeAreaEdges: .all)
    }
}

// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
//  Created by Sam Deane on 20/01/2021.
//  All code (c) 2021 - present day, Elegant Chaos Limited.
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

import SwiftUI

public struct SheetControllerHost<Content>: View where Content: View {
    @EnvironmentObject var sheetController: SheetController

    let content: () -> Content

    public init(_ content: @escaping () -> Content) {
        self.content = content
    }
    
    public var body: some View {
        content()
            .sheet(isPresented: $sheetController.isPresented, onDismiss: {
                sheetController.dismiss()
            }) { sheetController.presentedView }
    }
}

public extension View {
    func usingSheetController() -> some View {
        SheetControllerHost {
            self
        }
    }
}

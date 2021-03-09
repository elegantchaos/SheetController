// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
//  Created by Sam Deane on 09/03/21.
//  All code (c) 2021 - present day, Elegant Chaos Limited.
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

import SwiftUI

public struct SheetDismissButton: View {
    @EnvironmentObject var sheetController: SheetController

    public init() {
    }
    
    public var body: some View {
        Button(action: { sheetController.dismiss() }) {
            Text("Done")
        }

    }
}

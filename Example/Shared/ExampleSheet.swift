// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
//  Created by Sam Deane on 20/01/2021.
//  All code (c) 2021 - present day, Elegant Chaos Limited.
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

import SwiftUI
import SheetController

struct ExampleSheet: View {
    @EnvironmentObject var sheetController: SheetController

    var body: some View {
        Text("Sheet content here")
        Button(action: sheetController.dismiss) {
            Text("Done")
        }
    }
}

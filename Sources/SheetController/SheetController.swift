// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
//  Created by Sam Deane on 15/04/2020.
//  All code (c) 2020 - present day, Elegant Chaos Limited.
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

import SwiftUI

/// Utility class for controlling the presentation of sheets.
///
/// See README.md for documentation.

public class SheetController: ObservableObject {
    public typealias ViewMaker = () -> AnyView
    public typealias EnvironmentSetter = (AnyView) -> AnyView

    @Published internal var isPresented: Bool
    fileprivate var viewMaker: ViewMaker?
    
    /// Block which applies an environment to the sheet.
    public var environmentSetter: EnvironmentSetter?
    
    internal var presentedView: some View {
        guard let view = viewMaker?() else {
            return AnyView(EmptyView())
        }
        
        if let setter = environmentSetter {
            return setter(view)
        } else {
            return AnyView(view.environmentObject(self))
        }
    }

    public init() {
        isPresented = false
    }
    
    public func show<Content>(_ maker: @escaping () -> Content) where Content: View {
        viewMaker = { AnyView(maker()) }
        isPresented = true
    }
    
    public func dismiss() {
        isPresented = false
        viewMaker = nil
    }
}

# SheetController


Utility class for controlling the presentation of sheets.


## Injection

You should inject an instance of `SheetController` into the root of your scene as an environment object:

    struct Application: App {
        var body: some Scene {
            let sheetController = SheetController()
            return WindowGroup {
                ContentView()
                    .environmentObject(sheetController)
            }
        }
    }


## Hosting

The sheet controller needs to be hooked up to the view that wants to have `.sheet` called on it.

Typically this is your root content view. 

The easiest way to do this is by putting a `SheetControllerHost` view at the root of your content view:

    struct ContentView: View {
        var body: some View {
            SheetControllerHost {
                Text("My content here...")
            }
        }
    }

Alternatively, you can use the `.usingSheetController()` property: 

    struct ContentView: View {
       var body: some View {
         VStack {
           Text("My Content Here)
         }
         .usingSheetController()
       }
    }

## Showing Sheets

To display a sheet, a child view calls `show()` on the controller,
and passes a block which defines the view to show.

Access to the sheet controller is obtained using `@EnvironmentObject`:

    struct InnerView: View {
        @EnvironmentObject var sheetController: SheetController
        var body: some View {
            VStack {
                Button("Show Sheet") {
                    sheetController.show {
                        MySheetView()
                    }
                }
            }
        }
    }

## Dismissing Sheets

A sheet view can dismiss itself using by calling `dimisss()` on the controller:

    struct SheetView: View {
        @EnvironmentObject var sheetController: SheetController
        var body: some View {
            Text("Sheet content here")
            Button(action: sheetController.dismiss) {
                Text("Done")
            }
        }
    }


## Environment In The Sheet

When the sheet is displayed, you might expect that SwiftUI would arrange things so that it inherited the environment of the hosting view.

Unfortunately, that is not the case.

You can of course apply environment values in the content you pass to `show()`, by calling `.environment` or `.environmentObject` on it.

However, it's a pain to surface every important environment value just so that you can pass it down to the sheet view. It also defeats one of the main advantages of the environment system, which is that generally you don't need to know what values have been set further up the line.

As a work around for this problem, `SheetController` has an `environmentSetter` property. This accepts a block that applies environment settings to any sheet view that the controller shows. 

You can set this block once when you create the sheet controller, and use it to apply the global environment values that you want any displayed sheet to be able to access. 


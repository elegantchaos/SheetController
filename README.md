# SheetController


Utility class for controlling the presentation of sheets.

Your root content view should own one of these, or have one passed to it
as a binding / in the environment.

You hook it up with `.usingSheetController()`
///
E.g:
///
   struct ContentView: View {
       var body: some View {
         VStack {
           Text("My Content Here)
         }
         .usingSheetController()
       }
   }
///
To display a sheet, a child view calls `show()` on the controller,
and passes a block which returns the view to show.
///
E.g:
///
    struct SomeView: View {
      @EnvironmentObject var sheetController: SheetController
///
      var body: some View {
         VStack {
            Button("Show Sheet") {
              sheetController.show {
                Text("Sheet content here")
              }
            }
         }
      }
    }
///
///
To dismiss the sheet, a child view calls `dimisss()` on the controller.
///
## Environment
///
It would be great if we could just grab the entire environment
from the presenting view and apply it to the sheet view
(or if it was just automatically inherited by the sheet view).
///
Sadly, right now this doesn't happen and there seems no way to do it.
///
You can apply environment values in the block you pass to `show()`.
However, it's a pain for the hosting view which supplies that block
to have to surface every important environment value just so that it
can pass it to the sheet view.
///
To work round this, we have a `environmentSetter` property on the
sheet controller, which is a block that applies environment settings to the
sheet view. You can set this once when you create the sheet controller, and
use it to apply global settings and objects.


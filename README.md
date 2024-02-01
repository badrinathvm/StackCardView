# StackCardView

#### SwiftUI iOS component for showing stack of cards with swipe and button actions

[![Version](https://img.shields.io/cocoapods/v/StackCardView.svg?style=flat)](https://cocoapods.org/pods/StackCardView)
[![License](https://img.shields.io/cocoapods/l/StackCardView.svg?style=flat)](https://cocoapods.org/pods/StackCardView)
[![Platform](https://img.shields.io/cocoapods/p/StackCardView.svg?style=flat)](https://cocoapods.org/pods/StackCardView)


<table>
 <tr>
    <td><img src="https://raw.githubusercontent.com/badrinathvm/StackCardView/master/images/StackCardView.gif" height="450" alt="StackCardView"/></td>
    <td><img src="https://raw.githubusercontent.com/badrinathvm/StackCardView/master/images/StackCardWithButtons.gif" height="450" alt="StackCardViewWithButtons"/></td>
 </tr>
</table>


</p>

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

StackCardView is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'StackCardView'
```

### ViewModifiers 

```ruby
.setCardDisplayType(value: StackCardDisplayType)
    Sets the display type of the StackCard to either .top or .bottom position.

.setRotationAngle(value: CGFloat)
    Sets the rotation angle of the StackCard to `value` degrees.

.onRightSwipe(perform action: @escaping (() -> Void))
     Executes the provided closure when a right swipe gesture is detected

.onLeftSwipe(perform action: @escaping (() -> Void))
     Executes the provided closure when a left swipe gesture is detected
     
.bind(model: [any StackCardModelProtocol])
     Binds the model requried for card offset positions, updating etc.
```

## Usage

``` swift
import StackCardView

// Step 1: create a model make sure it corresponds to `StackCardModelProtocol`
struct StackCardModel: StackCardModelProtocol, Identifiable {
    typealias CardType = StackCardModel
    
    // mandate requirement by `StackCardModelProtocol`
    var id: String
    
    // custom properties for your model object
    var name:String = ""
    var image: String = ""
    
    init(id: String, name: String, image: String) {
        self.id = id
        self.name = name
        self.image = image
    }
}


@State private var stackCardModels:[StackCardModel] =[]
@StateObject private var viewModel = StackCardViewModel<StackCardModel>()

var body: some View {
    VStack {
        ForEach(stackCardModels.reversed(), id: \.id) { card in
            StackCard(model: card, viewModel: viewModel) {
                // content 
                Image(card.image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            }
            .setCardDisplayType(value: .top) 
            .setRotationAngle(value: 20)
            .onRightSwipe {
                print("Right Swipe")
            }
            .onLeftSwipe {
                print("Left Swipe")
            }
        }
        .embedInZStack()
        .bind(model: stackCardModels)
    }
    .onAppear {
       stackCardModels = [
            StackCardModel(id: UUID().uuidString, name: "Park1", image: "park1"),
            StackCardModel(id: UUID().uuidString, name: "Park2", image: "park2"),
            StackCardModel(id: UUID().uuidString, name: "Park3", image: "park3")
       ]
    }
  }
}
```

## Author

Badarinath Venkatnarayansetty.Follow and contact me on <a href="https://twitter.com/badrivm">Twitter</a> or <a href="https://www.linkedin.com/in/badarinath-venkatnarayansetty-abb79146/">LinkedIn</a>

<a href="https://www.buymeacoffee.com/badrinathvm" target="_blank"><img src="https://img.buymeacoffee.com/button-api/?username=badrinathvm&button_colour=FFDD00&font_colour=000000&font_family=Cookie&outline_colour=000000&coffee_colour=FFDD00" alt="Buy Me A Coffee" style="height: 51px !important;width: 200px !important;" ></a>


## Contribution

Feature requests, bug reports, and pull requests are all welcome. Refer <a href="https://github.com/badrinathvm/StackCardView/blob/master/CONTRIBUTING.md">Contributing Guidelines</a> for more details.

## License

StepperView is available under the MIT license. See the [LICENSE](https://github.com/badrinathvm/StackCardView/blob/master/LICENSE) file for more info.

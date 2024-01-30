# StackCardView

#### SwiftUI iOS component for showing stack of cards with swipe and button actions

[![Version](https://img.shields.io/cocoapods/v/StackCardView.svg?style=flat)](https://cocoapods.org/pods/StackCardView)
[![License](https://img.shields.io/cocoapods/l/StackCardView.svg?style=flat)](https://cocoapods.org/pods/StackCardView)
[![Platform](https://img.shields.io/cocoapods/p/StackCardView.svg?style=flat)](https://cocoapods.org/pods/StackCardView)

<br/>
<p align="center">
<img src="https://raw.githubusercontent.com/badrinathvm/StackCardView/master/images/StackCardView.gif" height="450" alt="StepperView"/>
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
.setCardOffset(offset: CGFloat): 
     Sets the offset of the StackCard based on the calculated offset.

.setCardDisplayType(value: StackCardDisplayType): 
    Sets the display type of the StackCard to either .top or .bottom position.

.setRotationAngle(value: CGFloat): 
    Sets the rotation angle of the StackCard to 20 degrees.

.onRightSwipe(perform action: @escaping (() -> Void))
     Executes the provided closure when a right swipe gesture is detected

.onLeftSwipe(perform action: @escaping (() -> Void))
     Executes the provided closure when a left swipe gesture is detected
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

// Step 2 : Create a ViewModel `StackCardViewModel` tie it to model in `Step 1`
@StateObject var viewModel = StackCardViewModel<StackCardModel>()
var body: some View {
    VStack {
        //Step 3:  iterate over the list of cards set in `displayingCards`
        ForEach(viewModel.displayingCards?.reversed() ?? [], id: \.id) { card in
            StackCard(model: card) {
                // content 
                Image(card.image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            }
            .setCardOffset(offset: viewModel.getOffset(card: card))
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
    }
    .onAppear {
       viewModel.displayingCards = [StackCardModel(id: UUID().uuidString, name: "Park1", image: "park1")]
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

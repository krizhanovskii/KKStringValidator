# Swift String validator

### About
Library for easy and fastest `string` validation based on сciterias.

### Instalation
KKStringValidator is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```
pod "KKStringValidator"
```

### Main idea
For project to project you must validate some `input fields`, `strings`, etc for thay accept some criterias (like `length`, exist `uppercase char`, exist `number`, etc).
***KKStringValidator*** helps to check `string` for needed `criterias` to be accepted.

### Core features
- validate `string` by one or `array` of `criterias`
- aviable force fall(break validate) when `criteria` fail
- default `criterias` exist 
- easy add custom `criteria`

### How its works
First, you must take needed `criteria` from the `aviable criterias` or create custom `criteria`. All `criterias` must comform `protocol`:
```swift
protocol Criteriable {
    /// debug string for helps detect problem
    var debugErrorString : String {get}

    /// Check if value comform to criteria
    ///
    /// - Parameter value: value to be checked
    /// - Returns: return true if comform
    func isComform(to value:String) -> Bool
    }
```

Then you can `validate` string by choosed `criterias` by calling:
```swift
StringValidator([\* array of choosed criterias *\]).isValide("" \* string to must be validate *\, forceExit: false, result: { validator in
        switch validator {
            /// all criterias was passed
            case .valid:
            print("All valid")

            /// first failed criteria
            case .notValid(let criteria):
            print(criteria.debugErrorString)

            /// all failed criterias
            case .notValides(let criterias):
            print("Criterias that fails:")
            _ = criterias.map({ 
                print($0.debugErrorString)
            })
        }
    })
```

Thats all. Your string was validated and you get result. 


### List of aviable Criterias
```swift
struct LengthCriteria : Criteriable { \\code } \\ check string length

struct UppercaseLetterExistCriteria : Criteriable { \\code } \\ check string contains one or more char in Uppercase

struct LowercaseLetterExistCriteria : Criteriable { \\code } \\ check string contains one or more char in Lowercase

struct NumberExistCriteria : Criteriable { \\code } \\ check string exist one or more numer

struct RegexpCriteria : Criteriable { \\code } \\ check string must to RegExp
```


### How add custom Criteria
It's easy.
Just create `struct` and comform protocol `Criteriable`.
***Example***:
```swift
struct MyCustomCriteria : Criteriable {
    var debugErrorString: String = debugMessage(MyCustomCriteria.self, message:"some debug message")
    func isComform(to value: String) -> Bool {
        /* some logic for check */
        return false
    }
}
```
Thats all. Simple easy :)


### Example

```swift
    // import lib
    import KKStringValidator



    // Create criterias
    let lennghtCriteria = LengthCriteria(4)
    let regexpCriteria = RegexpCriteria("[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}")
    
    let criterias : [Criteriable] = [lennghtCriteria, UppercaseLetterExistCriteria(), LowercaseLetterExistCriteria(), NumberExistCriteria(), regexpCriteria]


    // validate
    StringValidator(criterias).isValide("q1Q", forceExit: false, result: { validator in
            switch validator {
                case .valid:
                    print("All valid")
                case .notValid(let criteria):
                    print(criteria.debugErrorString)
                case .notValides(let criterias):
                    print("Criterias that fails:")
                    _ = criterias.map({ print($0.debugErrorString)
                    })
                }
        })
    
```

Output:
```swift
Criterias that fails:
DEBUG:LengthCriteria:Lenght less than 10
DEBUG:RegexpCriteria:no mutch to regexp [A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}
```



# Author
k.krizhanovskii, k.krizhanovskii@gmail.com

## License
KKStatusBarService is available under the MIT license. 

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.



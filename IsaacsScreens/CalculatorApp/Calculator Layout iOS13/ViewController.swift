import UIKit
extension NSExpression {
    
    func toFloatingPoint() -> NSExpression {
        switch expressionType {
        case .constantValue:
            if let value = constantValue as? NSNumber {
                return NSExpression(forConstantValue: NSNumber(value: value.doubleValue))
            }
        case .function:
            let newArgs = arguments.map { $0.map { $0.toFloatingPoint() } }
            return NSExpression(forFunction: operand, selectorName: function, arguments: newArgs)
        case .conditional:
            return NSExpression(forConditional: predicate, trueExpression: self.true.toFloatingPoint(), falseExpression: self.false.toFloatingPoint())
        case .unionSet:
            return NSExpression(forUnionSet: left.toFloatingPoint(), with: right.toFloatingPoint())
        case .intersectSet:
            return NSExpression(forIntersectSet: left.toFloatingPoint(), with: right.toFloatingPoint())
        case .minusSet:
            return NSExpression(forMinusSet: left.toFloatingPoint(), with: right.toFloatingPoint())
        case .subquery:
            if let subQuery = collection as? NSExpression {
                return NSExpression(forSubquery: subQuery.toFloatingPoint(), usingIteratorVariable: variable, predicate: predicate)
            }
        case .aggregate:
            if let subExpressions = collection as? [NSExpression] {
                return NSExpression(forAggregate: subExpressions.map { $0.toFloatingPoint() })
            }
        case .anyKey:
            fatalError("anyKey not yet implemented")
        case .block:
            fatalError("block not yet implemented")
        case .evaluatedObject, .variable, .keyPath:
            break // Nothing to do here
        }
        return self
    }
}

let operators = ["÷", "×", "+", "-", "%"]
class ViewController: UIViewController {
    
    @IBOutlet weak var outputDisplay: UILabel!
    @IBOutlet weak var warningLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        warningLabel.text = "";
    }
    var unformattedExpression = ""
    var previousButtonTitle: String?;
    var negative = false;
    @IBAction func buttonPressed(_ sender: UIButton) {
        let buttonTitle = sender.currentTitle ?? "AC";
        
        switch buttonTitle{
        case "%":
            warningLabel.text = "This kills the calculator...please don't kill the calculator. :("
            Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(update), userInfo: nil, repeats: false)
        case "÷", "×", "+", "-" /*The problem operator --> ,"%"*/ :
            if operators.contains(previousButtonTitle ?? "") {
                warningLabel.text = "Next button can not be an operator!"
                Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(update), userInfo: nil, repeats: false)
            }
            else {
                previousButtonTitle = buttonTitle
                unformattedExpression += buttonTitle
                outputDisplay.text = unformattedExpression
            }
        case "=":
            print(unformattedExpression)
            let formattedExpression = unformattedExpression.replacingOccurrences(of: "×", with: "*").replacingOccurrences(of: "÷", with: "/")
            let readyToEvaluateExpn = NSExpression(format: formattedExpression)
            let result = readyToEvaluateExpn.toFloatingPoint().expressionValue(with: nil, context: nil) ?? 0
            let stringResult = String(describing: result)
            previousButtonTitle = buttonTitle;
            unformattedExpression = stringResult;
            outputDisplay.text = stringResult;
            print(unformattedExpression)
        case "AC":
            unformattedExpression = ""
            outputDisplay.text = unformattedExpression
        case "+/-":
            unformattedExpression = "(-1)*" + unformattedExpression
            outputDisplay.text = unformattedExpression;
        default:
            previousButtonTitle = buttonTitle;
            unformattedExpression += buttonTitle;
            outputDisplay.text = unformattedExpression
        }
    }
    @objc func update(){
        warningLabel.text = ""
    }
}


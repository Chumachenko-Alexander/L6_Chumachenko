//
//  main.swift
//  L6_Chumachenko
//
//  Created by Александр Чумаченко on 22.03.2021.
//

import Foundation

struct Car {
    var make: String
    var model: String
}

extension Car: CustomStringConvertible {
    var description : String {
        return "\nМарка: \(make), Модель: \(model)"
    }
}

struct GenericQueue <T> {
    private var elements: [T] = []
    
    mutating func push(_ element: T) {
        elements.append(element)
    }
    
    mutating func pop() -> T? {
        guard elements.count > 0 else { return nil }
        
        return elements.removeFirst()
    }
    
    func printMyQueue() {
        print(elements)
    }
}

extension GenericQueue {
    func myFilter(predicate:(T) -> Bool) -> [T] {
        var result = [T]()
        for i in elements {
            if predicate(i) {
                result.append(i)
            }
        }
        return result
    }
}

extension GenericQueue {
    
    subscript(index: Int) -> T? {
        guard index >= 0 && index <= elements.count else { return nil }
        return elements[index]
    }
}

var queueCar = GenericQueue<Car>()

queueCar.push(Car(make: "Mazda", model: "3"))
queueCar.push(Car(make: "Toyota", model: "Supra"))
queueCar.push(Car(make: "Toyota", model: "Soarer"))
queueCar.push(Car(make: "Tesla", model: "Model 3"))
queueCar.push(Car(make: "Infiniti", model: "Q70"))

queueCar.printMyQueue()

queueCar.pop()

queueCar.printMyQueue()

let filterCar = queueCar.myFilter() {$0.make.hasPrefix("T")}
print(filterCar)

print(queueCar[0])

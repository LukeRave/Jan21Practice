//
//  FormModel+Builder.swift
//  FormApplication
//
//  Created by Luat on 2/22/22.
//

import Foundation

extension FormModel {
    class Builder {
        private var firstName: String?
        private var lastName: String?
        private var age: String?
        private var city: String?
        private var state: String?
        private var address: String?
        private var phoneNumber: String?
        private var SSN: String?
        private var DL: String?
        
        func build() -> FormModel {
            return FormModel(
                firstName: firstName ?? "No First Name",
                lastName: lastName ?? "No Last Name",
                age: age ?? "No Age",
                city: city ?? "No City",
                state: state ?? "No State",
                address: address ?? "No Address",
                phoneNumber: phoneNumber ?? "No Phone Number",
                SSN: SSN ?? "No SSN",
                DL: DL ?? "No DL")
        }
        
        func set(firstName: String) -> Builder {
            self.firstName = firstName
            return self
        }
        func set(lastName: String) -> Builder {
            self.lastName = lastName
            return self
        }
        func set(age: String) -> Builder {
            self.age = age
            return self
        }
        func set(city: String) -> Builder {
            self.city = city
            return self
        }
        func set(state: String) -> Builder {
            self.state = state
            return self
        }
        func set(address: String) -> Builder {
            self.address = address
            return self
        }
        func set(phoneNumber: String) -> Builder {
            self.phoneNumber = phoneNumber
            return self
        }
        func set(SSN: String) -> Builder {
            self.SSN = SSN
            return self
        }
        func set(DL: String) -> Builder {
            self.DL = DL
            return self
        }
        
    }
}

import Foundation

protocol WeatherManagerDelegate {
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel)
    func didFailWithError(error: Error)
}

struct WeatherManager {
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?units=imperial&appid=091f8064edc2b806ed089eb57f11310d"
    
    var delegate: WeatherManagerDelegate?
    
    func fetchWeather(cityName: String, stateName: String?) {
        var urlAsString = "\(weatherURL)&q=\(cityName)"
        if stateName != nil {
            urlAsString += ",US=" + stateName!
        }
        performRequest(with: urlAsString)
    }
    
    func convertStateToAbbrev(nonOptStateName: String) -> String{
        let lowercaseStateName = nonOptStateName.lowercased()
        switch lowercaseStateName {
        case "alabama": return "AL"
        case "alaska": return "AK"
        case "arizona": return "AZ"
        case "arkansas": return "AR"
        case "california": return "CA"
        case "colorado": return "CO"
        case "connecticut": return "CT"
        case "delaware": return "DE"
        case "florida": return "FL"
        case "georgia": return "GA"
        case "hawaii": return "HI"
        case "idaho": return "ID"
        case "illinois": return "IL"
        case "indiana": return "IN"
        case "iowa": return "IA"
        case "kansas": return "KS"
        case "kentucky": return "KY"
        case "louisiana": return "LA"
        case "maine": return "ME"
        case "maryland": return "MD"
        case "massachusetts": return "MA"
        case "michigan": return "MI"
        case "minnesota": return "MN"
        case "mississippi": return "MS"
        case "missouri": return "MO"
        case "montana": return "MT"
        case "nebraska": return "NE"
        case "nevada": return "NV"
        case "new hampshire": return "NH"
        case "new jersey": return "NJ"
        case "new mexico": return "NM"
        case "new york": return "NY"
        case "north carolina": return "NC"
        case "north dakota": return "ND"
        case "ohio": return "OH"
        case "oklahoma": return "OK"
        case "oregon": return "OR"
        case "pennsylvania": return "PA"
        case "rhode island": return "RI"
        case "south carolina": return "SC"
        case "south dakota": return "SD"
        case "tennessee": return "TN"
        case "texas": return "TX"
        case "utah": return "UT"
        case "vermont": return "VT"
        case "virginia": return "VA"
        case "washington": return "WA"
        case "west virginia": return "WV"
        case "wisconsin": return "WI"
        case "wyoming": return "WY"
        default: return "ZZ"
        }
    }
    func performRequest(with urlString: String){
        if let url = URL(string: urlString){
            let session = URLSession(configuration: .default)
            
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    self.delegate?.didFailWithError(error: error!)
                    return
                }
                
                if let safeData = data {
                    if let weather = self.parseJSON(safeData){
                        self.delegate?.didUpdateWeather(self, weather: weather)
                    }
                }
            }
            
            task.resume()
        }
    }
    
    func parseJSON(_ weatherData: Data) -> WeatherModel? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            let id = decodedData.weather[0].id
            let temp = decodedData.main.temp
            let name = decodedData.name
            
            let weather = WeatherModel(conditionId: id, cityName: name, temperature: temp)
            return weather
        }
        catch{
            delegate?.didFailWithError(error: error)
            return nil
        }
    }

}

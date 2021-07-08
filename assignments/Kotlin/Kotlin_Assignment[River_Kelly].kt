/**
 * River Kelly
 * Apr 5, 2021
 * CSCI-305
 * Kotlin Assignment
 * 
 * 
 * play.kotlinlang.org
 */


// City data class
data class City(val name: String, val latitude: Double, val longitude: Double)


// Step 2: listCities() function
// returns a list of city objects
fun listCities(): List<City> {
    return listOf(
    	City("Atlanta", 33.7490, -84.3880),
        City("Bozeman", 45.6770, -111.0429),
        City("New York", 40.7128, -74.0060),
        City("San Francisco", 37.7749, -122.4194),
        City("Tacoma", 47.2529, -122.4443)
    )
}


// Step 3: distanceFromSeattle()
// takes as a param a City object and return the distance in kilometers (Double) between that city
// and Seattle, WA (latitude: 47.6062, longitude: -122.3321)
fun distanceFromSeattle(fromCity: City) : Double {
    return haversine(47.6062, -122.3321, fromCity.latitude, fromCity.longitude)
}


// haversine() - PROVIDED
// calculate the distance in km between two points on the globe.
fun haversine(lat1: Double, lon1: Double, lat2: Double, lon2: Double): Double {
	val R = 6372.8 // in kilometers
	val l1 = Math.toRadians(lat1)
	val l2 = Math.toRadians(lat2)
	val dl = Math.toRadians(lat2 - lat1)
	val dr = Math.toRadians(lon2 - lon1)
	return 2 * R * Math.asin(Math.sqrt(Math.pow(Math.sin(dl / 2), 2.0) + Math.pow(Math.sin(dr / 2), 2.0) * Math.cos(l1) * Math.cos(l2)))
}



// main()
// -----------------------
// starting point of the program...
fun main() {
    
    // Step 1
	// get the list of cities
    var cityLocations = listCities()
    
    println("**********Step Two**********")
    println(cityLocations)
    println()
    
    
    // println("Step 3: Distance between Seattle and Tacoma")
    println("**********Step Three**********")
    println("The distance between Seattle and Tacoma is")
    for(city in cityLocations) {
        when(city.name) {
            "Tacoma" -> print(distanceFromSeattle(city))
        }
    }
    println(" km")
    println()
    
    
    // println("Step 4: list of distance between the cities and Seattle")
    println("**********Step Four**********")
    println("A new List with the distances of all cities in list to Seattle:")
    println(cityLocations.map{ city -> distanceFromSeattle(city) })
    println()
    
    //println("Step 5: Filter the list with an anonymous function, further away than 1000km from Seattle")
    println("**********Step Five**********")
    println("List of cities over 1000KM from Seattle (used the return list from the Filter function and just printed the city name)")
    cityLocations.filter{ city -> distanceFromSeattle(city) > 1000 }.map{ city -> println(city.name) }
    println()
    
    //println("Step 6: List of city names West of the Mississippi River")
    println("**********Step Six**********")
    cityLocations.filter{ city -> city.longitude < -89.97803 }.map{ city -> city.name }.map{ it -> println(it) }
    println()
    
    //println("Step 7: City furthest east from Seattle")
    println("**********Step Seven**********")
    print("Max Distance: ")
    println(cityLocations.maxByOrNull{ it -> distanceFromSeattle(it) }) // maxBy depreciated - was getting warnings
    println()
    
    
    var mappedCities: Map<String, City> = cityLocations.map{ it.name to it }.toMap()
    //println("Step 8: Create new variable 'mappedCities'")
    println("**********Step Eight**********")
    mappedCities.forEach() {
        name, city -> println("Name $name: City: $city")
    }
    println()
    
    
    var myCity = "Bozeman"
    // println("Step 8.b: Print out my cities latitude using the key-value to identify")
    // println("**********Step Eight.B**********")
    // 
    if(mappedCities.containsKey(myCity)) {
        print("The latitude for Bozeman is ")
     	println(mappedCities.getValue(myCity).latitude)
    }
}

/**
 * OUTPUT
 * 

**********Step Two**********
[City(name=Atlanta, latitude=33.749, longitude=-84.388), City(name=Bozeman, latitude=45.677, longitude=-111.0429), City(name=New York, latitude=40.7128, longitude=-74.006), City(name=San Francisco, latitude=37.7749, longitude=-122.4194), City(name=Tacoma, latitude=47.2529, longitude=-122.4443)]

**********Step Three**********
The distance between Seattle and Tacoma is
40.19290553996769 km

**********Step Four**********
A new List with the distances of all cities in list to Seattle:
[3506.672723087685, 887.4977864782966, 3866.6204789528556, 1093.5226297469185, 40.19290553996769]

**********Step Five**********
List of cities over 1000KM from Seattle (used the return list from the Filter function and just printed the city name)
Atlanta
New York
San Francisco

**********Step Six**********
Bozeman
San Francisco
Tacoma

**********Step Seven**********
Max Distance: City(name=New York, latitude=40.7128, longitude=-74.006)

**********Step Eight**********
Name Atlanta: City: City(name=Atlanta, latitude=33.749, longitude=-84.388)
Name Bozeman: City: City(name=Bozeman, latitude=45.677, longitude=-111.0429)
Name New York: City: City(name=New York, latitude=40.7128, longitude=-74.006)
Name San Francisco: City: City(name=San Francisco, latitude=37.7749, longitude=-122.4194)
Name Tacoma: City: City(name=Tacoma, latitude=47.2529, longitude=-122.4443)

The latitude for Bozeman is 45.677

 */
import UIKit

func missingNumber(_ arr: [Int]) -> Int {
    let arrCount = arr.count
    var nums = arr
    
    // Step 1: Rearrange the numbers to their correct positions
    for i in 0..<arrCount {
        
        while nums[i] > 0 && nums[i] <= arrCount && nums[nums[i] - 1] != nums[i] {
            let temp = nums[i]
            nums[i] = nums[temp - 1]
            nums[temp - 1] = temp
        }
    }
    
    // Step 2: Find the smallest missing positive number
    for i in 0..<arrCount {
        if nums[i] != i + 1 {
            return i + 1
        }
    }
    
    // Step 3: If all numbers from 1 to arrCount are present, return arrCount+1
    return arrCount + 1
}

// Example usage:
let arr1 = [1, 2, 3, 4, 5]
print(missingNumber(arr1))   // Output: 6

let arr2 = [0, -10, 1, 3, -20]
print(missingNumber(arr2))  // Output: 2

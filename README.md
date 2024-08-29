### iOS Task:
```
- Create an iOS application using VIPER architecture.
- Application consists of three screens. (Intro screen, Posts list screen, post details screen)
- Splash screen contains Logo and animation.
- Use this public API https://jsonplaceholder.typicode.com/ .
- Consume the posts API and show a list of posts in a good and presentable UI.
- Your application should show a paginated list of posts and load data as you scroll down. Also implement swipe to refresh behavior.
- You should cache the list of posts and display the cached list first then load the updated data from the API and invalidate the data in the list.
- When a post item is clicked a third screen opens to show the full post data in a presentable and good UI.
- Inside the post screen create a Like button with a good animation of your creation (does no actual API call).
- Implementing unit-tests would be a plus.
- Write the project in Swift
```

### Problem Solving:
```
You are given an array arr[] of N integers including 0. The task is to find the smallest positive number missing from the array.

Example 1:
Input:
N = 5
arr[] = {1,2,3,4,5}
Output: 6
Explanation: Smallest positive missing 
number is 6.

Example 2:
Input:
N = 5
arr[] = {0,-10,1,3,-20}
Output: 2
Explanation: Smallest positive missing 
number is 2.
Your Task:
The task is to complete the function missingNumber() which returns the smallest positive missing number in the array.

Expected Time Complexity: O(N).
Expected Auxiliary Space: O(1).

Constraints:
1 <= N <= 106
-106 <= arr[i] <= 106
```

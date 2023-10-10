class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var dictionary = [Int: Int]()

        for i in 0..<nums.count {
            if dictionary[target - nums[i]] != nil {
                return [i, dictionary[target - nums[i]]!]
            }
            dictionary[nums[i]] = i
        }
        return [0, 0]
    }
}

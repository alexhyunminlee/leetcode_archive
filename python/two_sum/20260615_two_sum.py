class Solution:
    def twoSum(self, nums: List[int], target: int) -> List[int]:
        if len(nums) == 2:
            return [0, 1]
        
        sorted_nums = sorted(enumerate(nums), key=lambda x:x[1])

        low = 0
        high = len(nums) - 1
        while (sum := sorted_nums[low][1] + sorted_nums[high][1]) != target:
            if sum > target:
                high -= 1
            else:
                low += 1
        return [sorted_nums[low][0], sorted_nums[high][0]]

class Solution:
    def twoSum(self, nums: List[int], target: int) -> List[int]:
        if len(nums) == 2:
            return [0, 1]
        
        map = {}
        for i, cur in enumerate(nums):
            if (diff := target - cur) in map.keys():
                return [i, map[diff]]
            else:
                map[cur] = i
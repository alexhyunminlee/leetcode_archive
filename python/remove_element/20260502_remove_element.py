class Solution:
    def removeElement(self, nums: List[int], val: int) -> int:
        # Edge cases
        if len(nums) == 0:
            return 0
        
        # Initialize counters and index pointers
        k = 0
        i = 0
        j = -1
        
        tmp = 0
        for _ in range(len(nums)):
            if nums[j] == val:
                k += 1
                j -= 1
            else:
                tmp = nums[j]
                nums[j] = nums[i]
                nums[i] = tmp
                i += 1
        return (len(nums) +  - k)

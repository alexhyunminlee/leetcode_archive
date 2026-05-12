class Solution:
    def removeDuplicates(self, nums: List[int]) -> int:
        i = 1
        k = 1
        current = nums[0]

        for j in range(1, len(nums)):
            if current < nums[j]:
                k += 1
                current = nums[j]
                nums[i] = current
                i += 1
        return k

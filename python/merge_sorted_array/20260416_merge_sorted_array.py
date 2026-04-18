class Solution:
    def merge(self, nums1: List[int], m: int, nums2: List[int], n: int) -> None:
        """
        Do not return anything, modify nums1 in-place instead.
        """

        # Edge cases: either or both are empty
        if n == 0:
            return
        if m == 0:
            nums1[:] = nums2
            return

        i_1 = m - 1
        i_2 = n - 1
        for i in range(m+n-1,  -1 , -1):
            if nums1[i_1] >= nums2[i_2]:
                nums1[i] = nums1[i_1]
                i_1 -= 1
                if i_1 < 0:
                    nums1[:i_2+1] = nums2[:i_2+1]
                    return
            else:
                nums1[i] = nums2[i_2]
                i_2 -= 1
                if i_2 < 0:
                    return
        return
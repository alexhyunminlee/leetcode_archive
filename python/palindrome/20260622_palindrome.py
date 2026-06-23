class Solution:
    def isPalindrome(self, x: int) -> bool:
        if x < 0:
            return False
        reverse = 0
        copy = x
        while x != 0:
            remainder = x % 10
            reverse = reverse * 10 + remainder
            x = x // 10
        return reverse == copy


class Solution:
    def isPalindrome(self, x: int) -> bool:
        if x < 0 or (x % 10 == 0 and x != 0):
            return False
        reverse = 0
        while x > reverse:
            reverse = reverse * 10 + x % 10
            x = x // 10
        return reverse == x or (reverse // 10) == x
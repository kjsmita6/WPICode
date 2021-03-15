def isreverse(s1, s2):
    # Your code here
    if len(s1) == 0 and len(s2) == 0:
        return True
    if len(s1) != len(s2) or s1[0] != s2[-1]:
        return False
    return isreverse(s1[1:], s2[:-1])

string = input()
arr = string[0]
for char in string[1:]:
    arr += ", "
    arr += char

print(arr)
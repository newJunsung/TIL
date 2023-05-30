def solution(new_id):
    modi = str(new_id)

    modi = modi.lower()
    
    for i in modi:
        if not i.isalnum():
            if (i != ".") and (i != "_") and (i != "-"):
                modi = modi.replace(i, "")

    while(modi.find("..") != -1):
        modi = modi.replace("..", ".")

    if modi[0] == ".":
        modi = modi.lstrip(".")
        if modi == "":
            modi = "a"
    if modi[len(modi)-1] == ".":
        modi = modi.rstrip(".")

    if len(modi) >= 16:
        modi = modi[:15]
        if modi[len(modi)-1] == ".":
            modi = modi[:len(modi)-1]

    if len(modi) <= 2:
        while True:
            modi = modi + modi[len(modi)-1]
            if len(modi) == 3:
                break

    answer = modi
    return answer

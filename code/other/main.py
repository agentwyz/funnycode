
'''
I will create "abstract objects" at constructor calls
obj.x --> create a object

Actually change the abstract objects when fields are created
obj.x = 3

classes are not affect by  the change
'''


import sys















def infer(exp, env, stk):
    if IS(exp, Module):
        return infer(exp.body, env, stk)

    elif Is(exp, Name):
        b = lookup(exp.id, env)
        if b is not None:
            putInfo(exp, b)
            return b
    elif Is(exp, Lambda):
        #首先返回闭包
        c = Closure(exp, env)
        for d in exp.args.defaults:
            dt = infer(d, env, stk)
            c.defaults.append(dt)

        return [c]

    elif Is(exp, Call):
        return invoke(exp, env, stk)
    else:
        return [UnkownType()]


    

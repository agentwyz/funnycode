-record(Name, {
    %%下面两个键带有默认值
    key1 = Default1,
    key2 = Default2,
    }).

-record(todo, {
    status = reminder,
    who = joe, text
}).